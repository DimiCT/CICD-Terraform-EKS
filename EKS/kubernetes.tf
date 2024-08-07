provider "kubernetes" {
  host                   = data.aws_eks_cluster.awake-cluster.endpoint
  token                  = data.aws_eks_cluster_auth.awake-cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.awake-cluster.certificate_authority.0.data)
}
