locals {
  org       = "tf-core"
  project   = "lab01"
  namespace = "${local.org}-${local.project}"

  message = "HELLO Terraform from ${local.namespace}"
}