Image building rules for Openstack images
=========================================

These elements are used to build disk images for deploying Openstack via Heat.
They are built as part of the TripleO (https://github.com/tripleo/incubator)
umbrella project.

Instructions
------------

Checkout this source tree and also the diskimage builder
(https://github.com/stackforge/diskimage-builder), export an ELEMENTS\_PATH
to add elements from this tree, and build any disk images you need.

	git clone https://github.com/stackforge/diskimage-builder.git
	git clone https://github.com/stackforge/tripleo-image-elements.git
	export ELEMENTS_PATH=tripleo-image-elements/elements
	diskimage-builder/bin/disk-image-create -u base vm bootstrap local-config stackuser heat-cfntools -a i386 -o bootstrap

Common element combinations
---------------------------

Always include heat-cfntools in images that you intend to boot via heat : if
that is not done, then the user ssh keys are not reliably pulled down from the
metadata server due to interactions with cloud-init.

To be written.

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
