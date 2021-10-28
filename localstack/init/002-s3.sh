#!/bin/sh

aws --endpoint-url http://localstack:4566 s3 ls
aws --endpoint-url http://localstack:4566 s3 mb s3://lambdas
aws --endpoint-url http://localstack:4566 s3 ls
