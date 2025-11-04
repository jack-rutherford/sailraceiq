from fastapi import FastAPI
from server.api import regattas

app = FastAPI(title="SailRaceIQ API")

app.include_router(regattas.router, prefix="/regattas", tags=["regattas"])

@app.get("/")
def root():
    return {"message": "Welcome to SailRaceIQ Backend"}