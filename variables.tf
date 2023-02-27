variable "region" {
  type        = string
  description = "describe your region"
}
# variable "role_arn" {
#   type        = string
#   description = "role of the account."
# }

variable "artifacts_bucket" {
  description = "artifacts bucket"
  type = string
}
variable "code_build_project_name" {
  description = "code_build_project_name"
  type = string
}
variable "FullRepositoryId" {
  description = "Repository Path/Name of github Example: my-organization/exampleRepo"
  type = string
}

variable "BranchName" {
  description = "Branch Name of Github Repo"
  type = string
}

variable "ProjectName" {
  description = "Project Name for Build source"
  type = string
}

variable "bucket" {
  description = "Name of S3 Bucket"
  type = string
}

variable "acl" {
  description = "S3 Bucket permission : private / public"
}

variable "codepipeline_role_name" {
  description = "codepipeline_role_name"
  type = string
}


variable "pipeline_name" {
  description = "Pipeline name for user account"
  type = string
}

variable "repo_name" {
  description = "Pipeline name for user account"
  type = string
}

# variable "codepipeline_policy_name" {
#   description = "codepipeline_policy_name"
#   type = string
# }
# variable "codepipeline_policy_name" {
#   description = "codepipeline_policy_name"
#   type = string
# }
# variable "codepipeline_policy_name" {
#   description = "codepipeline_policy_name"
#   type = string
# }