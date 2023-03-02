variable "region" {
  type        = string
  description = "describe your region"
}
variable "role_arn" {
  type        = string
  description = "role of the account."
}

variable "artifacts_bucket" {
  description = "artifacts bucket"
  type = string
}
variable "codepipeline_role_name" {
  description = "codepipeline_role_name"
  type = string
}
variable "pipeline_details" {
  description = "pipeline_details"
  type = list (any)
}

# variable "pipeline_name" {
#   description = "Pipeline name for user account"
#   type = string
# }
# variable "code_build_project_name" {
#   description = "code_build_project_name"
#   type = string
# }


# variable "branchname" {
#   description = "Branch Name of Github Repo"
#   type = string
# }

# variable "repo_name" {
#   description = "Pipeline name for user account"
#   type = string
# }


