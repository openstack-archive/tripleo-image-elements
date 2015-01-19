#!/bin/bash

export DIB_INSTALLTYPE_os_cloud_config="${DIB_INSTALLTYPE_os_cloud_config:-"pip"}"

if [ -z "${OS_CLOUD_CONFIG_VENV_DIR:-}" ]; then
    export OS_CLOUD_CONFIG_VENV_DIR="${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/os-cloud-config"}"
fi
