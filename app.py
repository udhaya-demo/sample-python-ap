from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "<h1>Welcome to Udhaya's Live Flask App!</h1><p>Running on Docker + AWS + HTTPS</p>"

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000)

