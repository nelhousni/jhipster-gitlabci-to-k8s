#!/bin/bash
# Files are ordered in proper order with needed wait for the dependent custom resource definitions to get initialized.
# Usage: bash helm-install.sh
kubectl create namespace application
kubectl create secret docker-registry gitlab-auth \
    --docker-server=registry.gitlab.com \
    --docker-username=nelhousni \
    --docker-password=DULDijNkuaOmiPtdLWGsNiXbeQMjEdTDBiLvZMmTlLoCrxQlVK

helm delete --purge monitoring 2>/dev/null
helm dep up ./helm/monitoring
helm install monitoring ./helm/monitoring --namespace application

helm delete --purge jhipster 2>/dev/null
helm dep up ./helm/jhipster
helm install jhipster  ./helm/jhipster --namespace application


