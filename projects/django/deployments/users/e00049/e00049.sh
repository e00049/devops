#!/bin/bash


openssl genrsa -out e00049.key 2048
openssl req -new -key e00049.key -out e00049.csr -subj "/CN=e00049"


E00049_CSR=$(cat e00049.csr | base64 | tr -d "\n")
  
cat <<EOF > e00049.yaml
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: e00049
spec:
  request: ${E00049_CSR} 
  signerName: kubernetes.io/kube-apiserver-client
  expirationSeconds: 86400  # one day
  usages:
  - client auth
EOF

kubectl apply -f e00049.yaml
kubectl certificate approve e00049
kubectl get csr e00049 -o jsonpath='{.status.certificate}'| base64 -d > e00049.crt
kubectl create role e00049-role --verb=create --verb=get --verb=list --verb=update --verb=delete --resource=pods 
kubectl create rolebinding e00049-role-binding --role=e00049-role --user=e00049 
kubectl config set-credentials e00049 --client-key=e00049.key --client-certificate=e00049.crt --embed-certs=true
kubectl config set-context e00049 --cluster=kubernetes --user=e00049
