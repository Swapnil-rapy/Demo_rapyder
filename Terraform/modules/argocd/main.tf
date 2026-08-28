resource "kubernetes_namespace" "argocd" {
  metadata {
    name = var.namespace
  }
}


resource "helm_release" "argocd" {
  name      = "argocd"
  namespace = kubernetes_namespace.argocd.metadata[0].name

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.chart_version

  create_namespace = false

  wait    = true
  timeout = 600
}