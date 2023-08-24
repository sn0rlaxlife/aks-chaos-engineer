##chaos

#helm chart for our release that is needed to be installed
resource "helm_release" "chaos" {
  chart            = "chaos-mesh"
  namespace        = "chaos-testing"
  create_namespace = "true"
  name             = "chaos-mesh"
  version          = "2.6.2"
  repository       = "https://charts.chaos-mesh.org"
  atomic           = true

  set {
    name  = "chaosDaemon.runtime"
    value =  "containerd"
  }

  set {
    name  = "chaosDaemon.socketPath"
    value = "/run/containerd/containerd.sock"
  }
}

