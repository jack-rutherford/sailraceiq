## Backend Structure
```
server/
├── models/         ← SQLAlchemy ORM models (database)
├── schemas/        ← Pydantic schemas (data validation)
├── crud/           ← CRUD functions (business logic)
├── routes/         ← FastAPI routes (API endpoints)
└── main.py         ← Entry point (includes routers)
```

### Data Flow

Frontend JSON ⇄ Pydantic Schema ⇄ CRUD Logic ⇄ SQLAlchemy Model ⇄ Database