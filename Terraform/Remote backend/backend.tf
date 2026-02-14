terraform {
  backend "s3" {
    bucket = "my-tf-balaji-bucket-2026-02"
    key    = "balaji/terraform.tfstate"
    region = "ap-south-1"
  }
}
