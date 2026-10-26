import { useState, useEffect } from 'react';
import { 
  Search, 
  Briefcase, 
  MapPin, 
  DollarSign, 
  Bookmark, 
  Filter, 
  Code, 
  ExternalLink,
  Sparkles,
  RefreshCw
} from 'lucide-react';
import './App.css';

export default function App() {
  const [jobs, setJobs] = useState([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedRole, setSelectedRole] = useState('All');
  const [savedJobIds, setSavedJobIds] = useState([]);

  function fetchJobs() {
  setLoading(true);
  fetch('http://localhost/tech-job-scanner-api/get_jobs.php')
    .then((res) => res.json())
    .then((response) => {
      if (response.status === 'success') {
        setJobs(response.data);
      }
      setLoading(false);
    })
    .catch((error) => {
      console.error('Error fetching jobs:', error);
      setLoading(false);
    });
}

  useEffect(() => {
    fetchJobs();
  }, []);
  

  const toggleSaveJob = (id) => {
    if (savedJobIds.includes(id)) {
      setSavedJobIds(savedJobIds.filter((jobId) => jobId !== id));
    } else {
      setSavedJobIds([...savedJobIds, id]);
    }
  };

  const filteredJobs = jobs.filter((job) => {
    const matchesSearch = 
      job.title.toLowerCase().includes(searchTerm.toLowerCase()) ||
      job.company.toLowerCase().includes(searchTerm.toLowerCase()) ||
      job.tech_stack.toLowerCase().includes(searchTerm.toLowerCase());

    const matchesRole = 
      selectedRole === 'All' || 
      (selectedRole === 'Frontend' && (job.title.toLowerCase().includes('frontend') || job.tech_stack.toLowerCase().includes('frontend'))) ||
      (selectedRole === 'Full Stack' && (job.title.toLowerCase().includes('full stack') || job.tech_stack.toLowerCase().includes('fullstack')));

    return matchesSearch && matchesRole;
  });

  // Clean salary string to avoid double $$
  const formatSalary = (salary) => {
    if (!salary) return 'Competitive';
    return salary.replace(/\$\$/g, '$');
  };

  

  return (
    <div className="app-container">
      {/* Header */}
      <header className="navbar">
        <div className="logo-container">
          <Sparkles className="logo-icon" />
          <span className="logo-text">TechScan Agent</span>
        </div>
        <div className="user-profile">
          <span className="user-name">Albert Usen</span>
          <div className="avatar">AU</div>
        </div>
      </header>

      {/* Main Content */}
      <main className="main-content">
        {/* Search & Filter Bar */}
        <section className="search-section">
          <div className="search-bar">
            <Search className="search-icon" size={18} />
            <input 
              type="text" 
              placeholder="Search by job title, company, or stack (e.g., React, PHP)..." 
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
            />
          </div>

          <div className="filter-controls">
            <div className="filter-group">
              <Filter className="filter-icon" size={16} />
              <button 
                className={`filter-btn ${selectedRole === 'All' ? 'active' : ''}`}
                onClick={() => setSelectedRole('All')}
              >
                All Roles
              </button>
              <button 
                className={`filter-btn ${selectedRole === 'Frontend' ? 'active' : ''}`}
                onClick={() => setSelectedRole('Frontend')}
              >
                Frontend
              </button>
              <button 
                className={`filter-btn ${selectedRole === 'Full Stack' ? 'active' : ''}`}
                onClick={() => setSelectedRole('Full Stack')}
              >
                Full Stack
              </button>
            </div>

            <button className="refresh-btn" onClick={fetchJobs} title="Refresh Jobs">
              <RefreshCw size={18} />
            </button>
          </div>
        </section>

        {/* Job Listings Grid */}
        <section className="jobs-section">
          {loading ? (
            <div className="state-card loading-state">
              <RefreshCw className="spinner" size={32} />
              <p>Scanning database for live opportunities...</p>
            </div>
          ) : filteredJobs.length === 0 ? (
            <div className="state-card empty-state">
              <Briefcase size={36} />
              <p>No matching tech jobs found. Try adjusting your search query.</p>
            </div>
          ) : (
            <div className="jobs-grid">
              {filteredJobs.map((job) => {
                const isSaved = savedJobIds.includes(job.id);
                // Split tech_stack by comma
                const tags = job.tech_stack ? job.tech_stack.split(',').map(t => t.trim()).filter(Boolean) : [];

                return (
                  <div key={job.id} className="job-card">
                    <div className="job-header">
                      <div>
                        <h3 className="job-title">{job.title}</h3>
                        <p className="company-name">{job.company}</p>
                      </div>
                      <button 
                        className={`bookmark-btn ${isSaved ? 'saved' : ''}`}
                        onClick={() => toggleSaveJob(job.id)}
                        title={isSaved ? "Remove from saved" : "Save job"}
                      >
                        <Bookmark size={20} fill={isSaved ? "currentColor" : "none"} />
                      </button>
                    </div>

                    <div className="job-details">
                      <div className="detail-item">
                        <MapPin size={16} />
                        <span>{job.location}</span>
                      </div>
                      <div className="detail-item">
                        <DollarSign size={16} />
                        <span>{formatSalary(job.salary_range)}</span>
                      </div>
                    </div>

                    <div className="tech-stack-container">
                      <Code size={16} className="tech-icon" />
                      <div className="tech-tags">
                        {tags.map((tech, idx) => (
                          <span key={idx} className="tech-badge">{tech}</span>
                        ))}
                      </div>
                    </div>

                    <div className="job-footer">
                      <span className="post-date">
                        Posted {new Date(job.created_at).toLocaleDateString()}
                      </span>
                      <a 
                        href={job.application_link} 
                        target="_blank" 
                        rel="noopener noreferrer"
                        className="apply-btn"
                      >
                        Apply Now <ExternalLink size={16} />
                      </a>
                    </div>
                  </div>
                );
              })}
            </div>
          )}
        </section>
      </main>
    </div>
  );
}