if [ -z "${SWIFT_VENV_DIR:-}" ]; then
    export SWIFT_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/swift"}
fi
