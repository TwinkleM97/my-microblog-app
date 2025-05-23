
# Microblog (Dockerized Flask App)

This is a Dockerized version of **Microblog**, a Python Flask application originally featured in Miguel Grinberg's [Flask Mega-Tutorial](https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world). It includes a login system, user registration, messaging, and more.

##  Application Overview

This app is containerized using Docker for easier deployment and development, with best practices like:

- Using a minimal Python 3.11 base image
- Non-root user for runtime security
- Layered and commented Dockerfile
- Bind mounts for persistent logs

---

##  Running the App (Docker)

### Step 1: Build the Docker image
```bash
docker build -t microblog-app:v1 .
```

### Step 2: Run the container with logs mounted
```bash
docker run -d -p 5000:5000 \
  --mount type=bind,source="$(pwd)/logs",target=/app/logs \
  --name microblog-container microblog-app:v1
```

Then visit [http://localhost:5000] in your browser!

---

##  Running the App Locally (Without Docker)

If you prefer to run the Flask app on your local machine directly:

### Step 1: Set up a virtual environment
```bash
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
```

### Step 2: Install requirements
```bash
pip install -r requirements.txt
```

### Step 3: Set environment variables and run Flask
```bash
export FLASK_APP=microblog.py
export FLASK_ENV=development  # optional
flask db upgrade
flask run
```

Visit [http://localhost:5000] to access the app.

---

##  References

The source app and walkthrough are part of [The Flask Mega-Tutorial](https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world) by **Miguel Grinberg**.

Older versions of the tutorial:
- [2018 & 2021 Code](https://github.com/miguelgrinberg/microblog-2018)
- [2012 Code](https://github.com/miguelgrinberg/microblog-2012)

---
## Project Folder Structure

```
├── app/
├── logs/
├── Screenshots/
├── migrations/
├── boot.sh
├── config.py
├── Dockerfile
├── microblog.py
├── requirements.txt
└── README.md
```
## By Twinkle Mishra-8894858