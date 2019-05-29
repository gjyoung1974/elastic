# elastic
Working with Elastic

1. Create a k8s elastic operator ["k8s ES Operator"](./k8s)      
2. Create a containerized Elastic Stack     
a. ["Fluentd daemonset for Kubernetes"](https://github.com/fluent/fluentd-kubernetes-daemonset)     
b. ["Filebeat on Kubernetes"](https://www.elastic.co/guide/en/beats/filebeat/current/running-on-kubernetes.html)    
c. ["Metricbeat on Kubernetes"](https://www.elastic.co/guide/en/beats/metricbeat/current/running-on-kubernetes.html)   
d: ["fluent.conf](https://github.com/fluent/fluentd-kubernetes-daemonset/blob/c25c03ec2dcd9eb37b1635ccf256e7c39f5edf7f/docker-image/v1.3/debian-elasticsearch/conf/fluent.conf)

create secrets from ENV file
kubectl create secret generic prod-secrets --from-file=prod.env`

