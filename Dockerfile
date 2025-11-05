
FROM python:3.13-slim

WORKDIR /app

RUN pip install poetry
COPY backend/pyproject.toml backend/poetry.lock ./
RUN poetry install --no-root

COPY backend/ .
EXPOSE 8000

CMD ["poetry", "run", "uvicorn", "server.main:app", "--host", "0.0.0.0", "--port", "8000", "--app-dir", "src"]