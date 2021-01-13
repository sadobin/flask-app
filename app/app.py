#! /bin/python3.8

from flask import Flask

app = Flask(__name__)

@app.route('/')
@app.route('/home')
def h():
    return "<pre><h2>Hello, world</h2></pre>"

@app.route("/about")
def e():
    return """
    <pre><h1> Simple Flask Application </h1></pre>
    """


if __name__ == "__main__":
    app.run()
