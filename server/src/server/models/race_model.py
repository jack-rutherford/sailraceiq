import datetime
from server.models.regatta_model import Regatta
from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship, Mapped, mapped_column
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()
'''
id: unique identifier for a race
num: what race number this is
start: date and time of when race starts
end: date and time of when race ends
length: time between 
'''
class Race(Base):
    __tablename__ = "race"
    id: Mapped[Integer] = mapped_column(primary_key=True)
    num = Column(String(4))
    start = Column(datetime)
    # parent_id = mapped_column(ForeignKey("parent_table.id"))
    regatta_id: Mapped[Integer] = mapped_column(Regatta, ForeignKey(Regatta.id))
    regatta: Mapped[Regatta] = relationship(Regatta, back_populates="races")
