#! /bin/python3.8

from flask import Flask

app = Flask(__name__)

@app.route('/')
@app.route('/home')
def h():
    return "<h2>Hello, world</h2>"

@app.route("/about")
def e():
    return """
    <h1> Simple Flask Application </h1>
    """


if __name__ == "__main__":
    app.run()
