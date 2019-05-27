#!/bin/bash

kubectl apply -f ./all-in-one.yaml

cat <<EOF | kubectl apply -f -
apiVersion: elasticsearch.k8s.elastic.co/v1alpha1
kind: Elasticsearch
metadata:
  name: quickstart
spec:
  version: 7.1.0
  nodes:
  - nodeCount: 1
    config:
      node.master: true
      node.data: true
      node.ingest: true
EOF

#

cat <<EOF | kubectl apply -f -
apiVersion: kibana.k8s.elastic.co/v1alpha1
kind: Kibana
metadata:
  name: quickstart
spec:
  version: 7.1.0
  nodeCount: 1
  elasticsearchRef:
    name: quickstart
EOF

echo "sleeping 2 minutes, then opening Kibana"
sleep 120s

PASSWORD=$(kubectl get secret quickstart-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode)

echo "username is: elastic" 
echo "password is:" $PASSWORD
minikube service quickstart-kibana-ex


