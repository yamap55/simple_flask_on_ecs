"""main"""
from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/")
def hello_world():
    """hello world"""
    return "<p>Hello, World!</p>"


@app.route("/getTasks")
def get_tasks():
    """get tasks"""
    tasks = [
        {
            "id": 1,
            "name": "task1",
        },
        {
            "id": 2,
            "name": "task2",
        },
    ]
    return jsonify(tasks)


@app.route("/healthcheck")
def healthcheck():
    """healthcheck"""
    return "OK"
