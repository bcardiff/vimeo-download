FROM python:3.6

RUN echo "deb http://ftp.uk.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list && \
    apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD requirements.txt /app/
ADD vimeo-download.py /app/

RUN cd /app && pip install -r requirements.txt

WORKDIR /app
ENTRYPOINT ["/app/vimeo-download.py"]
