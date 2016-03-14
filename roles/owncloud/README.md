marklee77.owncloud
==================

The purpose of this role is to install owncloud to a web server and enable
access with nginx. This install uses the MySQL backend. The owncloud server name
can be specified by changing the owncloud_hostname variable in
defaults/main.yml.

Role Variables
--------------

- owncloud_hostname: hostname that owncloud will service, will be set to 
                       "owncloud" by default
- owncloud_port: hostname that owncloud will service, will be set to 8080 by 
               default.
- owncloud_root_mysql_password: root mysql password, will be set to a random 
                                value by default.
- owncloud_owncloud_mysql_password: owncloud mysql password, will be set to a 
                                    random value by default.
* owncloud_admin_login: owncloud admin login name, 'root' by default.
- owncloud_admin_password: owncloud admin password, 'password' by default.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables 
passed in as parameters) is always nice for users too:

    - hosts: default
      sudo: True
      roles:
        - owncloud

Try it Out
----------

Check out the github repository, vagrant up, and load http://localhost:8080 in
your web browser.

NOTE: the first time you may see an error about webdav not being setup
correctly. This actually has to do with SSL not being setup by default. I'm
working on it. Clear the browser location bar and then try again.

License
-------

GPLv2

Author Information
------------------

http://stillwell.me

