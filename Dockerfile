
# Python support can be specified down to the minor or micro version
# (e.g. 3.6 or 3.6.3).
# OS Support also exists for jessie & stretch (slim and full).
# See https://hub.docker.com/r/library/python/ for all supported Python
# tags from Docker Hub.
FROM ubuntu:16.04

RUN apt-get update -y && apt-get install -y pandoc python3 gunicorn texlive-latex-base texlive-latex-extra

LABEL Name=pandoc-server
EXPOSE 8080

WORKDIR /app
ADD . /app

CMD ["gunicorn", "-w 4", "-b 0.0.0.0:8080", "main:app"]
