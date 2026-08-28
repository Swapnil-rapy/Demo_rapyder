terraform {
  backend "s3" {
    bucket = "demo-project-terraform-state-2026"
    key    = "sample-project/terraform.tfstate"
    region = "ap-south-1"

    encrypt      = true
    use_lockfile = true
  }
}

