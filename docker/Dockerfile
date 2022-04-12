FROM python:3.8
ENV PYTHONUNBUFFERED=1
WORKDIR /code
COPY requirements.txt /code/
RUN pip install --upgrade pip \
    && pip install -r requirements.txt
COPY local_settings.sh /tmp/