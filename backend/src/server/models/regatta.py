from sqlalchemy import Column, Integer, String
from server.core.db import Base

class Regatta(Base):
    __tablename__ = "regattas"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, nullable=False)
    start_date = Column(String)
    duration = Column(Integer)
    report_time = Column(String)
    venue = Column(String)
    type = Column(String)
    participation = Column(String)
    scoring = Column(String)
    host = Column(String)