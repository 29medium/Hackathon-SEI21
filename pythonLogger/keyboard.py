from pynput import keyboard

import calendar
import time


# detect keypress
def on_press(key):
    f = open("logger.txt", "a")
    try:
        print('alphanumerickey{0} pressed'.format(key.char))
        ts = calendar.timegm(time.gmtime())
        upper = str(key.char).upper()
        f.write(str(ts) + ':' + 'KeyPressed' + ':' + upper + '\n')
    except:
        print('special key {0} pressed'.format(key))
        ts = calendar.timegm(time.gmtime())
        upper = str(key).upper()
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
        # Stop Listener
        print('Stop')
        return False


# Collectevents
with keyboard.Listener(
        on_press=on_press,
        on_release=on_release) as listener:
        listener.join()
