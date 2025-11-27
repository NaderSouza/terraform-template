# ==================================================================
# ELASTIC CONTAINER REGISTRY - ECR PRIVATE
# ==================================================================
module "private_ecr" {
  source  = "terraform-aws-modules/ecr/aws"

  repository_name                   = "${local.ecr_repository_name}/app"
  # repository_read_write_access_arns = ["arn:aws:iam::012345678901:role/terraform"]
  repository_lifecycle_policy       = file("./json-policy/repo_lifecycle_policy.json")

  tags = local.aws_default_tags
}

# ==================================================================
# ELASTIC CONTAINER REGISTRY - ECR PUBLIC
# ==================================================================

# module "public_ecr" {
#   source = "terraform-aws-modules/ecr/aws"

#   repository_name                   = "${local.ecr_repository_name}-public"
#   repository_type                   = "public"
#   repository_read_write_access_arns = ["arn:aws:iam::012345678901:role/terraform"]

#   public_repository_catalog_data = {
#     description       = "Docker container for some things"
#     about_text        = file("${path.module}/files/ABOUT.md")
#     usage_text        = file("${path.module}/files/USAGE.md")
#     operating_systems = ["Linux"]
#     architectures     = ["x86"]
#     logo_image_blob   = filebase64("${path.module}/files/clowd.png")
#   }

#   tags = local.aws_default_tags
# }