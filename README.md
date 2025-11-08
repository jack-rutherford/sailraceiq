# **SailRace IQ – Weather-Integrated Sailing Race Analyzer**

**SailRace IQ** is a full-stack application designed to help competitive sailors and race officials **analyze, replay, and learn from sailing races**. The platform combines GPS-based race tracking with **real-time weather intelligence**, offering tactical metrics and visualizations that enhance decision-making on the water.

---

## 🚀 Overview

SailRace IQ allows users to:
- Upload and visualize race data on an interactive map  
- Replay races overlaid with live or historical weather data  
- Access performance analytics like **VMG**, **tacking efficiency**, and **layline accuracy**  
- Generate **automated debrief reports** for post-race analysis  
- (Coming soon) Compare boats and track season-long performance

---

## 🧭 Key Features

- 📂 Upload GPS logs (`.gpx`, `.csv`, `.nmea`)
- 🗺️ Interactive race playback with weather overlays (wind, pressure, currents)
- 📉 Tactical analysis: VMG, tack efficiency, layline accuracy, wind shifts
- 🧠 Automated data processing via Celery workers and Redis
- 🧾 Race debrief report export (PDF)
- ⚙️ Scalable backend deployed via **Docker + AWS + Terraform**
- 🔄 RESTful API built with FastAPI for future frontend or mobile integrations

---

## 👥 Target Users

- Collegiate and club racing teams  
- Individual sailors looking to analyze performance  
- Coaches and tactical analysts  
- Regatta officials seeking automated replay or scoring extensions

---

## 🧱 Tech Stack

### **Backend**
- **Python 3.13**, **FastAPI**
- **SQLAlchemy ORM** + **PostgreSQL** (RDS in production)
- **Redis** for caching and background queueing  
- **Celery** for asynchronous analytics jobs  
- **GPX / CSV parsers** via `pandas`, `gpxpy`, and custom parsing utils  
- **FastAPI OpenAPI Docs** for developer access  

### **Infrastructure / DevOps**
- **Docker** + **Docker Compose** for local and production builds  
- **Terraform** for Infrastructure-as-Code (AWS RDS, ECS, networking)  
- **AWS ECS** (API + Celery Workers), **RDS** (PostgreSQL), and **S3** (data storage)  
- (Planned) GitHub Actions CI/CD pipeline for automated deploys  

### **Frontend (Planned)**
- **React** or **Flutter Web**
- **Mapbox** or **Leaflet** for map playback  
- **Recharts** / **Chart.js** for tactical visualizations  

---

## 📂 Project Structure

```
sailraceiq/
├── server/
│ ├── src/server
│ │ ├── main.py
│ │ ├── api/ # REST endpoints
│ │ ├── services/ # Race analytics & weather logic
│ │ ├── models/ # Pydantic + SQLAlchemy schemas
│ │ ├── workers/ # Celery background tasks
│ │ └── utils/ # GPX parsers, time sync, weather tools
├── infrastructure/
│ ├── terraform/ # AWS infrastructure as code
│ ├── docker/ # Docker + Compose configs
├── compose.dev.yaml
├── compose.prod.yaml
├── .env.example
├── .gitignore
└── README.md
```

## ⚡ Getting Started

### **Prerequisites**
- **Docker** + **Docker Compose**  
- **AWS account** (optional, for Terraform deployment)  
- **OpenWeatherMap** or **Windy API key** (optional for weather overlays)  

---

### **Run Locally**

```bash
git clone https://github.com/jack-rutherford/sailraceiq.git
cd sailraceiq
cp .env.example .env  # Add credentials (DB, Redis, API keys)
docker compose -f compose.dev.yaml up
```

Once running, access the API documentation at:  
👉 **[http://localhost:8000/docs](http://localhost:8000/docs)**

---

## 🔌 Sample API Endpoints

```http
POST /api/v1/upload/gpx                # Upload race log
GET  /api/v1/races/:id/replay          # Fetch replay data for visualization
GET  /api/v1/races/:id/analytics       # Retrieve tactical metrics
GET  /api/v1/races/:id/weather-overlay # Access synced weather info
```

## 🗺️ Roadmap

- [x] Dockerized FastAPI backend  
- [x] Local analytics pipeline with Celery + Redis  
- [x] Terraform setup for AWS infrastructure  
- [ ] Live AWS deployment (ECS + RDS + S3)  
- [ ] Wind shift & layline detection  
- [ ] Auto-generated PDF reports  
- [ ] Boat comparison dashboard  
- [ ] Season analytics + user accounts  

## License
MIT

## Author
Jack C. Rutherford • [LinkedIn](https://www.linkedin.com/in/jack-rutherford-70b0ba252/) • [Portfolio](#)
