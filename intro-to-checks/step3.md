So far, we've discussed what a check is and what a basic one might look like. Let's actually create the check.

(`sensuctl create -f /etc/sensu/check-cpu.yaml`{{execute}})

And then verify that our check was created

(`sensuctl check list`{{execute}})

We can also get detailed information from our check via sensuctl:

(`sensuctl check info check-cpu`{{execute}})

You can head over to the dashboard and see the check in action. Click on "Checks" --> check-cpu. 