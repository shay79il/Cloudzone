FROM python:3.8.3-alpine

RUN adduser -D webserver
USER webserver

WORKDIR /home/webserver

ENV PATH="/home/webserver/.local/bin:${PATH}"
RUN /usr/local/bin/python -m pip install --upgrade pip

ENV PATH="/usr/local/bin/python:${PATH}"
RUN pip install flask==2.3.0 --user --no-cache-dir

COPY --chown=webserver:webserver webserver.py /home/webserver/

EXPOSE 80

CMD [ "python", "/home/webserver/webserver.py" ]