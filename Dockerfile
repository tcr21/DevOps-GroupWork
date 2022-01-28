# syntax=docker/dockerfile:1
FROM gitlab.informatik.uni-bremen.de:5005/hoeffner/pandoc-python-docker:latest

WORKDIR /app

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . .

CMD flask run --host=0.0.0.0 
#--port=&PORT


# syntax=docker/dockerfile:1
# FROM ubuntu

# WORKDIR /app

# ENV LC_ALL=C.UTF-8
# ENV LANG=C.UTF-8

# RUN apt-get update -y && \
#     apt-get install -y python3 \
#     python3-pip \
#     python3-venv

# ENV VIRTUAL_ENV=/opt/venv
# RUN python3 -m venv $VIRTUAL_ENV
# ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# COPY requirements.txt .
# RUN pip install -r requirements.txt
# #pip install --upgrade pip && 

# COPY . .

# FROM pandoc/alpine

# ENV LC_ALL=C.UTF-8
# ENV LANG=C.UTF-8

# CMD flask run --host=0.0.0.0 
# #--port=&PORT


