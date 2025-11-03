from fastapi import FastAPI

app = FastAPI()

@app.get("/api")
def read_root():
    return {"Hello": "World"}