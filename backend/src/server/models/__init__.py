from sqlalchemy.orm import DeclarativeBase

# Typed declarative base class
class Base(DeclarativeBase):
    pass

# Import models here so Base.metadata.create_all() picks them up
from server.models.regatta import Regatta