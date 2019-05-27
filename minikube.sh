#!/bin/bash

minikube stop
minikube delete
minikube config set cpus 4
minikube config set memory 8196
minikube config set vm-driver hyperkit

