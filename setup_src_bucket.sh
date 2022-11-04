#!/bin/bash
S3_BUCKET_NAME=job-notifier-src-bucket-834jisur089348ioo8
S3_BUCKET_NAME_TF_STATE=terraform-state-834jisur089348ioo8
REGION=us-west-2
if aws s3 ls "s3://$S3_BUCKET_NAME" 2>&1 | grep -q 'An error occurred'
then
    aws s3api create-bucket --bucket $S3_BUCKET_NAME --region $REGION --create-bucket-configuration LocationConstraint=$REGION
else
    echo "bucket already exists"
fi

if aws s3 ls "s3://$S3_BUCKET_NAME_TF_STATE" 2>&1 | grep -q 'An error occurred'
then
    aws s3api create-bucket --bucket $S3_BUCKET_NAME_TF_STATE --region $REGION --create-bucket-configuration LocationConstraint=$REGION
else
    echo "bucket already exists"
fi