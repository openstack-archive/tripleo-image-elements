# Copyright 2014 Red Hat, Inc.
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

import os
import subprocess
import tempfile

from oslotest import base


class ScriptTestBase(base.BaseTestCase):
    def setUp(self):
        super(ScriptTestBase, self).setUp()
        self.tmpdir = tempfile.mkdtemp()
        self.env = os.environ.copy()
        self.env['PATH'] = self.tmpdir + ':' + self.env['PATH']

    def _stub_script(self, name, contents):
        filename = os.path.join(self.tmpdir, name)
        with open(filename, 'w') as f:
            f.write('#!/bin/bash\n')
            f.write(contents)
            f.write('\n')
        os.chmod(filename, 0o700)

    def _run_command(self, cmd):
        try:
            return subprocess.check_output(cmd,
                                           stderr=subprocess.STDOUT,
                                           env=self.env).decode('utf-8')
        # NOTE(bnemec): If we don't handle this exception, all we get is the
        # exit code if the command fails.
        except subprocess.CalledProcessError as e:
            self.fail(e.output)
