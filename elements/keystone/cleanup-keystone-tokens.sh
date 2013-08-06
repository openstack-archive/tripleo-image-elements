#!/bin/sh
set -eu

KEYSTONE_DB=$(os-config-applier --key keystone.db --type dsn)

KEYSTONE_DB_TYPE=${KEYSTONE_DB%%://*}
if [ "$KEYSTONE_DB_TYPE" != "mysql" ] ; then
    # We can just call this directly if bug #1188378 is ever fixed
    exec /opt/stack/venvs/keystone/bin/keystone-manage token_flush
fi

KEYSTONE_DB_P1=${KEYSTONE_DB##mysql://}
KEYSTONE_DB_USERPASS=${KEYSTONE_DB_P1%%@*}
KEYSTONE_DB_USER=${KEYSTONE_DB_USERPASS%%:*}
KEYSTONE_DB_PASS=${KEYSTONE_DB_USERPASS##*:}
KEYSTONE_DB_P2=${KEYSTONE_DB_P1##*@}
KEYSTONE_DB_P2=${KEYSTONE_DB_P2%%\?*}
KEYSTONE_DB_HOST=${KEYSTONE_DB_P2%%/*}
KEYSTONE_DB_NAME=${KEYSTONE_DB_P2##*/}

pt-archiver --source h=$KEYSTONE_DB_HOST,u=$KEYSTONE_DB_USER,p=$KEYSTONE_DB_PASS,D=$KEYSTONE_DB_NAME,t=token \
    --charset utf8 \
    --where "expires < UTC_TIMESTAMP()" \
    --purge \
    --txn-size 500 \
    --run-time 59m \
    --statistics \
    --primary-key-only | logger -t cleanup-keystone-tokens
