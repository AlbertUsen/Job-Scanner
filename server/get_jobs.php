<?php
// Set CORS headers so your Vite frontend (running on localhost:5173) can make API calls without browser blocking
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");

// Database configuration
$host = "localhost";
$db_name = "tech_job_scanner";
$username = "root";
$password = ""; // Default XAMPP password is empty

try {
    // Establish PDO MySQL connection
    $conn = new PDO("mysql:host=" . $host . ";dbname=" . $db_name, $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Fetch all jobs ordered by newest first
    $query = "SELECT id, title, company, location, tech_stack, salary_range, application_link, created_at FROM jobs ORDER BY created_at DESC";
    $stmt = $conn->prepare($query);
    $stmt->execute();

    $jobs = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Output clean JSON response
    echo json_encode([
        "status" => "success",
        "count" => count($jobs),
        "data" => $jobs
    ]);

} catch(PDOException $exception) {
    http_response_code(500);
    echo json_encode([
        "status" => "error",
        "message" => "Database connection error: " . $exception->getMessage()
    ]);
}
?>