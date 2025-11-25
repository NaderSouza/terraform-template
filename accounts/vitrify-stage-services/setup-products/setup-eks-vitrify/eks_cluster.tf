# ==================================================================
# MODULE: AWS EKS - DEFAULT
# ==================================================================

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.21"

  # ==================================================================
  # CLUSTER INFORMATION
  # ==================================================================
  cluster_name    = local.aws_eks.cluster_name
  cluster_version = local.aws_eks.cluster_version
  enable_irsa     = true

  # ==================================================================
  # NETWORK CONFIGURATION
  # ==================================================================
  vpc_id     = local.aws_eks.vpc_id
  subnet_ids = local.aws_eks.subnet_ids

  # ==================================================================
  # CLUSTER ENDPOINT ACCESS
  # ==================================================================
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  # ==================================================================
  # NODE SECURITY GROUP TAGS
  # ==================================================================
  node_security_group_tags = {
    "kubernetes.io/cluster/${local.aws_eks.cluster_name}" = null
  }

  # ==================================================================
  # NODE SECURITY GROUP ADDITIONAL RULES
  # ==================================================================
  node_security_group_additional_rules = {
    ingress_self_all = {
      description = "Node to node all ports/protocols"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      type        = "ingress"
      self        = true
    },
    ingress_cluster_to_node_all_traffic = {
      description                   = "Cluster API to Nodegroup all traffic"
      protocol                      = "-1"
      from_port                     = 0
      to_port                       = 0
      type                          = "ingress"
      source_cluster_security_group = true
    }
  }

  # ==================================================================
  # MANAGED NODE GROUP DEFAULTS
  # ==================================================================
  eks_managed_node_group_defaults = {
    attach_cluster_primary_security_group = true
    iam_role_attach_cni_policy            = true
    iam_role_additional_policies = {
      AmazonEKSWorkerNodePolicy          = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
      AmazonEKS_CNI_Policy               = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
      AmazonEC2ContainerRegistryReadOnly = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
      AmazonSSMManagedInstanceCore       = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    }
  }

  # ==================================================================
  # FARGATE PROFILES
  # ==================================================================
  fargate_profiles = {
    karpenter = {
      name = "karpenter"
      selectors = [
        { namespace = "karpenter" }
      ]
    }
  }

  # ==================================================================
  # MANAGED NODE GROUPS
  # ==================================================================
  eks_managed_node_groups = {
    green = {
      name              = "eks-green-worknodes"
      min_size          = 1
      max_size          = 5
      desired_size      = 2
      capacity_type     = "ON_DEMAND"
      instance_types    = ["t3a.medium"]
      ebs_optimized     = true
      enable_monitoring = true
      block_device_mappings = {
        xvda = {
          device_name = "/dev/xvda"
          ebs = {
            volume_size           = 64
            volume_type           = "gp3"
            iops                  = 3000
            throughput            = 150
            encrypted             = true
            delete_on_termination = true
          }
        }
      }
      tags = {
        worknodes = "green"
      }
      labels = {
        worknodes = "green"
      }
    }
  }

  # ==================================================================
  # CLUSTER LOGGING
  # ==================================================================
  cluster_enabled_log_types              = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  create_cloudwatch_log_group            = true
  cloudwatch_log_group_retention_in_days = 365

  # ==================================================================
  # ENCRYPTION WITH KMS
  # ==================================================================
  create_kms_key = false
  cluster_encryption_config = {
    resources        = ["secrets"]
    provider_key_arn = module.kms.key_arn
  }

  # ==================================================================
  # EXTRA TAGS
  # ==================================================================
  tags = {
    "karpenter.sh/discovery" = local.aws_eks.cluster_name
  }
}
