# This is the folder that contains the rule yaml files
# Any .yaml file will be loaded as a rule
rules_folder: {{ RULES_DIR | default("/root/elastalert/rules/") }}

# How often ElastAlert will query elasticsearch
# The unit can be anything from weeks to seconds
run_every:
  seconds: {{ RUN_EVERY | default("60") }}

# ElastAlert will buffer results from the most recent
# period of time, in case some log sources are not in real time
buffer_time:
  minutes: {{ BUFFER_TIME | default("15") }}

# The elasticsearch hostname for metadata writeback
# Note that every rule can have its own elasticsearch host
es_host: {{ ES_HOST | default("localhost") }}

# The elasticsearch port
es_port: {{ ES_PORT | default("9200") }}

# Optional URL prefix for elasticsearch
es_url_prefix: {{ ES_URL_PREFIX | default("/") }}

# Connect with TLS to elasticsearch
use_ssl: {{ USE_SSL | default("False") }}

# Verify TLS certificates
verify_certs: {{ VERIFY_CERTS | default("True") }}

# GET request with body is the default option for Elasticsearch.
# If it fails for some reason, you can pass 'GET', 'POST' or 'source'.
# See http://elasticsearch-py.readthedocs.io/en/master/connection.html?highlight=send_get_body_as#transport
# for details
es_send_get_body_as: {{ ES_SEND_GET_BODY_AS | default("GET") }}

# Option basic-auth username and password for elasticsearch
#es_username: {{ ES_USERNAME | default("") }}
#es_password: {{ ES_PASSWORD | default("") }}

# The index on es_host which is used for metadata storage
# This can be a unmapped index, but it is recommended that you run
# elastalert-create-index to set a mapping
writeback_index: {{ WRITEBACK_INDEX | default("elastalert_stats") }}

# If an alert fails for some reason, ElastAlert will retry
# sending the alert until this time period has elapsed
alert_time_limit:
  days: {{ ALERT_TIME_LIMIT | default("2") }}

# By default Elastalert will not use a network proxy to send notifications to Slack.
# Set this option using hostname:port if you need to use a proxy.
slack_proxy: {{ SLACK_PROXY | default("") }}
