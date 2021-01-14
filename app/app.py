#! /bin/python3.8

from flask import Flask

app = Flask(__name__)

@app.route('/')
@app.route('/home')
def h():
    return "<pre><h1>Hello, world</h1></pre>"

@app.route("/about")
def e():
    return """
    <pre><h2> Simple Flask Application </h2></pre>
    """


if __name__ == "__main__":
    app.run()
