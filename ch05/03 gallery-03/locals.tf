locals {
  org       = "tf-core"
  project   = "gallery03"
  
  namespace = "${local.org}-${local.project}"

  infra = {
    lt = {
      service_port = 8080
    }
  }
}