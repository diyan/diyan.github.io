title: My background

<b>Official</b>

- Solutions architect at <a href="http://www.dev-pro.net/">Dev-Pro.net</a>
- 6 years of .NET, 5y Python, 1y NodeJS, 4mo Golang
- Expertise in building distributed, high load, HA architectures
- Automation junkie - unit/integration/e2e tests, environment, continuous delivery

<b>Non-official</b>

- ZX/Q Basic, C/C++, x386/FPU Assembly in past as hobby
- .NET / Windows has gone forever (hopefully)
- Like Python, Golang, (Arch) Linux, Systemd, Docker, Kubernetes
---

title: Plan

- Why Prometheus?
- New World of dynamic resources
- Host-oriented vs service-oriented monitoring
- Metrics vs checks
- Pull vs Push architecture
- Compare to Graphite, InfluxDB, OpenTSDB, KairosDB, Nagios, Sensu
- Prometheus components ...why so many deployment units?
- Prometheus Exporters in different languages
- Apps with native Prometheus support
- Scale out Prometheus, HA setup
- Prometheus external, long-term storage (briefly)
- Coming from AWS CloudWatch, Nagios, Zabbix, CollectD, Graphite, NewRelic?
---

title: Why Prometheus?

- Open-source, self-hosted, flexible
- Graphing + alerting + storage in single product
- Easy to deploy, simple HA
- Simple federation (avoid single, God-blessed instance)
- Powerful query language, good write performance
- Can monitor dynamic resources (via service discovery)
- Service-oriented, metrics-based monitoring
- Metrics-based alerting
- Good data model (metric name + set of key/value labels)
- Has "Recording rules" feature (like "Materialized View" in RDBMS)
- Has no downsampling =(
---

title: New World of dynamic resources

- Online/standby HA, multi-master clusters
- Automatic failover, shard rebalancing
- Clusters with leader election: read-write master, read-only slaves
- Auto-scaling of VMs, Containers
- FaaS: AWS Lambda, Google Cloud Functions, Azure Functions, etc
- Microservice architecture
- Transient jobs: ad-hoc, scheduled, reactive (triggered)
- "The Free Lunch Is Over" for devs; tens and hundreds of hosts for ops
- ...
- Old folks neeeds to catch up: Zabbix / 1998, Nagios / 1999
---

title: Host-oriented vs service-oriented monitoring

# Okay... is some cases<br/><br/>
- foobar process is down: systemd Restart= settings 
- Linux Container is down: Docker restart policy
- VM is down: AWS Auto Scaling group
- Bare metal host is down: &lt;put your solution here&gt;
- AWS Availability Zone is down: Multi A-Z for RDS, ElastiCache, S3
- Region is down: cross-region replication for RDS, DynamoDB, S3
- Whole Amazon Cloud is down (can this happen at all?): Kubernetes Federation

# Usually not okay<br/><br/>
- User can not see a cat video
- User can not spent money on your website
---

title: Checks vs Metrics
subtitle: ...by looking at Nagios vs Prometheus

- <b>Metric</b>: time, name, value/float; key-value pairs of context (very nice to have)
- <b>Check</b>: time, host name, service name, status (0=OK, 1=WARNING, 2=CRITICAL, 3=UNKNOWN), output/text
<br/><br/>

- <b>Decision about alert: EARLY vs LATE</b>
- Simplicity: simple vs complex
- Flexibility: limted vs powerful
- Time Frame: now/narrow vs wide
- State: stateless vs stateful
- Rant: past vs future
---

title: Pull vs Push architecture

- TODO
---

title: Compare to Graphite, InfluxDB, OpenTSDB, KairosDB, Nagios, Sensu

- Graphite, InfluxDB, OpenTSDB (HBase), KairosDB (Cassandra), Nagios, Sensu
- TODO
---

title: Prometheus components
subtitle: ...why so many deployment units?
---

title: Prometheus Exporters in different languages
---

title: Apps with native Prometheus support
---

title: Scale out Prometheus, HA setup
---

title: Prometheus external, long-term storage (briefly)
---

title: Coming from AWS CloudWatch, Nagios, Zabbix, CollectD, Graphite, NewRelic?
