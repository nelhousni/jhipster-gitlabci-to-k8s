#!/bin/bash
# Files are ordered in proper order with needed wait for the dependent custom resource definitions to get initialized.
# Usage: bash helm-apply.sh
kubectl apply -f namespace.yaml
helmVersion=$(helm version --client | grep -E "v3\\.[0-9]{1,3}\\.[0-9]{1,3}" | wc -l)
if [ -d "csvc" ]; then
helm delete --purge csvc 2>/dev/null
helm dep up ./csvc
  if [ $helmVersion -eq 1 ]; then
helm install csvc ./csvc --namespace application
  else
helm install --name csvc ./csvc --namespace application
  fi
fi
helm delete --purge jhipster 2>/dev/null
helm dep up ./jhipster
if [ $helmVersion -eq 1 ]; then
helm install jhipster  ./jhipster --namespace application
else
helm install --name jhipster  ./jhipster --namespace application
fi


