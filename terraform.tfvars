// Assign values to variables here in .tfvars

sample-alert-1 = "rawsum(ts(sample.metric.5xx, az=us-west-1, env=prod))"
sample-alert-2 = "mmax(10m, ts(sample.metric.latency, az=us-west-1, env=prod)"
sample-alert-3 = "mavg(30m, ts(sample.metric.availability, az=us-west-1, env=prod))"