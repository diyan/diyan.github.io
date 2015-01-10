+++
date = "2015-01-04T14:46:39+02:00"
draft = false
title = "Summary of passed 2014 year"
+++

2014 year had passed and it would be nice to dump all things that I did that year.

## Major

### Very first year with 0 days usage of Windows

No usage at home, no usage at work. For a long time I was very interested in Linux and Open Source. During my work in .NET ecosystem I have a strong feeling that Open Source libraries and tools fit best to my way of getting job done. 

In September 2011 I made a major shift from .NET/Windows to Python/Linux. I did spent 6 years on .NET platform and have not slightest doubts to do this big change.

### From Ubuntu to Arch Linux

For about one and a half year I've put a large amount of effort to learn main Ubuntu administration topics - coreutils, boot loaders, file systems, daemons, networking, logging, security, etc.

In parallel, a lot of desktop environment were tried and changed - Unity, Gnome 2, KDE 4, XFCE, LXDE and eventually I ended up on a very lightweight tiling window manager - [i3wm](https://i3wm.org/).

Those two things and also a willing to have bleeding edge software led me to Arch Linux which I have started to use at home starting from October 2014.

## Medium/Minor

Other things are somewhat smaller, so I will just list them without any ordering.

Visited Crete and Thailand. I'm rather indifferent to traveling, but my wife is crazy about this. To make her happier I had to visit United Arab Emirates, Sri Lanka, Turkey, Poland, Czech Republic, Germany, Austria so far. :)

Got B1/B2 USA Visa which will be valid for next 10 years.

**Docker user** since v0.4. Using it for software evaluation, integration testing, setting up dev environment (including boot2docker on Mac OS for one my colleague). Planning to start use it in production this year.

Become an advocate for **structured logging** - [structlog](https://pypi.python.org/pypi/structlog), [nxlog](http://nxlog.org/), [logstash](http://logstash.net/), [Kibana](http://www.elasticsearch.org/overview/kibana/) (Ruby version, then AngularJS). Now considering to change nxlog + Logstash into Mozilla's [Heka](http://hekad.readthedocs.org/).

Become a **metrics junky** - our [Graphite](http://graphite.wikidot.com/) installation contains metrics from application ([scales](https://pypi.python.org/pypi/scales) then [metrology](https://pypi.python.org/pypi/metrology)), Nagios ([graphios](https://github.com/shawn-sterling/graphios)), [CollectD](http://collectd.org/), Amazon CloudWatch (homegrown script). Now planning to switch from Graphite to [InfluxDB](http://influxdb.org/) and [Grafana](http://grafana.org/).  

Did learn how to write LSB compatible init.d scripts and then happily threw away [all]((http://refspecs.linuxbase.org/LSB_3.1.0/LSB-Core-generic/LSB-Core-generic/iniscrptact.html) that [knowledge](http://refspecs.linuxbase.org/LSB_3.1.0/LSB-Core-generic/LSB-Core-generic/iniscrptfunc.html) and learn [Upstart](http://upstart.ubuntu.com/cookbook/). I would rather support two scripts for Upstart and SystemD instead of returning to the Middle Ages. Learning SystemD.

Started track all configs for nginx, upstart, logrotate, gunicorn, uwsgi, heka, git deploy/develop hooks in Git repository next to code. They are deployed on each web node via post-update/post-merge git hooks. Hopefully I will start use [Ansible](http://www.ansible.com/) for that at some point.

Learn Nginx a bit - compression, etags, satic file caching with and w/o expire validation, PAM/LDAP integration, ACLs.

Invested some time to learn Golang, keeping most attention on a philosophy benind this language and ecosystem in general. Right now it's mostly theoretical knowledge and hopefully this year I would start some project in Golang.

My chronic test-all-the-things infection became worse this year, so I've adopted couple practices:

- assert_json_equal function that displays unified diff along with AssertionError
- In memory Gevent-SocketIO server inspired on this [implementation](https://github.com/miguelgrinberg/Flask-SocketIO/blob/master/flask_socketio/test_client.py)
- Asked my teammate to develop in process RiakClientMock that supports get/set and 2i lookups (unfortunately, later we dropped that code due to switch on Cassandra)
- Came up with _cassandra_process (build/start Docker container with real Cassandra node once per test session) and cassandra_mock (truncate all tables before each test function/method) py.test fixtures
- Started use in process [mockredispy](https://pypi.python.org/pypi/mockredispy) instead of real redis instance to speed up tests (unfortunately it does not emulate pub/sub but we are planning to change that)
- Evaluated approach with Dockerized Selenium Server with PhantomJS, SlimerJS, Firefox and Chrome for running frontend tests (planning to integrate that into dev our process in 2015)

Start using a bunch of nice Python libraries/tools:

- [itertoolz](https://pypi.python.org/pypi/itertoolz)
- [jsonschema](https://pypi.python.org/pypi/jsonschema)
- [wsgicors](https://pypi.python.org/pypi/wsgicors)
- [simpleflake](https://pypi.python.org/pypi/simpleflake) (instead of uuid4)
- [suds-jurko](https://pypi.python.org/pypi/suds-jurko/0.6)
- [gevent-socketio](https://pypi.python.org/pypi/gevent-socketio) (not quite happy with it and PR with 4 fixed bugs still without any feedback)
- [flask_principal](https://pypi.python.org/pypi/Flask-Principal)
- [twilio](https://pypi.python.org/pypi/twilio)
- [apns](https://pypi.python.org/pypi/apns)
- [unicodecsv](https://pypi.python.org/pypi/unicodecsv/0.9.4)
- [python_geoip](https://pypi.python.org/pypi/python-geoip)
- [text-unidecode](https://pypi.python.org/pypi/text-unidecode)
- [multi_mechanize](http://testutils.org/multi-mechanize/) (instead of [Apache JMeter](http://jmeter.apache.org/), [Locust](http://locust.io/))
- [cqlengine](https://pypi.python.org/pypi/cqlengine)

Did a release of [pywinrm](https://pypi.python.org/pypi/pywinrm) v0.0.3. My pesonal project is moving forward - I was happy to see a code contribution from about 7 developers. pywinrm has about 2000-2500 monthly downloads on PyPI and it was [included](http://docs.ansible.com/intro_windows.html) into Ansible project.

Got acquainted with several Virtual DOM and/or FRP frameworks - [VueJS](http://vuejs.org/), [ReactJS](http://facebook.github.io/react/), [Mithrill](http://lhorie.github.io/mithril/), [Mercury](https://github.com/Raynos/mercury), [Virtual-DOM](https://github.com/Matt-Esch/virtual-dom). I hate JavaScript but planning to write some code in ECMAScript 6 with one of those frameworks (most likely Mercury). Even if I'm pure backend developer I'm prefer keeping fresh skills in JavaScript at least on a very basic level.

Used awesome [Percona Tookit](http://www.percona.com/software/percona-toolkit) (pt-archiver, pt-config-diff, pt-mysql-summary, pt-online-schema-change, pt-table-sync) for managing pretty big MySQL servers that contains about 600GB data.

Dived into a world of distributed databases/storages - [Riak](http://basho.com/riak/), [Cassandra](http://cassandra.apache.org/), [Couchbase](http://www.couchbase.com/), [BigCouch](http://bigcouch.cloudant.com/), [Hadoop](http://hadoop.apache.org/), [HBase](http://hbase.apache.org/), [CRDT](https://speakerdeck.com/vanstee/convergent-replicated-data-types), [CAP theorem](http://en.wikipedia.org/wiki/CAP_theorem), [Paxos](http://research.microsoft.com/en-us/um/people/lamport/pubs/lamport-paxos.pdf), [Raft](http://raftconsensus.github.io/) and all that staff. Most time I have spent with Riak, Cassandra but ended up with Cassandra for my current project. Also I did tried [Presto](http://prestodb.io/)/Cassandra and planning to work with [Elasticsearch](http://www.elasticsearch.org/). [Spark](http://spark.apache.org/)/[Shark](http://databricks.com/blog/2014/07/01/shark-spark-sql-hive-on-spark-and-the-future-of-sql-on-spark.html)/Cassandra, [Spark SQL](https://spark.apache.org/sql/)/Cassandra this year.

Also I was involved into setting up [PCI DSS](https://www.pcisecuritystandards.org/security_standards/) compliant environment. During that time I have learn a lot best practices on security/traceability/configration management/monitoring that could be applied to any project. Amout of resources that I've collected was pretty big, so I published everything on [Gist](https://gist.github.com/diyan/c35c0574d200ac3a36eb).

2014 was awesome year with a lot of interesting tasks and technical chalenges and I'm eager to try new things that will come in this 2015 year.

Happy New Year! 

(better later than never :)