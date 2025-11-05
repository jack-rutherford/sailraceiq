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

# Running locally

#### Database connection
In seed.py and db.py, it defaults to `sqlite:///./local.db`. If you would like to change this please make a .env file in the backend directory and supply a new database URL, along with user, password, db, host, and port variables (all found in compose.yaml). Make sure they match up with the URL variable.

Example postgres URL: `postgresql://user:password@host:port/db`

The host should be the same name as the container that the service is running on.

## Uvicorn run command (local running) 
#### \****not used often after docker***\*

`poetry run uvicorn src.server.main:app --reload`

## Docker (locally)
`docker compose up --build`

### Inserting mock data
In a new terminal, run `docker compose exec app bash` > `cd src` > `poetry run python -m server.seed`

You should see a message saying:
```
"Mock data successfully seeded into PostgreSQL!"
```
If not... good luck. Maybe check your database URL again??