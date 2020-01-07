#!/usr/bin/env bash

set -e

ARCH=$1

kubectl apply -f /tmp/dashboard-rbac.yaml


if [ "$ARCH" == "arm" ]; then
    curl -s https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/alternative/kubernetes-dashboard-arm.yaml | \
    sed -e 's/v2.0.0-alpha0/v1.8.3/g' | \
    kubectl apply -f -;
elif [ "$ARCH" == "x86_64" ]; then
    curl -s -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/alternative/kubernetes-dashboard.yaml | \
    sed -e 's/v2.0.0-alpha0/v1.8.3/g' | \
    kubectl apply -f -;
fi
