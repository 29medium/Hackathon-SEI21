from pynput import keyboard

import calendar
import requests

# detect keypress
def on_press(key):
    try:
        print('alphanumerickey{0} pressed'.format(key.char))
        upper = str(key.char).upper()
        dict["keys"] += 1
    except:
        print('special key {0} pressed'.format(key))
        upper = str(key).upper()
        if key == keyboard.Key.backspace:
            dict["backspace"] += 1
        elif key != keyboard.Key.esc:
            dict["keys"] += 1

# deatect key releases
def on_release(key):
    print('{0} released'.format(key))
    upper = str(key).upper()
    if key == keyboard.Key.esc:
        print('Stop')
        r = requests.put(url, json=dict)
        print(r.text)
        dict['keys']=0
        dict['backspace']=0

dict = {
    "keys":0,
    "backspace":0
}

url = 'http://localhost:3000/api/v1/work_sessions/'

print("Email")
email = input(">> ")

x = requests.get(url, json={"email":email})

# Collectevents
with keyboard.Listener(
        on_press=on_press,
        on_release=on_release) as listener:
        listener.join()