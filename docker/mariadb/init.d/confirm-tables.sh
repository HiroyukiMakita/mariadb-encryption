#!/usr/bin/env bash

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -D mysql -e "SELECT * FROM information_schema.INNODB_TABLESPACES_ENCRYPTION;"

sudo strings /var/lib/mysql/testdb/plain_table.ibd

sudo strings /var/lib/mysql/testdb/encryption_table.ibd