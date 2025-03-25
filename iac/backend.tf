# terraform {
#   backend "s3" {
#     bucket         = "hipaa-terraform-state"
#     key            = "terraform/eks.tfstate"
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "terraform-state-locks"
#   }
# }