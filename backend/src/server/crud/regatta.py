from server.crud.base import CRUDBase
from server.models.regatta import Regatta
from server.schemas.regatta import RegattaCreate, RegattaUpdate

class CRUDRegatta(CRUDBase[Regatta, RegattaCreate, RegattaUpdate]):
    """CRUD class for Regatta-specific operations."""

    # Example: add a Regatta-specific method
    def get_by_host(self, db, host: str):
        return db.query(Regatta).filter(Regatta.host == host).all()


# Create a reusable instance for your routes
regatta_crud = CRUDRegatta(Regatta)