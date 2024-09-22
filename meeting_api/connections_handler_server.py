from fastapi import FastAPI
from fastapi.responses import JSONResponse, HTMLResponse, RedirectResponse
import sys
import os
from livekit import api
from livekit import rtc
import subprocess
from uuid import uuid4
from dotenv import load_dotenv
import time
import requests

load_dotenv(".env.production")
app = FastAPI()


def get_token(identity_name, room_name, name):
    token = (
        api.AccessToken()
        .with_identity(identity_name)
        .with_name(name)
        .with_grants(
            api.VideoGrants(
                room_join=True,
                room=room_name,
            )
        )
        .to_jwt()
    )
    return token


processes = {}


@app.get("/")
def docs():
    return RedirectResponse(url="/mdx/docs")


######## AI ROOMS ########
counter = 0

######## DOCTOR ROOMS ########
BASE_URL_GOLANG = os.getenv("BASE_URL_GOLANG")


@app.get("/room/get_token/user")
def get_token_ai(identity_name: str, room_id: str, name: str):
    try:
        token = get_token(identity_name, room_id, name)
        return JSONResponse(content={"token": token})
    except Exception as e:
        print(e)
        return JSONResponse(content={"error": str(e)}, status_code=500)


@app.get("/room/get_token/doctor")
def get_token_ai(identity_name: str, room_id: str, name: str):
    try:
        identity_name = "doctor_" + identity_name
        name = "Doctor: " + name
        token = get_token(identity_name, room_id, name)
        return JSONResponse(content={"token": token})
    except Exception as e:
        print(e)
        return JSONResponse(content={"error": str(e)}, status_code=500)


@app.get("/room/add/ai")
def add_ai(room_id: str):
    global counter
    try:
        ppp = subprocess.Popen(
            [
                "python",
                "new_server.py",
                "load",
                "ru",
                room_id,
                "python_bot_2",
                str(counter // 3),
            ]
        )

        processes[room_id] = ppp
        counter += 1
        time.sleep(35)
        return JSONResponse(content={"room_id": str(room_id)})

    except Exception as e:
        print(e)
        return JSONResponse(content={"error": str(e)}, status_code=500)


@app.get("/room/remove/ai")
def remove_ai(room_id: str):
    try:
        ppp = processes.get(room_id)
        if ppp:
            ppp.kill()
            status = {"status": "stopped", "room_id": room_id}
            return JSONResponse(content=status)
        else:
            status = {"status": "not found"}
            return JSONResponse(content=status)
    except Exception as e:
        print(e)
        return JSONResponse(content={"error": str(e)}, status_code=500)


@app.get("/room/make")
def make_room():

    resp = requests.post(BASE_URL_GOLANG + "/room")
    if resp.status_code == 200:
        room_id = resp.json()["room_id"]
        return JSONResponse(content=resp.json())
    else:
        try:
            return JSONResponse(content=resp.json(), status_code=500)
        except Exception as e:
            return JSONResponse(content={"error": str(e)}, status_code=500)


@app.get("/room/stop")
def stop_room_doctor(room_id: str):
    if processes.get(room_id, False):
        ppp = processes.get(room_id)
        ppp.kill()
    resp = requests.delete(BASE_URL_GOLANG + "/room" + f"?room_id={room_id}")
    if resp.status_code == 200:
        return JSONResponse(content=resp.json())
    else:
        try:
            return JSONResponse(content=resp.json(), status_code=500)
        except Exception as e:
            return JSONResponse(content={"error": str(e)}, status_code=500)
