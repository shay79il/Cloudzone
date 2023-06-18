#!/usr/bin/env bash

sudo su
yum update
yum install docker
systemctl enable docker.service
systemctl start docker.service