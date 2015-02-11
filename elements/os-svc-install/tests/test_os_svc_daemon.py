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

import tests.base


class TestOsSvcDaemon(tests.base.ScriptTestBase):
    def setUp(self):
        super(TestOsSvcDaemon, self).setUp()
        self._stub_script('map-services', 'echo $1')

    def test_standard_systemd(self):
        self._stub_script('dib-init-system', 'echo systemd')
        output = self._run_command(
            ['elements/os-svc-install/bin/os-svc-daemon',
             '-l',
             '-p',
             '-n', 'foo',
             '-u', 'bar',
             '-c', 'baz', 'arg',
             ])
        expected = """[Unit]
Description=foo Service
After=os-refresh-config.service
Requires=foo-create-dir.service

[Service]
ExecStart=/opt/stack/venvs/bar/bin/baz arg
User=bar


[Install]
WantedBy=multi-user.target
Alias=foo.service
[Unit]
Description=Create /var/run/bar

[Service]
ExecStartPre=/bin/mkdir -p /var/run/bar
ExecStartPre=/usr/local/bin/restore-selinux-file-context /var/run/bar
ExecStart=/bin/chown -R bar:bar /var/run/bar

[Install]
RequiredBy=foo.service
"""
        self.assertEqual(expected, output)

    def test_standard_upstart(self):
        self._stub_script('dib-init-system', 'echo upstart')
        output = self._run_command(
            ['elements/os-svc-install/bin/os-svc-daemon',
             '-l',
             '-p',
             '-n', 'foo',
             '-u', 'bar',
             '-c', 'baz', 'a',
             ])
        expected = """start on runlevel [2345]
stop on runlevel [016]


env OS_SVC_ENABLE_CONTROL=1
export OS_SVC_ENABLE_CONTROL

pre-start script
  mkdir -p /var/run/bar
  chown -R bar:bar /var/run/bar
end script

respawn
# the default post-start of 1 second sleep delays respawning enough to
# not hit the default of 10 times in 5 seconds. Make it 2 times in 10s.
respawn limit 2 10

exec start-stop-daemon --start -c bar --exec /opt/stack/venvs/bar/bin/baz -- a

post-start exec sleep 1
"""
        self.assertEqual(expected, output)

    def test_dir_only_systemd(self):
        self._stub_script('dib-init-system', 'echo systemd')
        output = self._run_command(
            ['elements/os-svc-install/bin/os-svc-daemon',
             '-l',
             '-p',
             '-n', 'foo',
             '-u', 'bar',
             ])
        expected = """[Unit]
Description=Create /var/run/bar

[Service]
ExecStartPre=/bin/mkdir -p /var/run/bar
ExecStartPre=/usr/local/bin/restore-selinux-file-context /var/run/bar
ExecStart=/bin/chown -R bar:bar /var/run/bar

[Install]
RequiredBy=foo.service
"""
        self.assertEqual(expected, output)

    def test_dir_only_upstart(self):
        self._stub_script('dib-init-system', 'echo upstart')
        output = self._run_command(
            ['elements/os-svc-install/bin/os-svc-daemon',
             '-l',
             '-p',
             '-n', 'foo',
             '-u', 'bar',
             ])
        expected = """start on runlevel [2345]
stop on runlevel [016]


env OS_SVC_ENABLE_CONTROL=1
export OS_SVC_ENABLE_CONTROL

pre-start script
  mkdir -p /var/run/bar
  chown -R bar:bar /var/run/bar
end script
"""
        self.assertEqual(expected, output)

    def test_install_dir_systemd(self):
        self._stub_script('dib-init-system', 'echo systemd')
        output = self._run_command(
            ['elements/os-svc-install/bin/os-svc-daemon',
             '-l',
             '-p',
             '-n', 'foo',
             '-u', 'foo',
             '-i', '/test/dir',
             '-c', 'foo', 'arg',
             ])
        self.assertIn('ExecStart=/test/dir/bin/foo arg', output)

    def test_install_dir_upstart(self):
        self._stub_script('dib-init-system', 'echo upstart')
        output = self._run_command(
            ['elements/os-svc-install/bin/os-svc-daemon',
             '-l',
             '-p',
             '-n', 'foo',
             '-u', 'foo',
             '-i', '/test/dir',
             '-c', 'foo', 'arg',
             ])
        self.assertIn('--exec /test/dir/bin/foo -- arg', output)

    def test_environment_systemd(self):
        self._stub_script('dib-init-system', 'echo systemd')
        output = self._run_command(
            ['elements/os-svc-install/bin/os-svc-daemon',
             '-p',
             '-n', 'foo',
             '-u', 'foo',
             '-e', '"foo=bar"',
             '-c', 'foo', 'arg',
             ])
        self.assertIn('Environment="foo=bar"', output)

    def test_environment_upstart(self):
        self._stub_script('dib-init-system', 'echo upstart')
        output = self._run_command(
            ['elements/os-svc-install/bin/os-svc-daemon',
             '-p',
             '-n', 'foo',
             '-u', 'foo',
             '-e', 'foo=bar',
             '-c', 'foo', 'arg',
             ])
        self.assertIn('env foo=bar', output)

    def test_post_start_upstart(self):
        self._stub_script('dib-init-system', 'echo upstart')
        output = self._run_command(
            ['elements/os-svc-install/bin/os-svc-daemon',
             '-l',
             '-p',
             '-n', 'foo',
             '-u', 'foo',
             '-s', 'bar',
             '-c', 'foo', 'arg',
             ])
        self.assertIn('post-start bar', output)

    def test_runtime_dir_systemd(self):
        self._stub_script('dib-init-system', 'echo systemd')
        output = self._run_command(
            ['elements/os-svc-install/bin/os-svc-daemon',
             '-p',
             '-n', 'foo',
             '-u', 'bar',
             '-d', 'baz',
             '-c', 'foo', 'arg',
             ])
        self.assertIn('ExecStartPre=/bin/mkdir -p /var/run/baz', output)
        self.assertIn('ExecStart=/bin/chown -R bar:bar /var/run/baz', output)

    def test_runtime_dir_upstart(self):
        self._stub_script('dib-init-system', 'echo upstart')
        output = self._run_command(
            ['elements/os-svc-install/bin/os-svc-daemon',
             '-p',
             '-n', 'foo',
             '-u', 'bar',
             '-d', 'baz',
             '-c', 'foo', 'arg',
             ])
        self.assertIn('mkdir -p /var/run/baz', output)
        self.assertIn('chown -R bar:bar /var/run/baz', output)
