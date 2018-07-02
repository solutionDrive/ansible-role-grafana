solutiondrive.grafana
=====================

Installs Grafana with given Options/Dashboards/Datasources/Users/Organisations and Roles

Requirements
------------

none

Role Variables
--------------

### Config Variables

    grafana_version: 4.6.3
    grafana_users: []
    grafana_organisations: []
    grafana_roles: []
    grafana_setup_protocol: "http"
    grafana_setup_host: "127.0.0.1"
    grafana_setup_port: 3000

    grafana_plugins:
      - grafana-piechart-panel

    # Possible grafana ini configuration see http://docs.grafana.org/installation/configuration/
    grafana_config_alerting:
      enabled: ""
      execute_alerts: ""

    grafana_config_external_image_storage:
      provider: ""

    grafana_config_external_image_storage_s3:
      bucket: ""
      region: ""
      path: ""
      bucket_url: ""
      access_key: ""
      secret_key: ""

    grafana_config_external_image_storage_webdav:
      url: ""
      public_url: ""
      username: ""
      password: ""

    grafana_config_external_image_storage_gcs:
      key_file: ""
      bucket name: ""
      path: ""

    grafana_config_snapshots:
      external_enabled: ""
      external_snapshot_url: ""
      external_snapshot_name: ""
      remove expired snapshot: ""
      remove snapshots after 90 days: ""

    grafana_config_metrics:
      enabled: ""
      interval_seconds: ""

    grafana_config_metrics_graphite:
      address: ""
      prefix: ""

    grafana_config_log:
      mode: ""
      level: ""
      filters: ""

    grafana_config_smtp:
      enabled: ""
      host: ""
      user: ""
      password: ""
      cert_file: ""
      key_file: ""
      skip_verify: ""
      from_address: ""
      from_name: ""
      ehlo_identity: ""

    grafana_config_session:
      provider: ""
      provider_config: ""
      cookie_name: ""
      cookie_secure: ""
      session_life_time: ""

    grafana_config_analytics:
      reporting_enabled: ""
      google_analytics_ua_id: ""

    grafana_config_dashboards_json:
      enabled: ""
      path: ""

    grafana_config_auth:
      disable_login_form: ""
      disable_signout_menu: ""

    grafana_config_auth_anonymous:
      enabled: ""
      org_name: ""
      org_role: ""

    grafana_config_auth_github:
      enabled: ""
      allow_sign_up: ""
      client_id: ""
      client_secret: ""
      scopes: ""
      auth_url: ""
      token_url: ""
      api_url: ""
      team_ids: ""
      allowed_organizations: ""

    grafana_config_auth_google:
      enabled: ""
      client_id: ""
      client_secret: ""
      scopes: ""
      auth_url: ""
      token_url: ""
      allowed_domains: ""
      allow_sign_up: ""

    grafana_config_auth_generic_oauth:
      enabled: ""
      name: ""
      allow_sign_up: ""
      client_id: ""
      client_secret: ""
      scopes: ""
      auth_url: ""
      token_url: ""
      api_url: ""
      team_ids: ""
      allowed_organizations: ""

    grafana_config_auth_basic:
      enabled: ""

    grafana_config_auth_ldap:
      enabled: ""
      config_file: ""
      allow_sign_up: ""

    grafana_config_auth_proxy:
      enabled: ""
      header_name: ""
      auto_sign_up: ""
      whitelist: ""

    grafana_config_users:
      allow_sign_up: ""
      allow_org_create: ""
      auto_assign_org: ""
      auto_assign_org_role: ""
      viewers can edit: ""

    grafana_config_security:
      admin_user: ""
      admin_password: ""
      login_remember_days: ""
      secret_key: ""
      disable_gravatar: ""
      data_source_proxy_whitelist: ""

    grafana_config_server:
      http_addr: ""
      http_port: ""
      protocol: ""
      domain: ""
      enforce_domain: ""
      root_url: ""
      static_root_path: ""
      cert_file: ""
      cert_key: ""
      router_logging: ""

    grafana_config_database:
      url: ""
      type: ""
      path: ""
      host: ""
      name: ""
      user: ""
      password: ""
      ssl_mode: ""
      ca_cert_path: ""
      client_key_path: ""
      client_cert_path: ""
      server_cert_name: ""
      max_idle_conn: ""
      max_open_conn: ""
      log_queries: ""

    grafana_config_paths:
      data: ""
      logs: ""
      plugins: ""


### Roles, Organizations and Users

    # it is highly recommended to protect credentials with ansible-vault or other tools
    grafana_users:
      - username: "user1"
        password: "password1"      
      - username: "user2"
        password: "password2"      
      - username: "user3"
        password: "password3"

    grafana_organisations:
      - name: "organisation1"
      - name: "organisation2"

    grafana_roles:
      - username: "user1"
        organisation: "organisation1"
        role: "Admin"
        standard: true
      - username: "user3"
        organisation: "organisation1"
        role: "Viewer"
        standard: true
      - username: "user2"
        organisation: "organisation2"
        role: "Viewer"
        standard: true

Dependencies
------------

none

Example Playbook
----------------

Just including, so easy...

    - hosts: servers
      roles:
         - solutiondrive.grafana

License
-------

MIT

Files
-----

Dashboards and Datasources need to be in your files folder in your playbook like:

    testplaybook/
        files/
            dashboards/
                dashboard1.json
                dashboard2.json
            datasources/
                datasource1.json
                datasource2.json

  !!Important!!
  -------------
  Dashboard jsons have to have a slightly different format than what you export from grafana:
  1. The whole dashboard part has to be surrounded with a Dashboard object.
  2. Give an "orgId" property to the root of the json file to specify the Organisation it should be in, if not it is visible for everyone. The Ids are given By the Order you wrote in the config starting by 2 (i know its dirty but i have to wait for grafana v5)

Author Information
------------------

Julius Noack <noack@solutiondrive.de>
