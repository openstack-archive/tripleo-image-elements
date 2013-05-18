Set up a MySQL server install in the image.

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
and grant it all privileges on somedb. It will have a random password
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
