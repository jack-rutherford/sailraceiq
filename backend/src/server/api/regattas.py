from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from server.core.db import get_db
from server.models.regatta import Regatta

router = APIRouter()

@router.get("/list")
def list_regattas(db: Session = Depends(get_db)):
    regattas = db.query(Regatta).all()
    return regattas