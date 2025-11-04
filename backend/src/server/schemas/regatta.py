from pydantic import BaseModel
from typing import Optional


class RegattaBase(BaseModel):
    name: str
    start_date: Optional[str] = None
    duration: Optional[int] = None
    report_time: Optional[str] = None
    venue: Optional[str] = None
    type: Optional[str] = None
    participation: Optional[str] = None
    scoring: Optional[str] = None
    host: Optional[str] = None


# For creating a new regatta (no id yet)
class RegattaCreate(RegattaBase):
    pass


# For updating a regatta (all fields optional)
class RegattaUpdate(RegattaBase):
    pass


# For returning a regatta from the API (includes ID)
class RegattaResponse(RegattaBase):
    id: int

    class Config:
        orm_mode = True  # allows reading from SQLAlchemy models
