# chef-barricade
========================

This cookbook allows you to automate the setup of the [Barricade.io](https://barricade.io) agent so that you can
have confidence in your infrastructure's security and gain immediate completely visibility into
your security operations and continuously test your security as you develop and build.

## Requirements
------------

- Ubuntu 12.04 (64-bit)
- Ubuntu 14.04 LTS (64-bit)
- Ubuntu 14.10 (64-bit)
- CentOS 6.5 (64-bit)
- CentOS 7.0 (64-bit)

## Attributes
----------

#### barricade::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['barricade']['barricade_key']</tt></td>
    <td>String</td>
    <td>Your Barricade.io automation license retrievable from [your team page](https://app.barricade.io/dashboard/settings/team/profile)</td>
    <td><tt>Required</tt></td>
  </tr>
  <tr>
    <td><tt>['barricade']['install_script']</tt></td>
    <td>String</td>
    <td>The URL from which to fetch the Barricade install script. Dependent on your Barricade automation key.</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['barricade']['tags']</tt></td>
    <td>String</td>
    <td>An arbitrary scalar value taht will be used by your and your team to effectively <tt>tag</tt> results sent to the Barricade platform. Use comma-separation to set multiple tags</td>
    <td><tt>prod, chef</tt></td>
  </tr>

See the attributes/default.rb for more advanced attributes related to the agent.

</table>

Usage
-----
#### barricade::default

Make sure to retrieve your [automation key](https://app.barricade.io/dashboard/settings/team/profile) from your [Barricade](https://app.barricade.io) dashboard and edit the `attributes/default.rb` file to specifiy your `barricade_key`. 

If you want to tag your deployments, you can also modify the `tags` key to contain any string. A comma-delimited string means you'll have multiple tags.

e.g.
Just include `barricade` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[barricade]"
  ]
}
```

## TODO

Including, but not limited to ...

* Fully support all of the standard Chef-supported distributions
* Support additonal build configurations
* Support additonal configuration file attributes


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

See [LICENSE](LICENSE.md)
