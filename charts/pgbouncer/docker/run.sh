#!/bin/bash
password_checksummed=$(echo -n "$PG_PASS$PG_USER" | md5sum)
password_checksummed=${password_checksummed:0:32}
cat <<EOF > /pgbouncer/users.txt
"$PG_USER" "md5$password_checksummed"
EOF

cat << EOF > /pgbouncer/pgbouncer.config
[databases]
*=host=$PG_ADDR port=$PG_PORT user=$PG_USER password=$PG_PASS

[pgbouncer]
$(for i in $(find /pgbouncer-config/*);do echo "$(basename $i)=$(cat $i)";done)
EOF

echo "PgBouncer configuration file:"
cat /pgbouncer/pgbouncer.config
exec pgbouncer /pgbouncer/pgbouncer.config
