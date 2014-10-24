Install and configure Glance.

Configuration
-------------

    glance:
        db: mysql://glance:unset@localhost/glance
          - SQLAlchemy database connection string
        service-password: password
          - The service password for the glance user
        api:
            verbose: False
              - Show more verbose log output (sets INFO log level output)
            debug: False
              - Show debugging output in logs (sets DEBUG log level output)
            backend: swift
              - The backend store to use
            swift-store-user: service:glance
            swift-store-key:  userpassword
              - The credentials to use against swift if using the swift backend.
            workers: 1
              - The number of Glance API server processes to start.
            notifier-strategy: noop
              - Strategy to use for notification queue.
            log-file: ''
              - The path of the file to use for logging messages from Glance’s API server.
              - The default is unset, which implies stdout.
            default-log-levels:
              - Logging: fine tune default log levels
        registry:
            verbose: False
              - Show more verbose log output (sets INFO log level output)
            debug: False
              - Show debugging output in logs (sets DEBUG log level output)
            log-file: ''
              - The path of the file to use for logging messages from Glance’s Registry server.
              - The default is unset, which implies stdout.
            default-log-levels:
              - Logging: fine tune default log levels
