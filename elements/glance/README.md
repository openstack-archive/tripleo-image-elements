Installs glance service from git.

Configuration
-------------
glance:
    backend: swift
      - The backend store to use
    service-password: password
      - The service password for the glance user
    swift-store-user: service:glance
    swift-store-key:  userpassword
      - The credentials to use against swift if using the swift backend.
