Installs apt-mirror from packages.

Please note that Debian or Ubuntu mirrors are very large -- a single
architecture of a single series is roughly 50GiB, and a full Ubuntu archive
is on the order of 600GiB -- so please keep in mind when you attach storage.

Configuration
-------------

    debian-mirror:
      mirror: "http://archive.ubuntu.com/ubuntu"
        # The mirror you wish to mirror from.
      suites: ["saucy", "saucy-updates", "saucy-security"]
        # An array of suites you wish to mirror, such as `saucy' or `wheezy'.
      architectures: [{"arch": "amd64"}]
        # An array of dictionaries containing the architectures you wish to
        # mirror.
      components: ["main", "restricted", "universe", "multiverse"]
        # An array of components you wish to mirror, such as `main' or
        # `non-free'.
