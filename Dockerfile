FROM python:3.11-slim

WORKDIR /app

copy hello.py .

CMD ["python","hello.py"]

