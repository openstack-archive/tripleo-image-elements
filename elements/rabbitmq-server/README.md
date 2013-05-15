Install RabbitMQ server package and optionally configure it using Heat
metadata.

Heat
----

We will create a random password and feed it to a Heat wait condition
if directed by Metadata. The relevant Metadata would look something like
this in Heat:

    Metadata:
      rabbit:
        users:
          - username: guest
          - tags: administrator
        password_handle: {Ref: RabbitMQPasswordHandle}

Using cfn-signal, we will feed back a generated password into the handle
for use by other resources.
