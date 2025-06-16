# Use Python 3.9 base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements and install
COPY app/requirements.txt .
RUN pip install -r requirements.txt

# Copy app code
COPY app/ .

# Expose port 5000 (Flask default)
EXPOSE 5000

# Run Gunicorn (Production WSGI Server)
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]