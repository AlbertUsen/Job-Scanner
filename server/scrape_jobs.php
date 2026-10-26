<?php
// Set headers for JSON response and cross-origin access
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// Database configuration
$host = "localhost";
$db_name = "tech_job_scanner";
$username = "root";
$password = ""; // Default XAMPP password is empty

try {
    // Establish PDO MySQL connection
    $conn = new PDO("mysql:host=" . $host . ";dbname=" . $db_name, $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Fetch live job data from RemoteOK public API with a standard User-Agent header
    $opts = [
        "http" => [
            "header" => "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
        ]
    ];
    $context = stream_context_create($opts);
    $api_url = "https://remoteok.com/api";
    
    $response = file_get_contents($api_url, false, $context);
    
    if ($response === FALSE) {
        throw new Exception("Failed to fetch job data from the external API.");
    }

    $jobs_data = json_decode($response, true);
    
    // RemoteOK returns system metadata as the first array element, so we strip it off
    if (is_array($jobs_data) && count($jobs_data) > 0) {
        array_shift($jobs_data); 
    }

    $inserted_count = 0;
    $duplicate_count = 0;

    // Prepared statements for performance and security
    $check_stmt = $conn->prepare("SELECT id FROM jobs WHERE application_link = ?");
    $insert_stmt = $conn->prepare("INSERT INTO jobs (title, company, location, tech_stack, salary_range, application_link) VALUES (?, ?, ?, ?, ?, ?)");

    // Loop through retrieved jobs and insert new ones
    foreach ($jobs_data as $job) {
        // Ensure core attributes exist
        if (!isset($job['position']) || !isset($job['company']) || !isset($job['url'])) {
            continue;
        }

        $title = $job['position'];
        $company = $job['company'];
        $location = isset($job['location']) && !empty($job['location']) ? $job['location'] : 'Remote';
        
        // Convert tags array to a comma-separated string for your tech stack column
        $tags_array = isset($job['tags']) ? $job['tags'] : ['Remote', 'Developer'];
        $tech_stack = is_array($tags_array) ? implode(', ', $tags_array) : 'Tech, Development';
        
        // Format salary range cleanly if available
        $salary = 'Competitive';
        if (isset($job['salary_min']) && isset($job['salary_max'])) {
            $salary = '$' . number_format($job['salary_min']) . ' - $' . number_format($job['salary_max']);
        } elseif (isset($job['salary'])) {
            $salary = $job['salary'];
        }

        $application_link = $job['url'];

        // Check if this job already exists in your database using its application link
        $check_stmt->execute([$application_link]);
        if ($check_stmt->rowCount() > 0) {
            $duplicate_count++;
            continue; // Skip duplicate
        }

        // Insert fresh job record into MySQL
        $insert_stmt->execute([$title, $company, $location, $tech_stack, $salary, $application_link]);
        $inserted_count++;

        // Limit ingestion to 25 fresh jobs per run to ensure fast script execution
        if ($inserted_count >= 25) {
            break;
        }
    }

    // Output success payload
    echo json_encode([
        "status" => "success",
        "message" => "Job scraper executed successfully.",
        "new_jobs_inserted" => $inserted_count,
        "duplicates_skipped" => $duplicate_count
    ]);

} catch(Exception $e) {
    http_response_code(500);
    echo json_encode([
        "status" => "error",
        "message" => "Scraper execution error: " . $e->getMessage()
    ]);
}
?>