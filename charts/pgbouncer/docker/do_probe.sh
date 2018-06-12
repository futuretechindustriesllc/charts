#!/bin/bash
set -e
export PGUSER="$(cat /pgbouncer-probes/probes_username)" PGPASSWORD="$(cat /pgbouncer-probes/probes_password)" PGHOST=127.0.0.1 PGPORT=6432 PGDATABASE="$(cat /pgbouncer-probes/probes_database)"
# The ; in the following here document isn't a typo: it makes us forgiving as to whether or not the chart this image is for must specify it.
exec psql <<HERE
\set ON_ERROR_STOP on
$(cat /pgbouncer-probes/probes_query)
;
HERE
