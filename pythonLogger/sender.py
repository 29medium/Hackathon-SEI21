import requests

url = 'http://localhost:3000/api/v1/work_sessions/1'
myobj = {'keys': 10, 'backspace': 4}

x = requests.put(url, json = myobj)

print(x.text)