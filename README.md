## Nlerting standards
**All active alerts should:**
1. Use *up-to-date* metric sources that align with top line dashboards
2. Be set to an actionable threshold (e.g., if alert fires then team begins investigation or escalation to service owner)
3. Maintain an acceptable signal/noise ratio (e.g., 5:1 or >80% signal)
4. Be managed via version control (git) and adhere to standardized tagging and naming conventions


## Alerts as code!
I propose that we implement industry standard, infrastructure as code best practices to create our alerts and dashboards programmatically. Think of this as a move toward a "cattle not pets" model. You made a change to the metric we're using for Uploads? No problem - make the change once in a config file and it immediately applies to all of our existing dashboards/alerts that currently use that metric. 

One way to implement this is to use a Wavefront Terraform provider 
    - see: https://github.com/wavefrontHQ/terraform-provider-wavefront

**Benefits:**
1. Version control (git)
2. Programmatic creation, modification, and destruction of alerts and dashboards in Wavefront
    - no more manually navigating between dashboards or making the same change in more than one place
    - allows alerts and dashboards to be standardized into templates and modules for ease of use
    - can copy/paste existing blocks of code to replicate items quickly and efficiently
3. Easy tag management 
    - Variables allow us to assign and modify tags on all NOC resources quickly and easily
4. Programmatic update of alert targets
    - add/remove/modify pagerduty escalation targets, email lists, slack webhooks, etc
