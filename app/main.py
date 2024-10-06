from flask import Flask, render_template, jsonify

app = Flask(__name__)


@app.route("/")
def index():
    return render_template("index.html")


@app.route('/health')
def health_check():
    return jsonify(status='healthy'), 200


@app.route('/ready')
def readiness_check():
    return jsonify(status='ready'), 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
