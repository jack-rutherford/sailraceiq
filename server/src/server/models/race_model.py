from datetime import datetime
from server.models import Base
from server.models.regatta_model import Regatta
from sqlalchemy import DateTime, ForeignKey, Integer, String
from sqlalchemy.orm import relationship, Mapped, mapped_column

'''
id: unique identifier for a race
num: what race number this is
start: date and time of when race starts
end: date and time of when race ends
length: time between 
'''
class Race(Base):
    __tablename__ = "race"
    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    num = Mapped[str] = mapped_column(String)
    start = Mapped[datetime] = mapped_column(DateTime(timezone=True))

    regatta_id: Mapped[int] = mapped_column(Regatta, ForeignKey(Regatta.id))
    regatta: Mapped[Regatta] = relationship(Regatta, back_populates="races", cascade="all, delete-orphan")
