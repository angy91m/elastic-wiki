#!/bin/bash
if [ ! -f /usr/share/elasticsearch/data/index-ready ]; then
    if [[ $ELASTIC_PASSWORD_FILE != "" ]]; then
        startPass=$(cat $ELASTIC_PASSWORD_FILE)
    else
        startPass=$ELASTIC_PASSWORD
    fi
    startUrl="http://$HOSTNAME:9200"
    if [[ $startPass != "" ]]; then
        startUrl="http://elastic:$startPass@$HOSTNAME:9200"
    fi
    (sleep 120 && \
    for fname in /usr/share/elasticsearch/config/indexes/*.json; do
        fname=${fname##*/}
        curl -XPUT $startUrl/${fname%%.json}  -H "Content-Type: application/json" -d @/usr/share/elasticsearch/config/indexes/$fname
    done && \
    touch /usr/share/elasticsearch/data/index-ready )&
fi
/usr/local/bin/docker-entrypoint.sh eswrapper