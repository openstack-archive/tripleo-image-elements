This element contains code common for mysql and mariadb elements, make sure
you include once of them when including this element.

TODO: auto-tune settings based on host resources or metadata service.

Configuration
-------------

Users will be created if Heat Metadata is passed in under the
'mysql.create-users' section. For example:

    mysql:
      create-users:
        - username: dbuser1
          database: somedb
          userhandle:
            Ref: SomeWaitConditionHandle

This will cause mysql to create the user 'dbuser1' if it does not exist,
and grant it all privileges on somedb. If no 'database' parameter is supplied,
the user will be given access to all databases. It will have a random password
generated and passed to the WaitConditionHandle with the key of the
username, and password as the data. A password can also be given for
the user like this:

    mysql:
      create-users:
        - username: dbuser2
          database: somedb
          password: abcdefg12345

If a userhandle is also given with the password, it will be passed to
the wait condition handle in the same manner.

Privileges may be restricted for the user like so:

    mysql:
      create-users:
        - username: dbuser2
          database: somedb
          password: abcdefg12345
          privilege: "USAGE, SELECT"
