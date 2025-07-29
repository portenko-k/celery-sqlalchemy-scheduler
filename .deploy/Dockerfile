FROM python:3.13

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONPATH=/pharmatrail-lib

ARG PIP_EXTRA_INDEX_URL
ENV PIP_EXTRA_INDEX_URL=$PIP_EXTRA_INDEX_URL

ARG APP_USER=pharmatrail
RUN addgroup --system ${APP_USER} && adduser --system --group ${APP_USER}

RUN mkdir -p /pharmatrail-lib

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait /wait
RUN chmod +x /wait

WORKDIR /pharmatrail-lib

COPY requirements.txt .
RUN pip install -r requirements.txt

RUN chown -R ${APP_USER}:${APP_USER} /pharmatrail-lib && \
    chmod -R 755 /pharmatrail-lib

USER ${APP_USER}

COPY . .
