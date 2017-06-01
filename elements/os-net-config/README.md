Install, configure, and (optionally) run os-net-config.

Installs os-net-config and configures a JSON formatted config file
at /etc/os-net-config/element\_config.json. The os-net-config command
is only executed if configuration metadata is provided.

Configuration
-------------
os\_net\_config: JSON (or YAML) metadata in the os-net-config format.

Config Examples:
---------------

```
 { "os_net_config":
     { "network_config": [
         {
             "type": "ovs_bridge",
             "name": "br-ctlplane",
             "use_dhcp": "true",
             "primary": "true",
             "members": [
                 {
                     "type": "interface",
                     "name": "em1"
                 }
             ]
         }
     ]}
 }
```
