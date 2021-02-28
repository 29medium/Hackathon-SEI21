from pynput import keyboard

import datetime
import requests

# detect keypress
def on_press(key):
    dict["keys"] += 1
    dict["last_key"] = datetime.datetime.now()
    if key == keyboard.Key.backspace:
        dict["backspace"] += 1
    elif key == keyboard.Key.ctrl:
        chaves["ctrl"]=True
    elif key == keyboard.Key.esc:
        chaves["esc"]=True



# deatect key releases
def on_release(key):
    if chaves["esc"] & chaves["ctrl"]:
        return False
    elif key == keyboard.Key.esc:
        chaves["esc"]=False
    elif key == keyboard.Key.ctrl:
        chaves["ctrl"]=False


dict = {
    "keys":0,
    "backspace":0,
    "last_key": datetime.datetime.now()
}
chaves = {
    "esc":False, 
    "ctrl":False
}

url_user = 'http://localhost:3000/api/v1/sign_in'
url_work_sessions = 'http://localhost:3000/api/v1/work_sessions/'

print("Email:")
email = input(">> ")
print("Password:")
password = input(">> ")

x = requests.post(url_user, json={"sign_in": {"email":email, "password":password}})
x= x.json()

if x["is_success"]==True:
    work_session = x["data"]["work_session"]
    if work_session!=[]:
        url_work_sessions += str(work_session[0])
        print("Started recording")
        with keyboard.Listener(on_press=on_press, on_release=on_release) as listener:
                listener.join()
        print("Stopped recording")
        dict["last_key"] = dict["last_key"].isoformat()
        r = requests.put(url_work_sessions, json=dict)
    else:
        print("No Work Session Started")
else:
    print("Bad Loggin")