# # What is an Async Task System?
# # ----------------------------------
# # An async task system lets you offload long or blocking operations
# # (e.g., GPX parsing, weather sync, analytics computation) from your
# # main API so it stays responsive. You queue tasks to a worker service.
# # We'll use Celery + Redis for this.

# # ================================
# # DATABASE SCHEMA (SQLAlchemy)
# # ================================

# # backend/app/models/schemas.py
# from sqlalchemy import Column, Integer, String, Float, ForeignKey, DateTime
# from sqlalchemy.orm import relationship
# from sqlalchemy.ext.declarative import declarative_base

# Base = declarative_base()

# class Race(Base):
#     __tablename__ = "races"
#     id = Column(Integer, primary_key=True, index=True)
#     name = Column(String)
#     user_id = Column(Integer, index=True)
#     created_at = Column(DateTime)
#     status = Column(String, default="pending")
#     trackpoints = relationship("TrackPoint", back_populates="race")

# class TrackPoint(Base):
#     __tablename__ = "trackpoints"
#     id = Column(Integer, primary_key=True)
#     race_id = Column(Integer, ForeignKey("races.id"))
#     timestamp = Column(DateTime)
#     lat = Column(Float)
#     lon = Column(Float)
#     elevation = Column(Float)
#     race = relationship("Race", back_populates="trackpoints")

# # ================================
# # CELERY TASK SETUP
# # ================================

# # backend/app/workers/tasks.py
# from celery import Celery
# from app.utils.gpx_parser import parse_gpx
# from app.db import SessionLocal
# from app.models.schemas import Race, TrackPoint
# import io
# from datetime import datetime

# celery = Celery("worker", broker="redis://redis:6379/0")

# @celery.task
# def process_gpx_task(file_data: str, race_id: int):
#     db = SessionLocal()
#     track_data = parse_gpx(io.StringIO(file_data))
#     for pt in track_data:
#         db.add(TrackPoint(
#             race_id=race_id,
#             timestamp=datetime.fromisoformat(pt["timestamp"]),
#             lat=pt["lat"],
#             lon=pt["lon"],
#             elevation=pt["elevation"]
#         ))
#     race = db.query(Race).get(race_id)
#     race.status = "processed"
#     db.commit()
#     db.close()
#     return {"points_saved": len(track_data)}

# # ================================
# # API INTEGRATION
# # ================================

# # backend/app/api/upload.py (updated)
# from app.models.schemas import Race
# from fastapi import UploadFile, File
# from app.db import SessionLocal
# from app.workers.tasks import process_gpx_task
# from datetime import datetime

# @router.post("/upload/gpx")
# async def upload_gpx(file: UploadFile = File(...)):
#     contents = await file.read()
#     db = SessionLocal()
#     new_race = Race(name=file.filename, user_id=1, created_at=datetime.utcnow())
#     db.add(new_race)
#     db.commit()
#     db.refresh(new_race)

#     # Queue the file for processing
#     process_gpx_task.delay(contents.decode("utf-8"), new_race.id)

#     return {"message": "Race uploaded. Processing in background.", "race_id": new_race.id}

# # ================================
# # CELERY WORKER COMMAND
# # ================================
# # Run this in your container:
# # celery -A app.workers.tasks worker --loglevel=info
