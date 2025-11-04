from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List
from server.schemas.regatta import RegattaCreate, RegattaUpdate, RegattaResponse
from server.crud.regatta import regatta_crud
from server.core.db import get_db

router = APIRouter()


@router.post("/", response_model=RegattaResponse)
def create_regatta(regatta: RegattaCreate, db: Session = Depends(get_db)):
    return regatta_crud.create(db, regatta)


@router.get("/", response_model=List[RegattaResponse])
def read_regattas(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    return regatta_crud.get_multi(db, skip=skip, limit=limit)


@router.get("/{regatta_id}", response_model=RegattaResponse)
def read_regatta(regatta_id: int, db: Session = Depends(get_db)):
    db_regatta = regatta_crud.get(db, regatta_id)
    if not db_regatta:
        raise HTTPException(status_code=404, detail="Regatta not found")
    return db_regatta


@router.put("/{regatta_id}", response_model=RegattaResponse)
def update_regatta(
    regatta_id: int, regatta: RegattaUpdate, db: Session = Depends(get_db)
):
    db_regatta = regatta_crud.get(db, regatta_id)
    if not db_regatta:
        raise HTTPException(status_code=404, detail="Regatta not found")
    return regatta_crud.update(db, db_regatta, regatta)


@router.delete("/{regatta_id}", response_model=RegattaResponse)
def delete_regatta(regatta_id: int, db: Session = Depends(get_db)):
    db_regatta = regatta_crud.remove(db, regatta_id)
    if not db_regatta:
        raise HTTPException(status_code=404, detail="Regatta not found")
    return db_regatta
