///////////////////////////////////
// Declare your main variables here
///////////////////////////////////

// Wavefront API token for programmatic access
// First, set an environment variable.. e.g.,
// $ export TF_VAR_api_token='api-key-here'
variable api_token {}


// Defining specific alert metrics
variable "sample-alert-1" {
	type = "string"
}

variable "sample-alert-2" {
	type = "string"
}

variable "sample-alert-3" {
	type = "string"
}
