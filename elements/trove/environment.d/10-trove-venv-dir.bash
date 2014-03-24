if [ -z "${TROVE_VENV_DIR:-}" ]; then
    export TROVE_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/trove"}
fi
if [ -z "${TROVE_EXTRA_INSTALL_OPTS:-}" ]; then
    # use -s to enable --system-site-packages in the virtualenv
    export TROVE_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-"-s"}
fi
