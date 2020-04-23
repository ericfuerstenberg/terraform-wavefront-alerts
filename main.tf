
// Create Wavefront alerts here:
// Call the 'alert' module
// Specify the desired alert name
// Terraform will automatically pull the expression and alert_condition variables from the variabiles.tf file

// Sample Alert 1
module "sample-alert-1" {
  source = "./alert"
  alert_name = "Sample Alert 1"
  expression = "${var.sample-alert-1}"
  alert_condition = "${var.sample-alert-1} > 3"
}

// Sample Alert 2
module "sample-alert-2" {
  source = "./alert"
  alert_name = "Sample Alert 2"
  expression = "${var.sample-alert-2}"
  alert_condition = "${var.sample-alert-2} > .5"
}

// Sample Alert 3
module "sample-alert-3" {
  source = "./alert"
  alert_name = "Sample Alert 3"
  expression = "${var.sample-alert-3}"
  alert_condition = "${var.sample-alert-3} > .5"
}
