# Use a lightweight base Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy dependencies
COPY app/requirements.txt .

# Install dependencies
RUN pip install -r requirements.txt

# Copy app code
COPY app/app.py .

# Run app
ENTRYPOINT ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]