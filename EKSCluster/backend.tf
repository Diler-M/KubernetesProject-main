terraform {
  backend "s3" {
    bucket = "diler-eks-cluster-bucket"
    key    = "K8inEKS/terraform.tfstate"
    region = "eu-west-2"
  }
}
