locals {
  namespace = var.namespace

  iamrole = {
    name = "instance-web"

    assume_role_policy = data.aws_iam_policy_document.ec2_assume_role_policy
    policy_arn         = data.aws_iam_policy.aws_ssm_core_policy.arn
  }
}