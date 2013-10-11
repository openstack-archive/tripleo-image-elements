# Continually deploy an overcloud.

## Configuration

None needed.

## Caveats

Currently, continually deploying an overcloud results in the overcloud being
discarded each deploy.

## Operation

The service tripleo-cd runs tripleo-cd which loops deploying and redeploying an
overcloud.

## Configuration

There is currently no configuration available: changes are made to
tripleo-cd.sh directly.
