from sqlalchemy import MetaData
from sqlalchemy.orm import declarative_base
from dotenv import load_dotenv
import os

load_dotenv()

metadata = MetaData(schema=os.getenv("SCHEMA"))
Base = declarative_base()