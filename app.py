from flask import Flask, render_template
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def home():
    posts = [
        {'name': 'Udhaya Kumar', 'message': 'Just deployed my first app using CI/CD!', 'time': datetime.now().strftime('%Y-%m-%d %H:%M:%S')},
        {'name': 'DevOpsBot', 'message': 'Docker + Nginx + HTTPS = 🔥', 'time': '2025-06-25 10:15:42'},
        {'name': 'Student', 'message': 'Learning AWS is so cool! 🚀', 'time': '2025-06-24 17:42:19'},
    ]
    return render_template('index.html', posts=posts)
    
    if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
