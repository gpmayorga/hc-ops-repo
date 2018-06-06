#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml

helm init
sleep 10
helm del --purge mysql
helm install --name mysql -f $DIR/mysql/config.yml stable/mysql
helm install --name oc-redis stable/redis -f $DIR/redis/config.yaml

kubectl apply -f $DIR/oc-volumes.yaml
kubectl apply -f $DIR/oc-srv.yaml
kubectl apply -f $DIR/oc-ingress.yaml
kubectl apply -f $DIR/oc-deployment.yaml
