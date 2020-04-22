// Defining Wavefront provider
// api_token is intentionally masked, see notes in variables.tf on how to define

provider "wavefront" {
	address = "box.wavefront.com"
	token = "${var.api_token}"
}
