#!/bin/bash

ACCOUNT_ID="851725510286"
REGION="us-west-2"
BUCKET_NAME="tf-state-${ACCOUNT_ID}"
DDB_TABLE="tf-lock-${ACCOUNT_ID}"

echo "Creating Terraform backend resources..."
echo "S3 Bucket: ${BUCKET_NAME}"
echo "DynamoDB Table: ${DDB_TABLE}"
echo "Region: ${REGION}"
echo ""

aws s3api create-bucket \
  --bucket "${BUCKET_NAME}" \
  --region "${REGION}" \
  --create-bucket-configuration LocationConstraint="${REGION}" \
  2>/dev/null

echo "Enabling versioning on S3 bucket..."
aws s3api put-bucket-versioning \
  --bucket "${BUCKET_NAME}" \
  --versioning-configuration Status=Enabled

echo "Creating DynamoDB table for state locking..."
aws dynamodb create-table \
  --table-name "${DDB_TABLE}" \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region "${REGION}" \
  2>/dev/null

echo ""
echo "Terraform backend setup complete."
echo "S3 bucket and DynamoDB table are ready."