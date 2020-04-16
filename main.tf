// API-Gateway FAILURE
resource "wavefront_alert" "api-gateway-failure" {
  name = "API-Gateway FAILURE Rate High - Terraform"
  target = "${var.email-target}"
  condition = "${var.api-failure-expression} > 3"
  display_expression = "${var.api-failure-expression}"
  minutes = 1
  resolve_after_minutes = 5
  severity = "SEVERE"
  tags = "${var.tags}"
}

// Upload FAILURE 
resource "wavefront_alert" "upload-failure" {
  name = "Upload FAILURE Rate High - Terraform"
  target = "${var.email-target}"
  condition = "${var.upload-failure-expression} > .5"
  display_expression = "${var.upload-failure-expression}"
  minutes = 1
  resolve_after_minutes = 5
  severity = "SEVERE"
  tags = "${var.tags}"
}

// Download FAILURE
resource "wavefront_alert" "download-failure" {
  name = "Download FAILURE Rate High - Terraform"
  target = "${var.email-target}"
  condition = "${var.download-failure-expression} > .5"
  display_expression = "${var.download-failure-expression}"
  minutes = 1
  resolve_after_minutes = 5
  severity = "SEVERE"
  tags = "${var.tags}"
}

// Box Notes HARD RECONNECTS
resource "wavefront_alert" "notes-reconnects" {
  name = "Box Notes HARD RECONNECT Rate High - Terraform"
  target = "${var.email-target}"
  condition = "${var.notes-reconnects-expression} > 5"
  display_expression = "${var.download-failure-expression}"
  minutes = 1
  resolve_after_minutes = 5
  severity = "SEVERE"
  tags = "${var.tags}"
}

// Box Notes DISCONNECTS
resource "wavefront_alert" "notes-disconnects" {
  name = "Box Notes DISCONNECTS Rate High - Terraform"
  target = "${var.email-target}"
  condition = "${var.notes-disconnects-expression} > 2"
  display_expression = "${var.download-failure-expression}"
  minutes = 1
  resolve_after_minutes = 5
  severity = "SEVERE"
  tags = "${var.tags}"
}

// FHD Unhealthy
resource "wavefront_alert" "fhd-upload-unhealthy" {
  name = "FHD Service Unhealthy - Terraform"
  target = "${var.email-target}"
  condition = "${var.notes-disconnects-expression} > 2"
  display_expression = "${var.download-failure-expression}"
  minutes = 1
  resolve_after_minutes = 5
  severity = "SEVERE"
  tags = "${var.tags}"
}