# terraform-noc-alerts

**All active NOC alerts should be:**
1. Tied to current topline metrics
2. Set to an actionable threshold (e.g., alert fires and NOC begins investigation or escalation to service owner
3. Managed via version control and adhere to similar tagging and naming conventions

I'm proposing that we implement infra as code best practices and create our alerts and dashboards programmatically. Think of this as a move toward a "cattle not pets" model for our alerts and dashboards. You made a change to the metrics we're using for Uploads? No problem - make the change once in the variables.tf file and it immediately applies to all of our existing dashboards/alerts that rely on that  variable.

One way to implement this is to use a Wavefront Terraform provider.
https://github.com/wavefrontHQ/terraform-provider-wavefront

**This gives us:**
1. Version control (git)
2. Programmatic creation, modification, and destruction of alerts and dashboards in Wavefront
    - no more manually editing in the console or making the same change in more than one place
    - allows alerts and dashboards to be templatized for easy replication
    - can copy/paste existing blocks of code to replicate items quickly and efficiently
3. Easy tag management 
    - Variables allow us to assign and modify tags on all NOC resources quickly and easily
4. Programmatic update of alert targets
    - add/remove/modify pagerduty escalation targets, email lists, slack webhooks, etc
