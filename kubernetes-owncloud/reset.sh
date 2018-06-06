#!/bin/bash
helm del --purge mysql
helm install --name mysql -f /home/guille/hispacloud-dev/hc-ops/kubernetes-owncloud/mysql/config.yml stable/mysql
kubectl replace -f oc-deployment.yaml
