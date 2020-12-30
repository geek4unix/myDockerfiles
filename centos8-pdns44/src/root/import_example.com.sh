#!/bin/bash
zone2sql --gsqlite --zone=/etc/pdns/example.com.db | sqlite3 /sqlite/db.sqlite
