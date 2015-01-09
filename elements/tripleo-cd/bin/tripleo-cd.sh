#!/bin/bash
#
# Copyright 2013 Hewlett-Packard Development Company, L.P.
# All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

set -eux

# To use this, create /opt/stack/testenv.json matching the region it is running
# in. While we only CD the overcloud, only overcloud related keys are needed
# - e.g. {"arch": "amd64"}

function cleanup(){
    rm -f $THROTTLELOCK
}

export OVERCLOUD_DIB_EXTRA_ARGS="pypi"
export DIB_COMMON_ELEMENTS="pypi stackuser"
export DIB_DISTRIBUTION_MIRROR=http://10.10.16.169/ubuntu
export PYPI_MIRROR_URL=http://10.10.16.169/pypi/simple
THROTTLELOCK=$(mktemp /tmp/tripleo-cd-throttle-XXXXXX.lock)
trap cleanup EXIT
while true; do
    flock -x $THROTTLELOCK sleep 600 &
    source /opt/stack/tripleo-incubator/scripts/refresh-env /opt/stack
    source /opt/stack/tripleo-incubator/scripts/devtest_variables.sh
    source /root/stackrc
    set +e
    OVERCLOUD_LIBVIRT_TYPE="kvm" \
        devtest_overcloud.sh vlan25 138.35.77.4/25 eth2 138.35.77.1 138.35.77.131 \
        138.35.77.254 138.35.77.128/25 \
        $TRIPLEO_ROOT/tripleo-incubator/tripleo-cloud/tripleo-cd-admins \
        $TRIPLEO_ROOT/tripleo-incubator/tripleo-cloud/tripleo-cd-users
    RESULT=$?
    # If possible list heat events
    heat event-list overcloud || :
    # List relationship between hardware nodes and instance ids.
    set +x
    for i in $(nova baremetal-node-list | awk '/^\| / {if ($2 != "ID") {print $2}}') ; do
        instance_id=$(nova baremetal-node-show $i | awk '/instance_uuid/ {print $4}')
        echo "$i,$instance_id"
    done
    nova list
    set -e
    MSG=$(echo "************** overcloud complete status=$RESULT ************")
    echo "$MSG"
    set -x
    send-irc tripleo cd-undercloud "$MSG"
    flock -x $THROTTLELOCK echo
    if [ "0" != "$RESULT" ]; then
        exit $RESULT
    fi
done
