#!/usr/bin/env bash
mysql -u root -ppassword < "/docker-entrypoint-initdb.d/000-create-database.sql"
mysql -u root -ppassword keijiban_db < "/docker-entrypoint-initdb.d/001-create-tables.sql"
