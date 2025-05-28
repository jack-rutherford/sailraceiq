from typing import List
from server.models import Base
from server.models.race_model import Race
from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship, Mapped, mapped_column


'''
description: optional description of the race
'''
class Regatta(Base):
    __tablename__ = "regatta"

    id : Mapped[Integer] = mapped_column(primary_key=True)
    races: Mapped[List[Race]] = relationship(Race, back_populates="regatta")
