# Install the check\_mk monitoring client from the distribution's repositories

[check_mk](http://mathias-kettner.com/check_mk.html)

This element installs the client, distributes any checks found in other elements
and configures IPTables to allow traffic to it.

If you wish to configure the server, please include the `check_mk-server` element on your
icinga server.

## Adding custom checks

If you wish to add a custom check to `check_mk`, simply carry out the following steps:

1. Add a dependency on this element to your "element-deps" file
2. Write a script that conforms to the output required (see example below for details)
3. Place that script into the "`check_mk_checks`" directory within your element
4. Deploy the element

The check will be picked up and deployed during the image build.

### Example Check

The output from a `check_mk` check is very simple:

    <status_code> <check_name> <performance_data || - > <check_message>

For example, if we wanted to check that a webserver was returning a response and how
long that response took, we would look for the following output for a "good" check:

    0 website_is_up response_time=0.007 Website is up (response code was 200)

or alternatively the following for a bad check:

    2 website_is_up response_time=0.002 Website is down (response code was 500)

A small bash script to achieve this is set out below.

    #!/bin/bash
    curlout=$(curl --write-out "%{http_code} %{time_total}" --silent --output /dev/null http://www.example.com/)
    response=$(echo $curlout|cut -d " " -f 1)
    timing=$(echo $curlout|cut -d " " -f 2)
    if [ "$response" -eq "200" ]; then
      retstring="0 nova_api reponse_time=$timing nova_api is up (response code was $response)"
    else
      retstring="2 nova_api response_time=$timing nova_api is down (response code was $response)"
    fi
    echo $retstringo

If you do not have any perfdata to display, just write a dash in the correct field as follows:

   `0 website_is_up - Website is up (response code was 200)`
