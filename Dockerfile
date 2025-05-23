# Use minimal base image
FROM python:3.11-slim

# Setup environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    FLASK_APP=microblog.py \
    FLASK_RUN_HOST=0.0.0.0

# Setup working directory
WORKDIR /app

# Installing system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    build-essential \
    libpq-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy & install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir gunicorn pymysql cryptography

# Copy application files
COPY app app
COPY migrations migrations
COPY microblog.py config.py boot.sh ./

# Add non-root user to run the app
RUN adduser --disabled-password flaskuser

# Create logs folder and assign it to flaskuser
RUN mkdir -p logs && chown -R flaskuser:flaskuser /app

# Make boot script executable
RUN chmod +x boot.sh

USER flaskuser

# Expose port
EXPOSE 5000

# Start app
ENTRYPOINT ["./boot.sh"]
