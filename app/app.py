from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/predict', methods=['POST'])
def predict():
    # Simulated dummy AI logic
    input_data = request.get_json()
    prediction = "positive" if input_data.get("input") == "good" else "negative"
    return jsonify({"prediction": prediction})

@app.route('/', methods=['GET'])
def home():
    return jsonify({"message": "AI Inference App running"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)