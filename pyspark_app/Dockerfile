FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH="${PYTHONPATH}:/app/src/"
WORKDIR /app

ADD . /app

RUN pip install -r requirements.txt

# CMD ["fastapi", "dev", "/app/src/api/api.py"]