# syntax=docker/dockerfile:1
FROM python:3.9-slim-bullseye

# ENV VIRTUAL_ENV=venv
# RUN python3 -m venv $VIRTUAL_ENV
# ENV PATH="$VIRTUAL_ENV/bin:$PATH"

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

FROM pandoc/core:latest

CMD ["python3", "-m" , "flask", "run", "--host=0.0.0.0"]

