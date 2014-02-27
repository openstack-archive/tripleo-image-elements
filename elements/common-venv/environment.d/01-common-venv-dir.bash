export OPENSTACK_VENV_DIR="/opt/stack/venvs/openstack"

# Install Nova in its own venv since it uses
# --system-site-packages and it is probably best
# to keep that isolated for now
export NOVA_VENV_DIR="/opt/stack/venvs/nova"
