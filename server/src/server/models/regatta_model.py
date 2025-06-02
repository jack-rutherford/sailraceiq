from typing import List, Optional
from server.models import Base
from server.models.race_model import Race
from sqlalchemy import Integer, String
from sqlalchemy.orm import relationship, Mapped, mapped_column


'''
description: optional description of the race
'''
class Regatta(Base):
    __tablename__ = "regatta"

    id : Mapped[int] = mapped_column(Integer, primary_key=True)
    description: Mapped[Optional[str]] = mapped_column(String(4095))
    races: Mapped[List[Race]] = relationship(Race, back_populates="regatta")
