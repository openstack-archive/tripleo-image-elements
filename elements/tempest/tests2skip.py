#!/usr/bin/env python
#
# Copyright 2013 Red Hat
# All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

# Reads in a list of exclude regular expressions from a file and outputs a
# regex suitable to be passed into testr

import sys

"""
Whitelist is applied first. The blacklist is executed against the set of
tests returned by the whitelist.
If whitelist is empty, all available tests are fed to blacklist.
If blacklist is empty, all tests from whitelist are returned.

The syntax for white-list and black-list is as follows:
- lines starting with # or empty are ignored
- lines starting with "+" are whitelisted
- lines starting with "-" are blacklisted
- lines not matching any of the above conditions are blacklisted

The match for each line gets added a "^" in the beginning,
so the regular expression should account for that.

For example, the following scenario:

    run all the smoke tests and scenario tests,
    but exclude the api.volume tests.

is implemented as:

    +.*smoke
    +tempest\.scenario
    -tempest\.api\.volume.*
"""

whitelist = []
blacklist = []
with open(sys.argv[1]) as fp:
    for line in fp:
        line = line.strip()
        if not line or line[0] == '#':
            continue
        if line.startswith("+"):
            whitelist.append(line[1:])
        elif line.startswith("-"):
            blacklist.append(line[1:])
        else:
            blacklist.append(line)

regex = '^(?=({whitelist}))'
params = dict(whitelist="|".join(whitelist))
if blacklist:
    regex += '(?!({blacklist}))'
    params['blacklist'] = "|".join(blacklist)

print(regex.format(**params))
