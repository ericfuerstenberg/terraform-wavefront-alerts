////////////////////////////////////////
// Input variables for 'alert' module
////////////////////////////////////////


// Define alert name
variable "alert_name" {
	type = "string"
}

// Assign expressions to alerts
variable "expression" {
	type = "string"
}

// Define the condition under which the alert will fire
variable "alert_condition" {
	type = "string"
}

// Defining alert recipients
// Can include PD, email, slack, etc.
variable "email-target" {
	type = "string"
	default = "youremail@default.com"
}

// Defining common list of tags to be applied to each alert
variable "tags" {
	type = "list"
	default = [
		"terraform",
		"test"
	]
}

// Defining logic for when alerts fire and resolve. 
// Value represents the number of minutes where condition must be met before the alert fires or resolves. 
variable "fire" {
	type = "string"
	default = 1
}

variable "resolve" {
	type = "string"
	default = 5
}

// Define severity for alert 
// Note: all alerts should be 'SEVERE' status

variable "severity" {
	type = "string"
	default = "SEVERE"
}

