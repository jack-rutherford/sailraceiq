# Backend Read Me

## Stack
Frontend JSON ⇄ Pydantic Schema ⇄ CRUD Logic ⇄ SQLAlchemy Model ⇄ Database
```
          ┌──────────────┐
          │   Frontend   │
          │  (JSON API)  │
          └──────┬───────┘
                 │
                 ▼
          ┌──────────────┐
          │  Pydantic    │
          │  Schemas     │
          │ (Validation &│
          │Serialization)│
          └──────┬───────┘
                 │
                 ▼
          ┌──────────────┐
          │    CRUD      │
          │  Functions   │
          │(Business     │
          │ Logic Layer) │
          └──────┬───────┘
                 │
                 ▼
          ┌──────────────┐
          │ SQLAlchemy   │
          │  ORM Models  │
          │ (DB Mapping) │
          └──────┬───────┘
                 │
                 ▼
          ┌──────────────┐
          │  Database    │
          │ SQLite /     │
          │ PostgreSQL   │
          └──────────────┘
```

## Backend Structure
```
server/
├── models/         ← SQLAlchemy ORM models (database)
├── schemas/        ← Pydantic schemas (data validation)
├── crud/           ← CRUD functions (business logic)
├── routes/         ← FastAPI routes (API endpoints)
└── main.py         ← Entry point (includes routers)
```

## Uvicorn run command (local running)

`poetry run uvicorn src.server.main:app --reload`
