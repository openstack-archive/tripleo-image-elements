#!/bin/bash
set -ue

# ceilometerclient
if [ -z "${CEILOMETERCLIENT_VENV_DIR:-}" ]; then
    export CEILOMETERCLIENT_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/python-ceilometerclient"}
fi
if [ -z "${CEILOMETERCLIENT_EXTRA_INSTALL_OPTS:-}" ]; then
    export CEILOMETERCLIENT_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi

# cinderclient
if [ -z "${CINDERCLIENT_VENV_DIR:-}" ]; then
    export CINDERCLIENT_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/python-cinderclient"}
fi
if [ -z "${CINDERCLIENT_EXTRA_INSTALL_OPTS:-}" ]; then
    export CINDERCLIENT_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi

# glanceclient
if [ -z "${GLANCECLIENT_VENV_DIR:-}" ]; then
    export GLANCECLIENT_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/python-glanceclient"}
fi
if [ -z "${GLANCECLIENT_EXTRA_INSTALL_OPTS:-}" ]; then
    export GLANCECLIENT_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi

# heatclient
if [ -z "${HEATCLIENT_VENV_DIR:-}" ]; then
    export HEATCLIENT_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/python-heatclient"}
fi
if [ -z "${HEATCLIENT_EXTRA_INSTALL_OPTS:-}" ]; then
    export HEATCLIENT_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi

# ironicclient
if [ -z "${IRONICCLIENT_VENV_DIR:-}" ]; then
    export IRONICCLIENT_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/python-ironicclient"}
fi
if [ -z "${IRONICCLIENT_EXTRA_INSTALL_OPTS:-}" ]; then
    export IRONICCLIENT_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi

# neutronclient
if [ -z "${NEUTRONCLIENT_VENV_DIR:-}" ]; then
    export NEUTRONCLIENT_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/python-neutronclient"}
fi
if [ -z "${NEUTRONCLIENT_EXTRA_INSTALL_OPTS:-}" ]; then
    export NEUTRONCLIENT_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi

# novaclient
if [ -z "${NOVACLIENT_VENV_DIR:-}" ]; then
    export NOVACLIENT_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/python-novaclient"}
fi
if [ -z "${NOVACLIENT_EXTRA_INSTALL_OPTS:-}" ]; then
    export NOVACLIENT_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi

# swiftclient
if [ -z "${SWIFTCLIENT_VENV_DIR:-}" ]; then
    export SWIFTCLIENT_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/python-swiftclient"}
fi
if [ -z "${SWIFTCLIENT_EXTRA_INSTALL_OPTS:-}" ]; then
    export SWIFTCLIENT_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi

# tuskarclient
if [ -z "${TUSKARCLIENT_VENV_DIR:-}" ]; then
    export TUSKARCLIENT_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/python-tuskarclient"}
fi
if [ -z "${TUSKARCLIENT_EXTRA_INSTALL_OPTS:-}" ]; then
    export TUSKARCLIENT_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi

# openstackclient
if [ -z "${OPENSTACKCLIENT_VENV_DIR:-}" ]; then
    export OPENSTACKCLIENT_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/python-openstackclient"}
fi
if [ -z "${OPENSTACKCLIENT_EXTRA_INSTALL_OPTS:-}" ]; then
    export OPENSTACKCLIENT_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi
