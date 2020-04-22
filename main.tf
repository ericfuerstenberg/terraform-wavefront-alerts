
// Create our Wavefront alerts here:
// Call the 'alert' module
// Specify the desired alert name
// Terraform will automatically pull the expression and alert_condition variables from the variabiles.tf file

// API-Gateway Failures
module "api-alert" {
  source = "./alert"
  alert_name = "API-Gateway FAILURE Rate High - Module Test"
  expression = "${var.api-failure-expression}"
  alert_condition = "${var.api-failure-expression} > 3"
}

// Upload Failures
module "upload-alert" {
  source = "./alert"
  alert_name = "Uploads FAILURE Rate High - Module Test"
  expression = "${var.upload-failure-expression}"
  alert_condition = "${var.upload-failure-expression} > .5"
}

// Download Failures
module "download-alert" {
  source = "./alert"
  alert_name = "Downloads FAILURE Rate High - Module Test"
  expression = "${var.download-failure-expression}"
  alert_condition = "${var.download-failure-expression} > .5"
}

// Notes Hard Reconnects
module "notes-reconnect-alert" {
  source = "./alert"
  alert_name = "Box Notes HARD RECONNECT Rate High - Module Test"
  expression = "${var.notes-reconnects-expression}"
  alert_condition = "${var.notes-reconnects-expression} > 5"
}

// Notes Disconnects
module "notes-disconnect-alert" {
  source = "./alert"
  alert_name = "Box Notes DISCONNECTS Rate High - Module Test"
  expression = "${var.notes-disconnects-expression}"
  alert_condition = "${var.notes-disconnects-expression} > 2"
}

// FHD Service Unhealthy
module "fhd-alert" {
  source = "./alert"
  alert_name = "FHD Service Unhealthy - Module Test"
  expression = "${var.fhd-upload-health-expression}"
  alert_condition = "${var.fhd-upload-health-expression} > 0"
}