## Alerts as code!
### Configuring monitoring by hand is fragile and tedious. 
*Setting up a new dashboard?* You have to clone an existing dashboard, or migrate charts one by one, tweaking each as needed. *Creating new alerts?* Copy/paste alert expressions and conditions, double check that you have your fire/resolve values set, what was that tag that I needed to apply again? *Updating existing alerts or dashboards?* My team switched metrics sources and all of our alerts and dashboard are broken. Do I seriously have to navigate the UI and fix each one individually?

*Arghh! Why so many manual touchpoints?!*

### How can I make this process repeatable and programmatic?
Instead, we can borrow core infrastructure-as-code (IaC) techniques to make configuring our alerts/dashboards repeatable and programmatic. Think of this as a move toward a "cattle not pets" model for observability. You made a change to the metric we're using for one service? No problem - make the change once in a config file and it immediately modifies all of our existing dashboards/alerts that currently use that metric. 
 
One way to implement this is to use a Wavefront Terraform provider 
    - see: https://github.com/wavefrontHQ/terraform-provider-wavefront

**Benefits of this approach:**
1. Programmatic creation, modification, and destruction of alerts and dashboards in Wavefront
    - no more manually navigating between dashboards or making the same change in more than one place
    - allows alerts and dashboards to be standardized into templates and modules for ease of use
    - can copy/paste existing blocks of code to replicate items quickly and efficiently
2. Version control (git) and quality control via reviews
3. Easy tag management 
    - Variables allow us to assign and modify tags on all team resources quickly and easily
4. Programmatic update of alert targets
    - add/remove/modify Pagerduty escalation targets, email lists, Slack webhooks, etc

## Alerting standards
**All active alerts should:**
1. Use *current* metric sources that align with top line dashboards
2. Be set to an actionable threshold (e.g., if alert fires then team begins investigation or escalation to service owner)
3. Maintain an acceptable signal/noise ratio (e.g., 5:1 or >80% signal)
4. Be managed via version control (git)
5. Adhere to standardized tagging and naming conventions
6. Be created and managed programmatically, not manually

