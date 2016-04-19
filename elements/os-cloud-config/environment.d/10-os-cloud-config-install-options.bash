#!/bin/bash

if [ -z "${OS_CLOUD_CONFIG_VENV_DIR:-}" ]; then
    export OS_CLOUD_CONFIG_VENV_DIR="${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/os-cloud-config"}"
fi
