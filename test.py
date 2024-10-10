from dotenv import load_dotenv

load_dotenv()

import cv2
import face_recognition
import pickle
import numpy as np
import threading
import requests
import json
import datetime

host = "http://192.168.4.1"
stream_url = f"{host}:81/stream"
camera = cv2.VideoCapture(stream_url)
face_threshold = 0.3
check_time = datetime.datetime.now()


def send_unknown_request():
    global check_time
    with open("settings.json", "r") as setting_file:
        settings = json.load(setting_file)
        settings["streaming"] = False
        json.dump(settings, setting_file)
    check_time = datetime.datetime.now()
    requests.get(f"{host}/unknown")


while True:
    with open("settings.json", "r") as setting_file:
        settings = json.load(setting_file)
    with open("encodings/known_encodings.dat", "rb") as f:
        known_encodings = pickle.load(f)
    if settings["streaming"] == True:
        success, img = camera.read()
        if not success:

            break
    else:
        now = datetime.datetime.now()
        if (now - check_time).seconds >= 5:
            with open("settings.json", "r") as setting_file:
                settings = json.load(setting_file)
                # Set the streaming key to False
                settings["streaming"] = False

            # Write the updated settings back to the JSON file
            with open("settings.json", "w") as setting_file:
                json.dump(settings, setting_file, indent=4)
            check_time = datetime.datetime.now()

        img_request = requests.get(f"{host}/capture")
        with open("image.jpg", "wb") as tempfile:
            tempfile.write(img_request.content)
        img = cv2.imread("image.jpg")

    imgS = cv2.resize(img, (0, 0), None, 0.25, 0.25)
    imgS = cv2.cvtColor(imgS, cv2.COLOR_BGR2RGB)
    facesCurFrame = face_recognition.face_locations(imgS)
    encodeCurFrame = face_recognition.face_encodings(imgS, facesCurFrame)
    percentage = 0
    face_encodings = face_recognition.face_encodings(imgS)
    if face_encodings:
        if not known_encodings:
            break
        known_encodings_list = [enc["encodings"][0] for enc in known_encodings]
        known_ids = [enc["id"] for enc in known_encodings]
        face_dist = face_recognition.face_distance(
            known_encodings_list, face_encodings[0]
        )
        best_index = np.argmin(face_dist)
        y1, x2, y2, x1 = facesCurFrame[0]
        y1, x2, y2, x1 = y1 * 4, x2 * 4, y2 * 4, x1 * 4
        if face_dist[best_index] <= face_threshold:
            cv2.rectangle(img, (x1, y1), (x2, y2), (0, 255, 0), 2)
            cv2.rectangle(img, (x1, y2), (x2, y2 + 70), (0, 255, 0), 2)
            cv2.putText(
                img,
                f"KNOWN",
                (x1 + 10, y2 + 30),
                cv2.FONT_HERSHEY_COMPLEX,
                1,
                (255, 255, 255),
                1,
            )
        else:
            cv2.rectangle(img, (x1, y1), (x2, y2), (0, 0, 255), 2)
            threading.Thread(target=send_unknown_request).start()

    cv2.imshow("FACE RECOGNITION CAMERA", img)
    key = cv2.waitKey(10)
    if key == ord("q"):
        break
