#!/bin/bash
CNF_PATH=/etc/mysql/conf.d/mariadb.cnf
CNF_ENV=(INDEX DB_MAX_CONNECTIONS DB_JOIN_BUFFER_SIZE MY_ISAM_SORT_BUFFER_SIZE)
export INNODB_BUFFER_POOL_SIZE=$((`awk 'BEGIN { x = '$FACT_INNODB_BUFF'; y = '$RAM_INNODB_MB'; print ((x * y)/128) }' | sed 's/\..*//'` * 134217728))
export DB_KEY_BUFFER_SIZE=$((`awk 'BEGIN { x = '$FACT_KEY_BUFF'; y = '$RAM_INNODB_MB'; print ((x * y)/128) }' | sed 's/\..*//'` * 134217728))
INTERP_ENV=(INNODB_BUFFER_POOL_SIZE DB_KEY_BUFFER_SIZE)
for i in "${!INTERP_ENV[@]}"; do
    CNF_ENV+=(${INTERP_ENV[$i]})
    echo "export ${INTERP_ENV[$i]}=${!INTERP_ENV[$i]}" >> ~/.bashrc
done
echo "export CNF_ENV=(${CNF_ENV[@]})" >> ~/.bashrc
cp /mariadb.cnf /mariadb.parsed.cnf
for i in "${!CNF_ENV[@]}"; do
    sed -i 's/£'${CNF_ENV[$i]}'£/'${!CNF_ENV[$i]}'/g' /mariadb.parsed.cnf
done
mv /mariadb.parsed.cnf $CNF_PATH
docker-entrypoint.sh mariadbd --verbose