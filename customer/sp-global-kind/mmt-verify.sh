#!/bin/sh
# 
# The first step in migrating your source MSR system to a target MSR system is to verify the configuration of the source system.

# Variables
MKE_URL="https://ec2-3-145-17-210.us-east-2.compute.amazonaws.com"
MKE_SRC_URL="https://ec2-3-146-221-81.us-east-2.compute.amazonaws.com"
MKE_USR="admin"
MMT_MODE="copy"
MMT_VERS="2.0.1"
#
# To get the replica ID, log into the source MSR and run this command:
#    docker ps --format '{{.Names}}' -f name=dtr-rethink | cut -f 3 -d '-'
REPLICA_ID="31c927822913"

# We need to prompt for this one
read -sp "Enter the MKE admin user password: " MKE_PASSWORD
echo

# Run the verify step
docker container run -it --rm --name "mmt-verify" \
        --mount source=dtr-registry-${REPLICA_ID},target=/storage \
	registry.mirantis.com/msr/mmt:${MMT_VERS} \
	verify msr  \
	--source-mke-url ${MKE_URL} \
	--source-username ${MKE_USR} \
	--source-password ${MKE_PASSWORD} \
	--source-url ${MKE_SRC_URL} \
	--storage-mode ${MMT_MODE} \
	--source-insecure-tls \
	/migration

