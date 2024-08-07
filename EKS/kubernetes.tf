provider "kubernetes" {
  host                   = data.aws_eks_cluster.awake-cluster.endpoint
  token                  = data.aws_eks_cluster_auth.awake-cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.awake-cluster.certificate_authority.0.data)
}
# Define the ClusterRole with full permissions
resource "kubernetes_cluster_role" "full_access" {
  metadata {
    name = "full-access"
  }

  rule {
    api_groups = [""]
    resources  = ["*"]
    verbs      = ["*"]
  }

  rule {
    api_groups = ["apps"]
    resources  = ["*"]
    verbs      = ["*"]
  }

  rule {
    api_groups = ["extensions"]
    resources  = ["*"]
    verbs      = ["*"]
  }

  rule {
    api_groups = ["batch"]
    resources  = ["*"]
    verbs      = ["*"]
  }

  rule {
    api_groups = ["networking.k8s.io"]
    resources  = ["*"]
    verbs      = ["*"]
  }
}

# Bind the ClusterRole to a user
resource "kubernetes_cluster_role_binding" "full_access_binding" {
  metadata {
    name = "full-access-binding"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role.full_access.metadata[0].name
  }

  subject {
    kind      = "User"
    name      = "Dimitri"  # Replace with your user name or role name
    api_group = "rbac.authorization.k8s.io"
  }
}