## Elastalert Docker

This repository contains **Dockerfile** of [Elastalert](https://github.com/Yelp/elastalert) and other scripts
for [Docker](https://www.docker.com/)'s.

### Base Docker Image

* [python:2](https://hub.docker.com/_/python/)

### Installation

1. Install [Docker](https://www.docker.com/).

2. Pull image from Docker hub(https://hub.docker.com/):

```docker pull oisis/elastalert```

3. Alternatively build an image from [Dockerfile](https://github.com/oisis/docker-elastalert):

```docker build -t oisis/elastalert .```

### Usage

* Run with Graphite support:
```
docker run -d --name elastalert \
  -e ES_HOST=elasticsearch oisis/elastalert
```

### Supported variables:

- `RULES_DIR`: Folder that contains the rule yaml files
- `RUN_EVERY`: How often ElastAlert will query elasticsearch
- `BUFFER_TIME`: ElastAlert will buffer results from the most recent period of time
- `ES_HOST`: The elasticsearch hostname
- `ES_PORT`: The elasticsearch port
- `ES_URL_PREFIX`: URL prefix for elasticsearch
- `USE_SSL`: Connect with TLS to elasticsearch
- `VERIFY_CERTS`: Verify TLS certificates
- `ES_SEND_GET_BODY_AS`: GET request with body is the default option for Elasticsearch.
- `WRITEBACK_INDEX`: The index on es_host which is used for metadata storage
