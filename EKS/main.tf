#Vpc
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "awake_cluster_vpc"
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.azs.names
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets


  enable_dns_hostnames = true
  enable_nat_gateway   = true
  single_nat_gateway   = true

  tags = {
    "kubernetes.io/cluster/awake-cluster" = "shared"
  }
  public_subnet_tags = {
    "kubernetes.io/cluster/awake-cluster" = "shared"
    "kubernetes.io/role/elb"              = 1

  }
  private_subnet_tags = {
    "kubernetes.io/cluster/awake-cluster" = "shared"
    "kubernetes.io/role/private_elb"      = 1

  }
}

#EKS

module "eks" {
  source                         = "terraform-aws-modules/eks/aws"
  cluster_name                   = "awake-cluster"
  cluster_version                = "1.30"
  cluster_endpoint_public_access = true
  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets

  eks_managed_node_groups = {
    nodes = {
      min_size       = 1
      max_size       = 4
      desired_size   = 3
      instance_types = var.instance_types
    }
  }
  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}

# data "aws_eks_cluster" "cluster" {
#   name = module.eks.cluster_name
# }

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name
}
output "cluster_id" {
  value = module.eks.cluster_id
}
resource "kubernetes_cluster_role_binding" "node_reader" {
  metadata {
    name = "read-nodes"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "node-reader"
  }
  subject {
    kind      = "User"
    name      = "arn:aws:iam::851725178273:user/dimitri"
    api_group = "rbac.authorization.k8s.io"
  }
}