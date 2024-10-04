FROM python:3.9-alpine

WORKDIR /app

RUN pip install --no-cache-dir flask

COPY ./app /app

CMD ["python", "main.py"]
