========================
Team and repository tags
========================

.. image:: https://governance.openstack.org/tc/badges/tripleo-image-elements.svg
    :target: https://governance.openstack.org/tc/reference/tags/index.html

.. Change things from this point on

Image building rules for OpenStack images
=========================================

These elements are used to build disk images for deploying OpenStack via Heat.
They are built as part of the TripleO_ umbrella project.

.. _TripleO: https://wiki.openstack.org/wiki/TripleO

Instructions
------------

Checkout this source tree and also the diskimage builder, export an
ELEMENTS_PATH to add elements from this tree, and build any disk images you
need::

    virtualenv .
    source bin/activate
    pip install dib-utils pyyaml
    git clone https://git.openstack.org/openstack/diskimage-builder.git
    git clone https://git.openstack.org/openstack/tripleo-image-elements.git
    export ELEMENTS_PATH=tripleo-image-elements/elements
    diskimage-builder/bin/disk-image-create -u base vm bootstrap local-config stackuser heat-cfntools -a i386 -o bootstrap

Common element combinations
---------------------------

Always include heat-cfntools in images that you intend to boot via heat : if
that is not done, then the user ssh keys are not reliably pulled down from the
metadata server due to interactions with cloud-init.

Architecture
------------

OpenStack images are intended to be deployed and maintained using Nova + Heat.

As such they should strive to be stateless, maintained entirely via automation.

Configuration
-------------

In a running OpenStack there are several categories of config.

 - per user - e.g. ssh key registration with nova: we repeat this sort
   of config every time we add a user.
 - local node - e.g. nova.conf or ovs-vsctl add-br br-ex : settings that
   apply individually to machines
 - inter-node - e.g. credentials on rabbitmq for a given nova compute node
 - application state - e.g. 'neutron net-create ...' : settings that
   apply to the whole cluster not on a per-user / per-tenant basis

We have five places we can do configuration in TripleO:
 - image build time
 - in-instance heat-driven (ORC scripts)
 - from outside via APIs
 - orchestrated by Heat

Our current heuristic for deciding where to do any particular configuration
step:

 - per user config should be done from the outside via APIs, even for
   users like 'admin' that we know we'll have. Note that service accounts
   are different - they are a form of inter-node configuration.
 - local node configuration should be done via ORC driven by Heat and/or
   configuration management system metadata.
 - inter-node configuration should be done by working through Heat. For
   instance, creating a rabbit account for a nova compute node is something
   that Heat should arrange, though the act of creating is probably done by a
   script on the rabbit server - triggered by Heat - and applying the config is
   done on the compute node by the local node script - again triggered by Heat.
 - application state changes should be done from outside via APIs


Copyright
=========

Copyright 2012,2013 Hewlett-Packard Development Company, L.P.
Copyright (c) 2012 NTT DOCOMO, INC.

All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License"); you may
not use this file except in compliance with the License. You may obtain
a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
License for the specific language governing permissions and limitations
under the License.

Release notes for the project can be found at:
  https://docs.openstack.org/releasenotes/tripleo-image-elements
