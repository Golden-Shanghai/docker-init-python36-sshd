#!/bin/bash

CURDIR=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )

cd ${CURDIR}"/../"

docker build -t python:36gd

docker-compose up -d

echo "success !"