#!/bin/sh -ux
# All user-defined names will start with the generic prefix "xd-", followed by the application name

deploy_argocd() {
  namespace="argocd"
  echo deploying application argocd in namespace argocd

  helm repo update
  helm repo add argo https://argoproj.github.io/argo-helm
  helm upgrade --install xd-argocd argo/argo-cd \
    -f helm-charts/argo-cd/ci/ha-autoscaling-values.yaml \
    --atomic \
    --timeout 10m \
    --wait \
    --namespace "${namespace:?}" \
    --create-namespace \
    --debug
}


deploy_argocd