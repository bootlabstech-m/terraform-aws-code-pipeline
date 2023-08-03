resource "aws_iam_role" "codepipeline_role" {
  name = var.codepipeline_role_name

#   assume_role_policy = var.assume_role_policy
assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
  lifecycle {
    ignore_changes = [tags]
  }
}
resource "aws_codepipeline" "codepipeline" {
  for_each = { for pipeline in var.pipeline_details : pipeline.pipeline_name => pipeline } 
  name     = each.value.pipeline_name
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.codepipeline_bucket.bucket
    type     = "S3"

  }

  stage {
    name = "Code-Checkout"

    action {
      name             = "Code-Checkout-Codecommit"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["source_output"]
      

      configuration = {
        RepositoryName   = each.value.repo_name
        BranchName       = each.value.branchname
        PollForSourceChanges = "false"
     }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
       input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]

      configuration = {
        ProjectName = each.value.code_build_project_name
      }
    }
  }
    lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = var.artifacts_bucket
  acl    = "private"
    lifecycle {
    ignore_changes = [tags]
  }
}


