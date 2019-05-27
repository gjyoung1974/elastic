#!/bin/bash

# 1. deploy a stand alone elastic operator into minikube
kubectl apply -f ./all-in-one-EFK-dev-cluster.yaml

# 2. deploy an Elasticsearch quickstart into minikube
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

# 3. deploy an Kibana quickstart into minikube
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

# 4. get password and open Kibana dashboard
echo "sleeping 3  minutes, then opening Kibana"
sleep 180s

PASSWORD=$(kubectl get secret quickstart-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode)

echo "username is: elastic" 
echo "password is:" $PASSWORD
minikube service quickstart-kibana-ex
