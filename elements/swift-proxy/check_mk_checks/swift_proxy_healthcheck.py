#!/usr/bin/python
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Check_mk script that checks if swift-proxy-server is responding to
# http requests.
#
# The healthcheck middleware in the swift-proxy-server pipeline normally
# responds to a GET /healthcheck with 200 status and "OK" in response body.
#
# Output is in the check_mk format:
#
#     status test_name perf_data output
#
# For example: (using - for perf_data)
#
#     0 swift_proxy_healthcheck - Connection Ok


import ConfigParser

import requests


def main():

    # Read port value from conf file
    conf_parser = ConfigParser.ConfigParser()
    conf_parser.read("/etc/swift/proxy-server.conf")
    config = dict(conf_parser.items("DEFAULT"))
    port = config.get("bind_port", "8080")
    ip = config.get("bind_ip", "localhost")

    status = 2  # Assume error
    try:
        url = "http://" + ip + ":" + port + "/healthcheck"
        resp = requests.get(url, timeout=5.0)
        if resp.status_code == 200 and resp.text == "OK":
            msg = "Ok"
            status = 0  # Good status
        elif resp.status_code == 503 and "DISABLED" in resp.text:
            msg = "disabled by file"
            status = 1  # Warning status
        else:
            msg = "unexpected response (status: {0}".format(resp.status_code)
    except requests.exceptions.Timeout:
        msg = "timeout ({0}:{1})".format(ip, port)
    except requests.exceptions.ConnectionError:
        msg = "connection error ({0}:{1})".format(ip, port)
    except Exception as error:
        msg = "{0} ({1}:{2})".format(str(error), ip, port)
    print("{0} swift_proxy_healthcheck - {1}".format(status, msg))


if __name__ == '__main__':
    main()
