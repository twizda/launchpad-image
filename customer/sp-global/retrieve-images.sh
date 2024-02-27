#!/bin/sh

TAG="<msr-version>"
REGISTRY="registry.mirantis.com/msr"
RETHINK_TAG="2.4.3-mirantis-0.1.3"
ENZI_TAG="1.0.85"
FILE="msr-${TAG}.tar.gz"

IMAGES="$REGISTRY/msr-garant:$TAG"
IMAGES="$IMAGES $REGISTRY/msr-installer:$TAG"
IMAGES="$IMAGES $REGISTRY/msr-notary-signer:$TAG"
IMAGES="$IMAGES $REGISTRY/msr-registry:$TAG"
IMAGES="$IMAGES $REGISTRY/msr-nginx:$TAG"
IMAGES="$IMAGES $REGISTRY/msr-api:$TAG"
IMAGES="$IMAGES $REGISTRY/msr-notary-server:$TAG"
IMAGES="$IMAGES $REGISTRY/msr-jobrunner:$TAG"
IMAGES="$IMAGES $REGISTRY/enzi:$ENZI_TAG"
IMAGES="$IMAGES registry.opensource.zalan.do/acid/spilo-14:2.1-p3"
IMAGES="$IMAGES registry.mirantis.com/rethinkdb/rethinkdb:$RETHINK_TAG"

echo "Pulling images..."
for NAME in ${IMAGES}; do
    docker image pull ${NAME};
done

echo "Saving images..."
docker image save $IMAGES -o $FILE
echo "Images saved. To load use docker image load -i $FILE"
