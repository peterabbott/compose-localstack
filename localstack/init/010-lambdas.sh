aws --endpoint-url http://localstack:4566 s3 cp /assets/placeholder.zip s3://lambdas/ 

#!/bin/sh

## NOTE: timeout of 200 to get around performance issues

makeLambda() {
  FUNC_NAME=$1
  aws --endpoint-url http://localstack:4566 lambda create-function \
    --function-name "$FUNC_NAME" \
    --code "S3Bucket=lambdas,S3Key=placeholder.zip" \
    --handler src/handler.handler \
    --runtime 'nodejs14.x' \
    --timeout 200 \
    --role dummy

  aws --endpoint-url http://localstack:4566 lambda put-function-concurrency \
    --function-name "$FUNC_NAME" \
    --reserved-concurrent-executions 1
}

makeLambda "test-processor"

aws --endpoint-url http://localstack:4566 lambda list-functions
