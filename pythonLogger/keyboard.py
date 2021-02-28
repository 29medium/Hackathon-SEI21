from pynput import keyboard

import calendar
import time
import requests

print("Introduzir work session")
x = input(">> ")

url = 'http://localhost:3000/api/v1/work_sessions/' + x

dict = {
    "keys":0,
    "backspace":0
}

# detect keypress
def on_press(key):
    f = open("logger.txt", "a")
    try:
        print('alphanumerickey{0} pressed'.format(key.char))
        ts = calendar.timegm(time.gmtime())
        upper = str(key.char).upper()
        f.write(str(ts) + ':' + 'KeyPressed' + ':' + upper + '\n')
        dict["keys"] += 1
    except:
        print('special key {0} pressed'.format(key))
        ts = calendar.timegm(time.gmtime())
        upper = str(key).upper()
        if key == keyboard.Key.backspace:
            dict["backspace"] += 1
        elif key != keyboard.Key.esc:
            dict["keys"] += 1
        f.write(str(ts) + ':' + 'KeyPressed' + ':' + upper + '\n')
    f.close()

# deatect key releases
def on_release(key):
    f = open("logger.txt", "a")
    ts = calendar.timegm(time.gmtime())
    print('{0} released'.format(key))
    upper = str(key).upper()
    f.write(str(ts) + ':' + 'KeyRealease' + ':' + upper + '\n')
    if key == keyboard.Key.esc:
        print('Stop')
        r = requests.put(url, json=dict)
        print(r.text)
        dict['keys']=0
        dict['backspace']=0

# Collectevents
with keyboard.Listener(
        on_press=on_press,
        on_release=on_release) as listener:
        listener.join()