locals {
  org       = "tf-core"
  project   = "lab01"
  namespace = "${local.org}-${local.project}"

  message = "HELLO WORLD from ${local.namespace}"
}