#!/bin/bash

touch /etc/openldap/ldifs/syncprov_mod.ldif
cat > /etc/openldap/ldifs/syncprov_mod.ldif <<EOF
dn: cn=module,cn=config
objectClass: olcModuleList
cn: module
olcModulePath: /usr/lib64/openldap
olcModuleLoad: syncprov.la
EOF

touch /etc/openldap/ldifs/sycnprov.ldif
cat > /etc/openldap/ldifs/syncprov.ldif <<EOF
dn: olcOverlay=syncprov,olcDatabase={2}hdb,cn=config
objectClass: olcOverlayConfig
objectClass: olcSyncProvConfig
olcOverlay: syncprov
olcSpSessionLog: 100
EOF

ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/ldifs/syncprov_mod.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/ldifs/ldifs/syncprov.ldif

touch /etc/openldap/ldifs/sync_overlay_complete