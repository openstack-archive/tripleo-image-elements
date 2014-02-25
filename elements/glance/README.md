Installs glance service from git.

Configuration
-------------
glance:
    verbose: False
      - Show more verbose log output (sets INFO log level output)
    debug: False
      - Show debugging output in logs (sets DEBUG log level output)
    db: mysql://glance:unset@localhost/glance
      - SQLAlchemy database connection string
    backend: swift
      - The backend store to use
    service-password: password
      - The service password for the glance user
    swift-store-user: service:glance
    swift-store-key:  userpassword
      - The credentials to use against swift if using the swift backend.
    api-workers: 1
      - The number of Glance API server processes to start.
    notifier-strategy: noop
      - Strategy to use for notification queue.
    log-file: ''
      - The filepath of the file to use for logging messages from Glance’s servers.
      - The default is unset, which implies stdout.
