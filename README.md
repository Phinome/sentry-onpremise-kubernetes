# sentry-onpremise-kubernetes
Sentry v21+ On-Premise running in a Kubernetes Cluster.

Features:
Scalable job/services via replicas;
Embedded TLS termination (https);
Geoip database auto update;
Bootstrap jobs;
External Postgresql Service;
Full sentry configuration (config.yml, sentry.conf.py and Env vars);

Kubernetes Cluster Requirements:
-dns
-storage
-ingress
-Cert-Manager (https://cert-manager.io/docs/)

To start, just review each configuration first so you can kubectl apply:
-/sentry.namespace.yml
-/configurations;
-/volumes;
-/services/(non-sentry: clickhouse, kafka, zookeeper, postgresql, redis);
-/jobs/bootstrap;
-/services/(sentry ones: sentry-web, sentry-relay, sentry-snuba-api);
-/jobs
-/ingress

Services:
clickhouse.service.yml
cp-kafka.service.yml
cp-zookeeper.service.yml
postgresql.service.yml
redis.service.yml
sentry-relay.service.yml
sentry-snuba-api.service.yml
sentry-web.service.yml

Jobs:
geoip.job.yml
sentry-cleanup.job.yml
sentry-cron.job.yml
sentry-messaging.job.yml
sentry-snuba-cleanup.job.yml
sentry-snuba-messaging.job.yml
sentry-worker.job.yml


