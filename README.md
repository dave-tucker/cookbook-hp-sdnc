HP SDN Controller Cookbook
==========================
This cookbook installs the HP SDN Controller on an Ubuntu system

Requirements
------------

 - This cookbook currently supports Ubuntu only.
 - Cookbook dependencies are managed by Berkshelf.
 - You need to supply your own .deb package and place it in "files/default/"

Attributes
----------

#### hp-sdnc::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['hp-sdnc']['version']</tt></td>
    <td>String</td>
    <td>SDN Controller Version</td>
    <td><tt>1.21.0.4151</tt></td>
  </tr>
    <tr>
    <td><tt>['hp-sdnc']['openstack']</tt></td>
    <td>String</td>
    <td>Openstack Version</td>
    <td><tt>grizzly</tt></td>
  </tr>
</table>

Usage
-----
#### hp-sdnc::default

Just include `hp-sdnc` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[hp-sdnc]"
  ]
}
```

You can install a different version of the SDN controller or openstack by overriding the default attributes:

```json
{
  "override_attributes": {
    "hp-sdnc": {
      "version": "1.X.Y.Z"
      "openstack": "folsom"
    }
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Dave Tucker,
Copyright 2013, Hewlett-Packard Development Company
Licensed under the terms of the Apache v2.0 License
