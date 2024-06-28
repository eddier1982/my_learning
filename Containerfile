FROM python:3.10.14-alpine3.20

RUN pip install -r requirements.txt

RUN mkdir -p ./docs

WORKDIR ./docs

CMD ["mkdocs","serve"]

EXPOSE 8080