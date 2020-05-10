# ansible-role-chrony

[![Build Status](https://travis-ci.org/linuxhq/ansible-role-chrony.svg?branch=master)](https://travis-ci.org/linuxhq/ansible-role-chrony)
[![Ansible Galaxy](https://img.shields.io/badge/ansible--galaxy-chrony-blue.svg?style=flat)](https://galaxy.ansible.com/linuxhq/chrony)
[![License](https://img.shields.io/badge/license-GPLv3-brightgreen.svg?style=flat)](COPYING)

RHEL/CentOS - Network Time Protocol daemon (chrony)

## Requirements

None

## Role Variables

Available variables are listed below, along with default values:

    chrony_commands:
      driftfile: /var/lib/chrony/drift
      logdir: /var/log/chrony
      makestep: '1.0 3'
      rtcsync: true
      server:
        - 0.centos.pool.ntp.org iburst
        - 1.centos.pool.ntp.org iburst
        - 2.centos.pool.ntp.org iburst
        - 3.centos.pool.ntp.org iburst
    chrony_sysconfig: ''

## Dependencies

None

## Example Playbook

    - hosts: servers
      roles:
        - role: linuxhq.chrony
          chrony_commands:
            allow:
              - 10.0.0.0/8
              - 172.16.0.0/12
              - 192.168.0.0/16
            hwtimestamp: '*'
            keyfile: /etc/chrony.keys
            log: 'measurements statistics tracking'
            driftfile: /var/lib/chrony/drift
            logdir: /var/log/chrony
            makestep: '1.0 3'
            minsources: 2
            rtcsync: True
            server:
              - 0.centos.pool.ntp.org iburst
              - 1.centos.pool.ntp.org iburst
              - 2.centos.pool.ntp.org iburst
              - 3.centos.pool.ntp.org iburst
          chrony_sysconfig: '-F 1'

## License

Copyright (C) 2018 Taylor Kimball <tkimball@linuxhq.org>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
