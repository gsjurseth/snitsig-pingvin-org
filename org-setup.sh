#!/bin/bash


# vpc-connector
gcloud compute networks vpc-access connectors create vpc-connector     --region europe-west1   --subnet connector-vpc --min-instances 2        --max-instances 10

# add bit for shared vpc networking peering

# create our cloudrun service account
gcloud iam service-accounts create cloudrun-sa     --description="sa for cloud run auth"     --display-name="cloudrun-sa"
