A self-contained one-node baremetal openstack.

## instructions for use:

- Edit "virtual_power_user"  in config.json, if using the VirtualPowerDriver.

- Build this element into an image and boot it. (see https://github.com/tripleo/incubator)

- SSH in as `root`.

- Upon first boot, it will take a couple minutes to initialize nova and glance.  Progress can be observed in `/var/log/first-boot.d.log`. `/opt/stack/boot-stack/ok` will be touched upon completion

- `source` OpenStack credentials from /root/stackrc.

- Allow nova ssh access to your host, if using VirtualPowerDriver:
```bash
ssh -o StrictHostKeyChecking=no \
    -o UserKnownHostsFile=/dev/null \
    root@192.168.122.144 cat /opt/stack/boot-stack/virtual-power-key.pub >> ~/.ssh/authorized_keys
```

- Add some baremetal nodes to nova. e.g.:

```bash
nova baremetal-node-create ubuntu 1 2 10 52:54:00:bc:2c:1a --pm_address 192.168.122.1 --pm_user $USER --pm_password $PASS
nova baremetal-interface-add $id 52:54:00:bc:2c:1a
# in a few seconds, an entry will appear in the nova.compute_nodes table, after which the bm node is ready.
```

- If a disk image existed at `/root/demo.qcow2` during first boot, it will already be in glance. Else, or if you wish to install more images, see /usr/local/bin/reset-nova for an example.

- Perform a baremetal-boot: `nova boot --image demo --flavor baremetal test"

- See progress in the logs: `boot-stack-logs`

- At any time, you may completely reset OpenStack state: `sudo wipe-openstack`
