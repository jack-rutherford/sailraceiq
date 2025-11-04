from fastapi import FastAPI
from server.routes import regatta
from server.core import db
from server.models import regatta  # import to register models

app = FastAPI(title="SailRaceIQ API")

# Create tables automatically (for dev)
db.Base.metadata.create_all(bind=db.engine)

app.include_router(regatta.router, prefix="/regattas", tags=["regattas"])

@app.get("/")
def root():
    return {"message": "Welcome to SailRaceIQ Backend"}