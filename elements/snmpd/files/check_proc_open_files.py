#! /usr/bin/env python
# Copyright 2013 Hewlett-Packard Development Company, L.P.
# All Rights Reserved.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.

import itertools
import shlex
import subprocess
import sys

warn_limit = 90
crit_limit = 95
crit_msg = ''
warn_msg = ''
output_msg = ''
status = {'OK': 0, 'WARNING': 1, 'CRITICAL': 2, 'UNKNOWN': 3}


def _get_open_file_limits(file_handle):
    limit = 0
    for line in file_handle:
        if line.startswith('Max open files'):
            limit = line.split()[3]
    return limit


# Define an in-line generator, no temporary lists
def _split_lines(lines):
    for line in lines:
        yield line[0:19].strip().split()


def _get_lsof_pid_list():
    # get open files limit per PID exclude any line with a TID.
    lsof_cmd = shlex.split("sudo lsof -n")
    lsof_proc = subprocess.Popen(lsof_cmd, stdout=subprocess.PIPE)
    filtered_lines = itertools.ifilterfalse(lambda line: line[1] == 'PID',
                                            _split_lines(lsof_proc.stdout))
    filtered_by_len = itertools.ifilter(lambda line: len(line) == 2,
                                        filtered_lines)
    for cmd, pid in itertools.groupby(filtered_by_len, lambda line: line[:2]):
        yield cmd, pid


for (pid_cmd, pid_number), count in _get_lsof_pid_list():
    pid_count = len(list(count))
    pid_limit_file = "/proc/%s/limits" % pid_number
    try:
        with open(pid_limit_file, 'rb') as limit_file_handle:
            pid_limit = _get_open_file_limits(limit_file_handle)
    except IOError:
        # no limit file skip
        continue

    pid_usage_pct = pid_count * 100 / int(pid_limit)
    if pid_usage_pct >= crit_limit:
        crit_msg += ": %s/%s/%s %s" % (pid_number,
                                       pid_count,
                                       pid_limit,
                                       pid_cmd)
    elif pid_usage_pct >= warn_limit and pid_usage_pct < crit_limit:
        warn_msg += ": %s/%s/%s %s" % (pid_number,
                                       pid_count,
                                       pid_limit,
                                       pid_cmd)

# if any critical services then exit critical (include warnings)
if crit_msg:
    output_msg = "Critical: pid/files/limit Proc%s\n%s" % (crit_msg,
                                                           warn_msg)
    exit_code = status['CRITICAL']
# if not critical and warn not empty exit warning
if warn_msg:
    output_msg = "Warning: pid/files/limit Proc%s" % warn_msg
    exit_code = status['WARNING']
# All ok here
if not output_msg:
    output_msg = "OK - All processes open files with in limits."
    exit_code = status['OK']

print(output_msg)
sys.exit(exit_code)
