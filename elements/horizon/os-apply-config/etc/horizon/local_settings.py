# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import os

from openstack_dashboard import exceptions

DEBUG = False
TEMPLATE_DEBUG = DEBUG
COMPRESS_OFFLINE = True

ROOT_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
STATIC_ROOT = '/var/www/horizon/static'

ALLOWED_HOSTS = ['*']

with open('/etc/horizon/.secret_key_store', 'r') as f:
    SECRET_KEY = f.read()

HORIZON_CONFIG = {
    'dashboards': ('project', 'admin', 'settings',),
    'default_dashboard': 'project',
    'user_home': 'openstack_dashboard.views.get_user_home',
    'ajax_queue_limit': 10,
    'auto_fade_alerts': {
        'delay': 3000,
        'fade_duration': 1500,
        'types': ['alert-success', 'alert-info']
    },
    'help_url': "http://docs.openstack.org",
    'exceptions': {'recoverable': exceptions.RECOVERABLE,
                   'not_found': exceptions.NOT_FOUND,
                   'unauthorized': exceptions.UNAUTHORIZED},
}


CACHES = {
    'default': {
        {{#horizon.caches.memcached}}
        'BACKEND': 'django.core.cache.backends.memcached.MemcachedCache',
        'LOCATION': [{{#nodes}}'{{.}}',{{/nodes}}]
        {{/horizon.caches.memcached}} # flake8: noqa
        {{^horizon.caches.memcached}}
        'BACKEND': 'django.core.cache.backends.locmem.LocMemCache'
        {{/horizon.caches.memcached}}
    }
}

{{#horizon.caches.memcached}}
SESSION_ENGINE = 'django.contrib.sessions.backends.cache'
{{/horizon.caches.memcached}}

# Send email to the console by default
EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

OPENSTACK_HOST = "{{keystone.host}}"
OPENSTACK_KEYSTONE_URL = "http://%s:5000/v2.0" % OPENSTACK_HOST
OPENSTACK_KEYSTONE_DEFAULT_ROLE = "_member_"

OPENSTACK_KEYSTONE_BACKEND = {
    'name': 'native',
    'can_edit_user': True,
    'can_edit_group': True,
    'can_edit_project': True,
    'can_edit_domain': True,
    'can_edit_role': True
}

OPENSTACK_HYPERVISOR_FEATURES = {
    'can_set_mount_point': True,

    # NOTE: as of Grizzly this is not yet supported in Nova so enabling this
    # setting will not do anything useful
    'can_encrypt_volumes': False
}


OPENSTACK_NEUTRON_NETWORK = {
    'enable_lb': False
}


API_RESULT_LIMIT = 1000
API_RESULT_PAGE_SIZE = 20

TIME_ZONE = "UTC"
