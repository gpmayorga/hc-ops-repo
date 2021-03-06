# Ansible Role: nextcloud

An Ansible role that installs nextcloud on Fedora using nginx.

## Requirements

For this role `nginx` and `php` have to be installed beforehand. To achieve this the following roles can be used:
- mjanser.nginx
- mjanser.php

## Role Variables

Available variables are listed below, along with default values:

    nextcloud_server_name: example.com

    nextcloud_admin_username: admin
    nextcloud_admin_password: secret

    nextcloud_config_user_backend: ~ # imap, smb, ftp
    nextcloud_config_user_backend_argument: ~

    nextcloud_config_trusted_domains: ["localhost", "example.com"]
    nextcloud_config_cli_url: "https://example.com"
    nextcloud_config_mail_domain: "example.com"
    nextcloud_config_defaultapp: ~
    nextcloud_config_filesystem_check: 1
    nextcloud_config_loglevel: 2

    nextcloud_apps: []
    #  - name: news
    #  - enabled: true

    nextcloud_version: 9.0.0beta2
    nextcloud_release_channel: testing

    nextcloud_data_directory: /var/lib/nextcloud/data

    #nextcloud_ssl_certificate: "/etc/pki/tls/certs/{{ nextcloud_server_name }}.crt"
    #nextcloud_ssl_certificate_key: "/etc/pki/tls/private/{{ nextcloud_server_name }}.key"

    nextcloud_database_server: mysql # mysql, sqlite, manual
    nextcloud_database_name: nextcloud
    nextcloud_database_username: nextcloud
    nextcloud_database_password: secret

    nextcloud_restore_database: ~
    nextcloud_restore_config: ~

## Dependencies

None

## Example Playbook

    - hosts: all
      roles:
        - { role: mjanser.nextcloud }
      vars:
        nextcloud_ssl_certificate_key: "/etc/pki/tls/certs/example.com.crt"
        nextcloud_config_defaultapp: "gallery,files"
        nextcloud_config_trusted_domains: ["localhost", "example.com"]
        nextcloud_apps:
          - name: files_external

## License

MIT

## TDOD
- test mysql import
