#!/bin/bash -x

envtpl /root/elastalert/config.yaml.tpl

ES_HOST=`grep es_host: /root/elastalert/config.yaml | awk '{print $2}'`
ES_PORT=`grep es_port: /root/elastalert/config.yaml | awk '{print $2}'`
WRITEBACK_INDEX=`grep writeback_index: /root/elastalert/config.yaml | awk '{print $2}'`

cd /root/elastalert
source virtualenvelastalert/bin/activate

# Check if the Elastalert index exists in Elasticsearch and create it if it does not.
if ! wget -O garbage_file ${ES_HOST}:${ES_PORT}/${WRITEBACK_INDEX} 2>/dev/null
then
	echo "Creating Elastalert index in Elasticsearch..."
    elastalert-create-index --index ${WRITEBACK_INDEX} --old-index ""
else
    echo "Elastalert index already exists in Elasticsearch."
fi
rm -f garbage_file

elastalert --start NOW --verbose --config /root/elastalert/config.yaml
