#
# Arch gate
#

if [[ "arm64 aarch64" =~ $ARCH ]]; then
    echo "overcloud-partition is not supported on AARCH64"
    exit 1
fi

export DIB_BLOCK_DEVICE=mbr
