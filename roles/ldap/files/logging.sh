#!/bin/bash
touch /var/log/ldap.log
chown ldap:ldap /var/log/ldap.log
echo "local4.* /var/log/ldap.log" >> /etc/rsyslog.conf
touch /etc/openldap/scripts/logging_enabled