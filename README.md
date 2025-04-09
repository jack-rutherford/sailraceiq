# SailRace IQ – Sailing Race Analyzer & Replay Tool

**SailRace IQ** is a full-stack application designed to help competitive sailors analyze, replay, and learn from their sailing races. Users can upload GPS logs, visualize their performance overlaid with wind and current data, and access tactical metrics like VMG, tacking efficiency, and layline accuracy.

## Features

- 📂 Upload GPS data (GPX, CSV, or NMEA)
- 📉 Animated race replay on an interactive map
- 🌬️ Weather & wind overlays synced with race time
- ⏱ Leg times, tack counts, and time loss metrics
- 🎮 Compare multiple boats in the same race
- 📈 Tactical analysis: laylines, VMG, wind shifts
- 📚 Auto-generated race debrief reports (PDF export)

## Target Users

- Sailboat racing teams (college, club, pro)
- Individual sailors interested in performance feedback
- Coaches analyzing team maneuvers
- Regatta organizers offering value-added services

## Tech Stack

### Backend
- Python 3.11
- FastAPI
- PostgreSQL
- Redis (caching and task queues)
- Celery for async background analytics jobs
- GPX and CSV parsers (using `gpxpy`, `pandas`, or custom)

### Frontend (optional)
- React or Flutter Web
- Mapbox or Leaflet for map playback
- Chart.js or Recharts for tactical visualizations

### DevOps
- Docker + Docker Compose
- Optional Kubernetes setup for worker scaling

## Project Structure

```
sailraceiq/
├── backend/
│   ├── app/
│   │   ├── main.py
│   │   ├── api/
│   │   ├── services/
│   │   ├── models/       # Pydantic and ORM schemas
│   │   ├── workers/      # Celery task runners
│   │   └── utils/        # GPX parsers, time sync logic
├── frontend/
├── docker-compose.yml
└── README.md
```

## Getting Started

### Prerequisites
- Docker + Docker Compose
- OpenWeatherMap or Windy API Key (optional)

### Run the App
```bash
git clone https://github.com/your-username/sailraceiq.git
cd sailraceiq
cp .env.example .env  # Add your credentials and config

docker-compose up --build
```

Open API Docs at: `http://localhost:8000/docs`

## API Endpoints (Sample)
```http
POST /api/v1/upload/gpx                # Upload race log file
GET  /api/v1/races/:id/replay          # Get replay data for visualizer
GET  /api/v1/races/:id/analytics       # Tactical breakdown
GET  /api/v1/races/:id/weather-overlay # Get synced weather info
```

## Roadmap

- [ ] Upload support for CSV + NMEA
- [ ] Wind shift & layline detection
- [ ] PDF report generation
- [ ] Team profiles and boat comparison dashboard
- [ ] Multi-race season analytics

## License
MIT

## Author
Your Name • [LinkedIn](#) • [Portfolio](#)
