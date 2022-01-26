#!/bin/bash

#vpc networks
gcloud compute networks create vpc-access --project=apigee-product-demo --description=vpc\ for\ connector --subnet-mode=custom --mtu=1460 --bgp-routing-mode=regional


gcloud compute networks subnets create vpc-access-subnet --project=apigee-product-demo --description=for\ vpc\ access --range=10.132.16.0/28 --network=vpc-access --region=europe-west1

# vpc-connector
gcloud compute networks vpc-access connectors create vpc-connector     --region europe-west1   --subnet vpc-access-subnet --min-instances 2        --max-instances 10

# add bit for shared vpc networking peering
gcloud compute networks peerings create vpc-2-default \
    --network=vpc-access \
    --peer-network default 

gcloud compute networks peerings create default-2-vpc \
    --network=default \
    --peer-network vpc-access 


# create our cloudrun service account
gcloud iam service-accounts create cloudrun-sa --description="sa for cloud run auth" --display-name="cloudrun-sa"

# create our apigee service account
gcloud iam service-accounts create apigee-sa --description="sa for apigee to be used for google auth" --display-name="apigee-sa"
