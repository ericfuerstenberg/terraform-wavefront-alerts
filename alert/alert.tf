
// Module to create a Wavefront Alert
resource "wavefront_alert" "alert" {
  name = "${var.alert_name}"
  target = "${var.email-target}"
  condition = "${var.alert_condition}"
  display_expression = "${var.expression}"
  minutes = "${var.fire}"
  resolve_after_minutes = "${var.resolve}"
  severity = "${var.severity}"
  tags = "${var.tags}"
}


