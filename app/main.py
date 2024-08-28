from fastapi import FastAPI, Depends, HTTPException, status
from sqlalchemy.orm import Session
from .models import Note, SessionLocal, NoteSchema, User
from fastapi.security import HTTPBasic, HTTPBasicCredentials
import requests
from sqlalchemy import select, text


app = FastAPI()

security = HTTPBasic()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


def authenticate_user(credentials: HTTPBasicCredentials = Depends(security), db: Session = Depends(get_db)):
    user = db.query(User).filter(User.username == credentials.username).first()
    if user is None or user.password != credentials.password:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid credentials")
    return user


YANDEX_SPELLER_URL = "https://speller.yandex.net/services/spellservice.json/checkText"


def validate_text(text: str):
    headers = {"Content-Type": "application/x-www-form-urlencoded"}
    params = {
        "text": text,
    }
    response = requests.post(YANDEX_SPELLER_URL, headers=headers, data=params)
    response.raise_for_status()
    errors = response.json()
    if errors:
        raise HTTPException(status_code=400, detail={"errors": errors})


@app.post("/", status_code=201)
async def add_note(note: NoteSchema, db: Session = Depends(get_db), current_user: User = Depends(authenticate_user)):
    validate_text(note.text)
    db_note = Note(name=note.name, text=note.text, fk_user_id=current_user.user_id)
    db.add(db_note)
    db.commit()
    db.refresh(db_note)
    return {"message": "Note added", "note": db_note}


@app.get("/", status_code=200)
async def get_notes(db: Session = Depends(get_db), current_user: User = Depends(authenticate_user)):
    notes = db.execute(select(Note).where(Note.fk_user_id == current_user.user_id)).scalars().all()
    return notes
