#!/bin/bash
# Files are ordered in proper order with needed wait for the dependent custom resource definitions to get initialized.
# Usage: bash helm-apply.sh
helmVersion=$(helm version --client | grep -E "v3\\.[0-9]{1,3}\\.[0-9]{1,3}" | wc -l)
if [ -d "monitoring" ]; then
helm delete --purge monitoring 2>/dev/null
helm dep up ./helm/monitoring
  if [ $helmVersion -eq 1 ]; then
helm install monitoring ./helm/monitoring --namespace gitlab-managed-apps
  else
helm install --name monitoring ./helm/monitoring --namespace gitlab-managed-apps
  fi
fi
helm delete --purge jhipster 2>/dev/null
helm dep up ./jhipster
if [ $helmVersion -eq 1 ]; then
helm install jhipster  ./helm/jhipster --namespace gitlab-managed-apps
else
helm install --name jhipster  ./helm/jhipster --namespace gitlab-managed-apps
fi


