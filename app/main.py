
from flask import Flask
from urllib.request import urlopen

app = Flask(__name__)


@app.route('/ip', methods=['GET'])
def application(env, start_response):
	start_response('200 OK', [('Content-Type', 'text/html')])

	ip = urlopen('https://api.ipify.org').read()
	return [ip]

if __name__ == "__main__":
   app.run()
