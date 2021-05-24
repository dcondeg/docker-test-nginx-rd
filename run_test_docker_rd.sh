#!/bin/bash
# Author David Conde
docker pull taxicg/nginx-rdsistemas-test
docker run -d  -p 80:80 --rm --name my-nginx-test taxicg/nginx-rdsistemas-test
firefox http://localhost/
docker stop my-nginx-test
