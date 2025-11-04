from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from server.models import Base

DATABASE_URL = "sqlite:///./local.db"  # SQLite file stored in backend/

engine = create_engine(
    DATABASE_URL, connect_args={"check_same_thread": False}
)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Dependency for FastAPI routes
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()