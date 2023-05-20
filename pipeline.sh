#!/bin/sh -ux

deploy_argocd() {
  echo deploying application argocd in namespace argocd
  helm repo add argocd helm-charts/argocd
  helm install argocd argocd

}