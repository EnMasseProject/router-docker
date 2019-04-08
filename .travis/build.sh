#!/bin/bash
# Assumes that COMMIT, DOCKER_USER and DOCKER_PASS to be set
VERSION=${1:-"latest"}
COMMIT=$2
REPO=enmasseproject/qdrouterd-base

if [ -n "$TRAVIS_TAG" ]
then
    VERSION="$TRAVIS_TAG"
fi

make || exit 1
docker build --build-arg version=$VERSION -t $REPO:$COMMIT . || exit 1

if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
    echo "Pushing $REPO:$COMMIT"
    docker login -u $DOCKER_USER -p $DOCKER_PASS || exit 1
    docker push $REPO:$COMMIT || exit 1
    if [ "$TRAVIS_BRANCH" == "master" ] || [ "$TRAVIS_BRANCH" == "1.5.0-dispatch-1273-1287" ]; then
        echo "Pushing $REPO:$VERSION"
        docker tag $REPO:$COMMIT $REPO:$VERSION || exit 1
        docker push $REPO:$VERSION || exit 1
    fi
fi
