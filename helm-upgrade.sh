#!/bin/bash
# Files are ordered in proper order with needed wait for the dependent custom resource definitions to get initialized.
# Usage: bash helm-apply.sh
if [ -d "monitoring" ]; then
helm dep up ./helm/monitoring
helm upgrade --install monitoring ./helm/monitoring --namespace gitlab-managed-apps
fi
helm dep up ./helm/jhipster
helm upgrade --install jhipster ./helm/jhipster --namespace gitlab-managed-apps


