# 🚀 Tech Job Scanner

A full-stack automated job search platform that aggregates remote frontend engineering roles, parses job metadata, and displays listings in a modern React interface.

## 🛠️ Tech Stack
- **Frontend:** React, Vite, Lucide Icons, Vanilla CSS
- **Backend:** PHP, MySQL (XAMPP), RemoteOK REST API

## 📋 Features
- Automated job ingestion and database synchronization.
- Filter and search by tech stack badges and location.
- Fast, interactive React frontend dashboard.

## 💻 Local Setup Instructions
1. **Database:** Import `server/schema.sql` into MySQL / phpMyAdmin.
2. **Backend:** Place `server/` scripts into your XAMPP `htdocs` directory.
3. **Frontend:**
   ```bash
   cd client
   npm install
   npm run dev