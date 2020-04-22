// Wavefront API token for programmatic access
// First, set an environment variable.. e.g.,
// $ export TF_VAR_api_token='api-key-here'
variable api_token {
	type = "string"
	default = "dbde61aa-cb7b-4fe9-b6fd-023f2466c92a"
}

// Defining alert metrics

variable "api-failure-expression" {
	type = "string"
	default = "100* (sum(rate(ts(api-gateway*.5xx-gateway-status-code-count.count , namespace=\"api-gateway-prod\" and cluster_group=\"us-las-prod-ava\")))/sum(rate(ts(api-gateway*.request-count.count , namespace=\"api-gateway-prod\" and cluster_group=\"us-las-prod-ava\"))))"
}

variable "upload-failure-expression" {
	type = "string"
	default = "hideAfter(1m, ((rawsum(rate(align(1m, first, last(10m, ts(upload-proxy*.jetty.responses.5xx.value, (env=live and not dc=dev) and ((host=upload* or host=compute* or host=upload-proxy-*) and not host=upload-mail*)))))) - rawsum(rate(align(1m, first, last(10m, ts(upload-proxy*.request.completed.count, (env=live and not dc=dev) and ((host=upload* or host=compute* or host=upload-proxy-*) and not host=upload-mail*) and statusCode=\"5*\" and (classification=sync or classification=drive or classification=unclassified)))))) - rawsum(rate(align(1m, first, last(10m, ts(upload-proxy*.request.completed.count, (env=live and not dc=dev) and ((host=upload* or host=compute* or host=upload-proxy-*) and not host=upload-mail*) and (statusCode=\"501\" or statusCode=\"507\") and not classification=sync and not classification=drive and not classification=unclassified)))))) / rawsum(rate(align(1m, first, last(10m, ts(upload-proxy*.request.completed.count, (env=live and not dc=dev) and ((host=upload* or host=compute* or host=upload-proxy-*) and not host=upload-mail*) and not classification=sync and not classification=drive and not classification=unclassified))))) * 100))"
}

variable "download-failure-expression" {
	type = "string"
	default = "hideAfter(1m, (sum(rate(ts(download-proxy-*.jetty.responses.5xx.value, (env=live and not dc=dev) and (host=download* or host=compute*))))) / (sum(align(1m, first, last(10m, ts(download-proxy-*.jetty.requests.active.value, (env=live and not dc=dev) and (host=download* or host=compute*)))))) * 100)"
}

variable "notes-reconnects-expression" {
	type = "string"
	default = "(sum(default(0, align(4m, sum, ts(storm.box_notes.reconnects, env=live and didHardReconnect=true)))) / rawsum(align(4m, sum, ts(storm.box_notes.pad_count, env=live and server=*)))) * 100"
}

variable "notes-disconnects-expression" {
	type = "string"
	default = "(sum(default(0, align(4m, sum, ts(storm.box_notes.reconnects, env=live and didHardReconnect=true)))) / rawsum(align(4m, sum, ts(storm.box_notes.pad_count, env=live and server=*)))) * 100"
}

variable "fhd-upload-health-expression" {
	type = "string"
	default = "(rawsum(last(10m,ts(~alert.isfiring.*, alertTag1=health_dashboard.int-api.* and not alertTag1=health_dashboard.int-api.gt_20pct_disabled))) > 0) + (rawsum(last(10m, ts(~alert.isfiring.*, alertTag1=health_dashboard.rule-manager.*))) + rawsum(last(10m, ts(~alert.isfiring.*, alertTag1=health_dashboard.job-manager.*))) > 0) + (rawsum(last(10m, ts(~alert.isfiring.*, alertTag2=storage_service.health))) > 0) + (rawsum(last(10m, ts(~alert.isfiring.*, alertTag1=health_dashboard.storage_worker.*))) + rawsum(last(10m, ts(~alert.isfiring.*, alertTag1=health_dashboard.ses.*))) > 0) + (rawsum(last(10m, ts(~alert.isfiring.*, (alertTag1=health_dashboard.keds.* or alertTag2=health_dashboard.keds.* or alertTag3=health_dashboard.keds.*)))) > 0) + (rawsum(last(10m, ts(~alert.isfiring.*, (alertTag1=health_dashboard.iks.* or alertTag2=health_dashboard.iks.* or alertTag3=health_dashboard.iks.*)))) > 0) + (rawsum(last(10m, ts(~alert.isfiring.*, alertTag2=mqs.health))) > 0) + (rawsum(last(10m, ts(~alert.isfiring.*, alertTag2=mqs.health))) > 0) + (rawsum(last(10m, ts(~alert.isfiring.*, alertTag1=health_dashboard.upload-proxy.*))) > 0) + (rawsum(last(10m, ts(~alert.isfiring.*, alertTag1=health_dashboard.credence.*))) > 0) + (rawsum(last(10m, ts(~alert.isfiring.*, alertTag1=health_dashboard.vault.*))) + rawsum(last(10m, ts(~alert.isfiring.*, alertTag1=health_dashboard.redis_cluster.relationship*))) > 0) + (rawsum(last(10m, ts(~alert.isfiring.*, alertTag3=health_dashboard.hbase.mqs.*))) > 0) + (rawsum(last(10m, ts(~alert.isfiring.*, alertTag2=health_dashboard.redis_cluster.multiput.*))) > 0) + (rawsum(last(10m, ts(~alert.isfiring.*, alertTag2=health_dashboard.hbase.ekm.*))) > 0) + (rawsum(last(10m, ts(~alert.isfiring.*, alertTag1=health_dashboard.boxfiler.*))) + rawsum(last(10m, ts(~alert.isfiring.*, alertTag2=health_dashboard.hbase.ssvc.*))) > 0) + (rawsum(last(10m, ts(~alert.isfiring.*, alertTag2=health_dashboard.mysql.*))) > 0) > 0"
}