///////////////////
// Main variables
///////////////////

// Wavefront API token for programmatic access
// First, set an environment variable.. e.g.,
// $ export TF_VAR_api_token='api-key-here'
variable api_token {}


// Defining specific alert metrics
variable "sample-alert-1" {
	type = "string"
	default = "100* (sum(rate(ts(api-gateway*.5xx-gateway-status-code-count.count , namespace=\"api-gateway-prod\" and cluster_group=\"us-las-prod-ava\")))/sum(rate(ts(api-gateway*.request-count.count , namespace=\"api-gateway-prod\" and cluster_group=\"us-las-prod-ava\"))))"
}

variable "sample-alert-2" {
	type = "string"
	default = "hideAfter(1m, ((rawsum(rate(align(1m, first, last(10m, ts(upload-proxy*.jetty.responses.5xx.value, (env=live and not dc=dev) and ((host=upload* or host=compute* or host=upload-proxy-*) and not host=upload-mail*)))))) - rawsum(rate(align(1m, first, last(10m, ts(upload-proxy*.request.completed.count, (env=live and not dc=dev) and ((host=upload* or host=compute* or host=upload-proxy-*) and not host=upload-mail*) and statusCode=\"5*\" and (classification=sync or classification=drive or classification=unclassified)))))) - rawsum(rate(align(1m, first, last(10m, ts(upload-proxy*.request.completed.count, (env=live and not dc=dev) and ((host=upload* or host=compute* or host=upload-proxy-*) and not host=upload-mail*) and (statusCode=\"501\" or statusCode=\"507\") and not classification=sync and not classification=drive and not classification=unclassified)))))) / rawsum(rate(align(1m, first, last(10m, ts(upload-proxy*.request.completed.count, (env=live and not dc=dev) and ((host=upload* or host=compute* or host=upload-proxy-*) and not host=upload-mail*) and not classification=sync and not classification=drive and not classification=unclassified))))) * 100))"
}

variable "sample-alert-3" {
	type = "string"
	default = "hideAfter(1m, (sum(rate(ts(download-proxy-*.jetty.responses.5xx.value, (env=live and not dc=dev) and (host=download* or host=compute*))))) / (sum(align(1m, first, last(10m, ts(download-proxy-*.jetty.requests.active.value, (env=live and not dc=dev) and (host=download* or host=compute*)))))) * 100)"
}
