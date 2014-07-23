# Continually deploy an overcloud.

## Configuration

See configs/ for per-cloud configuration. The \_network.json files there
describe the deployment layer configuration for a cloud. The \_env.json
files are heat environment files for a cloud.

## Caveats

Currently, continually deploying an overcloud results in the overcloud being
discarded each deploy.

## Operation

The service tripleo-cd runs tripleo-cd which loops deploying and redeploying an
overcloud.

## Configuration

There is currently no configuration available: changes are made to
tripleo-cd.sh directly.

## Generating testenvs
To generate a testenv heat stack the deploy-testenv script can be used along with
the a config file describing the testenv you want to generate. We currently hold
config files for the HP and Red Hat racks along with a test config file that can
be used to deploy a testenv on a devtest undercloud, e.g. to generate a single host
testenv on your devtest undercloud (this may not allow you to run ci tests but will
at the very least allow you to test the environment is setup correctly), it requires
that you have unused barmetal nodes registered on your undercloud.

    . undercloudrc
    ./bin/deploy-testenv configs/te\_localrc
