#!/usr/bin/env bash

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 791073934047.dkr.ecr.us-east-1.amazonaws.com/cloudzone-lab

docker image build -t 791073934047.dkr.ecr.us-east-1.amazonaws.com/cloudzone-lab:latest .
docker push 791073934047.dkr.ecr.us-east-1.amazonaws.com/cloudzone-lab:latest