#!/usr/bin/env bash
mysql -u root -ppassword < "/docker-entrypoint-initdb.d/001-create-tables.sql"
