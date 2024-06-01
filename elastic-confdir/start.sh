#!/bin/bash
echo ciao
if [ ! -f /usr/share/elasticsearch/data/index-ready ]; then
    if [[ $ELASTIC_PASSWORD_FILE != "" ]]; then
        startPass=$(cat $ELASTIC_PASSWORD_FILE)
    else
        startPass=$ELASTIC_PASSWORD
    fi
    echo ciao
    startUrl="http://localhost:9200"
    if [[ $startPass != "" ]]; then
        startUrl="http://elastic:$startPass@localhost:9200"
    fi
    echo ciao
    (sleep 15 && \
    for fname in /usr/share/elasticsearch/config/indexes/*.json; do
        fname=${fname##*/}
        curl -XPUT $startUrl/${fname%%.json}  -H "Content-Type: application/json" -d @/usr/share/elasticsearch/config/indexes/$fname
    done && \
    touch /usr/share/elasticsearch/data/index-ready )&
    echo ciao
fi
echo ciao
/usr/local/bin/docker-entrypoint.sh eswrapper