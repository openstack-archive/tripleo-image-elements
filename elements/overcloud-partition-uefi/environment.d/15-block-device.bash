#
# Arch gate
#

if [[ "ppc64 ppc64le ppc64el" =~ "$ARCH" ]]; then
    echo "overcloud-partition-uefi is not supported on Power"
    exit 1
fi

export DIB_BLOCK_DEVICE=efi
