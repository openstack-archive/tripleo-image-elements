A pre-determined master for initial bootstrapping

Configuration
-------------

For initial master election, `bootstrap_nodeid` and `node_id` should be set
to the ID string of the node which will be used as initial master and the id
string of the current node.

A host where os-is-bootstrap-host is true (has exit value and output of 0)

    bootstrap_host:
      bootstrap_nodeid: "SomeNode1"
      nodeid: "SomeNode1"

A host where os-is-bootstrap-host is false (has exit value and output of 1)

    bootstrap_host:
      bootstrap_nodeid: "SomeNode1"
      nodeid: "SomeNode2"

If either of these values is undefined, the exit value and output of the script
will be 255.
