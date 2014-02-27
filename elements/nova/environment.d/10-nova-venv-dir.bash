if [ -z "${NOVA_VENV_DIR:-}" ]; then
    export NOVA_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/nova"}
fi
if [ -z "${NOVA_EXTRA_INSTALL_OPTS:-}" ]; then
    # use -s to enable --system-site-packages in the virtualenv
    export NOVA_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-"-s"}
fi
