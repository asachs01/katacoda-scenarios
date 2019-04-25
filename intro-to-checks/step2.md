To write a check, we provide the following:

* The `api_version`
* The `type` of the resource we're creating
* Some metadata for our check 
  * The `namespace` our check will reside in
  * The `name` of our check
* Some `spec` attributes for our check
  * The check `command`
  * The `subscriptions` our check will 
  * Any `handlers` we'll use (and we'll learn more about these later)
  * Setting the `publish` attribute for our check
  * The `interval` we want our check run at

We can do some other interesting things with checks, but we'll stick with these attributes for now. Let's create this check and see what it does.

If you're wanting to learn more about Sensu checks, you can click the reference link below.
  
## Resources

* [Sensu checks reference][1]

<!--LINKS-->
[1]: https://docs.sensu.io/sensu-go/latest/reference/checks/