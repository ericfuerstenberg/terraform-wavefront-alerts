// Define the S3 bucket you would like to use as your terraform backend to store your .tfstate file
// Create a dynamo-db table to handle locking the state of your .tfstate file
// Assign an aws cli profile to your service account

terraform {
 backend "s3" {
   bucket         = "terraform-backend-bucket"
   key            = "terraform.tfstate"
   region         = "us-east-1"
   encrypt        = true
   dynamodb_table = "terraform-lock"
   profile        = "terraform"
 }