
## Overview

This project includes four files:

1. `docker-compose.yaml`: file that sets up four services: elasticsearch, kibana, logstash, and log-generator.
2. `logstash.conf`: for logstash that tells logstash how to handle the incoming data.
3. `log-generator.sh`: a shell script that generates random log messages in JSON format and sends them to the logstash service.
4. `Dockerfile`: a file used to build the log-generator service.

### Running the services

Make sure that you have Docker and Docker-compose installed on your machine.

Navigate to the directory where the files are located in your terminal.
Run the following command:

`docker-compose up`

### Stopping the services

`docker-compose down`
