title: My background

<b>Official</b>

- Senior developer at <a href="http://www.dev-pro.net/">Dev-Pro.net</a>
- 6 years in .NET, 4 years in Python, 1 month in NodeJS
- Automation junkie - unit/integration/e2e tests, environment, continuous delivery
- Expertise in distributed, high load, HA architectures

<b>Non-official</b>

- ZX/Q Basic, C/C++, Gens4/x386/FPU Assembly in past as hobby
- Got tired of .NET / Microsoft
- Python, Golang, Linux, Docker, JS SPA FTW!
- Keep trying to love JavaScript but no success so far
---

title: Plan

- Docker history
- Why Docker?
- Docker engine, host OS
- Docker images, guest OS
- Docker images, official language stacks
- Networking
- Storage engines
- Docker ecosystem
- QA session (it would be nice to have a lot of time here)
---

title: Docker history

- chroot at 1982
- FreeBSD jail at 2000
- Solaris Containers at 2004
- OpenVZ at 2005
- cgroups (and namespaces later) at 2007
- LXC at 2008
- Docker on LXC at 2013
- Docker on libcontainer at 2014
---

title: Why Docker?

- Rapid application deployment
- Portability accross machines
- Version control and component reuse
- Sharing
- Lightweight footprint and minimal overhead
- Simplified maintenance

(c) Red Hat, Inc. <a href="https://goo.gl/RJLDJw">https://goo.gl/RJLDJw</a>

<br>

- Dockerfile
- Copy on write / snapshot model

---

title: Docker engine, hosts
subtitle: Linux distributions that can run Docker engine daemon v1.7

- Linux Kernel 3.10
- aufs, devicemapper is mainstream at least for now
- btrfs, overlay(fs) is alternative
- Ubuntu 12.04 (needs 14.04 kernel)
- Ubuntu 13.10, Debian 7.7
- CentOS 7, RHEL 7, Fedora 21, Oracle Linux 6
- SUSE Linux Enterprise 12, openSUSE 12.3
- Gentoo, Arch Linux, CRUX, FrugalWare
- (non-official, but still works) CentOS 6.5, Kernel 2.6.32-431
---

title: Docker images, official guests
subtitle: Linux distributions that can run within container

- anything that can run with host's Linux Kernel
- Ubuntu and Debian are blessed distros (see buildpack-deps)
- Ubuntu 10.04, 12.04, 12.10, 13.04, 14.04, 15.04, 15.10
- Debian 6.0, 7.3-8, 8.0, 8.1
- CentOS 5.11, 6.6, 7.0, 7.1 and Fedora 20-22
- Alpine 2.6-7, 3.1-2 and Busybox 2013.08.1, 2014.02
- CirrOS 0.3.0, 0.3.3 and CRUX 3.0, 3.1
- Oracle Linux 5.11, 6.6, 7.0, 7.1 and openSUSE 13.1, 13.2
- ROS indigo, jade
---

title: Docker images, community guests
subtitle: Distributions from community

- pigfoot/gentoo-base
- base/archlinux:2014.07.03
- let me know if you find anything else

NOTE some tags are hidded at Docker Hub site, use bash!

<pre data-lang="bash">
curl -s https://index.docker.io/v1/repositories/centos/tags \
  | python -m json.tool | grep 'name'
</pre>
---

title: Docker images, official language stacks

- GCC C/C++ 4.7.4, 4.8.5, 4.9.3, 5.1.0
- OpenJDK Java JRE/JDK 6b35, 7u79, 8u45
- NodeJS 0.8.28, 0.10.40, 0.12.7
- PHP cli/Apache/FPM 5.4.43, 5.5.27, 5.6.11, 7.0.0 beta2
- Python 2.7.10, 3.2.6, 3.3.6, 3.4.3, 3.5.0 beta3
- Ruby 2.0.0, 2.1.6, 2.2.2
- Perl 5.20.2, 5.22.0
- Golang 1.3.3, 1.4.2, 1.5 beta2
- Mono 3.8.0, 3.10.0, 3.12.1, 4.0.1
- Clojure 2.5.1
- Bonus: ASP.NET 5 beta5 from Microsoft team

NOTE listed versions are taken from site, use bash to find more
---

title: Docker engine networking

- docker0 virtual ethernet bridge is used by default
- 172.17.42.1/16 CIDR by default (bye bye, Dev-Pro Wi-Fi)
- <b>--bip=192.168.100.1/24</b> in /etc/default/docker to override
- <b>--dns=, --dns-search=</b> to setup DNS (container's /etc/resolv.conf)
- <b>--link=</b> to link containers together (container's /etc/hosts)
- <b>--net=bridge</b> is default, see docker0 above
- <b>--net=host</b> to use real network from host
- <b>--net=container:NAME_or_ID</b> to use network from other container
- <b>--net=none</b> to manually configure network in container
- <b>-p port:port</b> to let container accept incoming connections
---

title: Docker storage engines
subtitle: Docker chooses a storage driver in this priority order

- <b>aufs</b> is fast, - big files, no mainline Kernel but Ubuntu/Debian
- <b>overlay(fs)</b> is fast, - big files, "proper" aufs, mainline Kernel 3.18
- <b>devicemapper</b> is moderate for direct-lvm / slow for loop-lvm, + big files, developed by RedHat
- <b>btrfs</b> is moderate, + big files, maybe good if you already have btrfs for something else
- <b>vfs</b> is super slow, not compact (copy on write == just copy), implemented for tests

---

title: Docker ecosystem, part 1

- Dev tools: Drone.io, Jenkins plugin, Vagrant, ImageLayers, Docker Compose, Boot2Docker, Docker Machine, Packer.io
- Hosting: Tutum, AWS EC2 Container Service, AWS Beanstalk, Heroku, Azure Docker VM Extension, Google Container Engine
- Orchestration: OpenStack, Kubernetes, Consul, Mesos/Mesosphere, Rancher, CoreOS, etcd, Docker Swarm
- Image registry: Docker Hub, Docker Distribution, Docker Registry, Quay.io, CoreOS Enterprise Registry, Artifactory, Bitnami
- OS: CoreOS, Ubuntu Core, Rancher OS, Project Atomic, VMWare Photon, Windows Nano Server
- Configuration management: Chef, Puppet, Ansible, SaltStack
---

title: Docker ecosystem, part 2

- Networking: Pipework, Open vSwitch, Flannel, Weave, Cisco Nexus 1000V, Skydock/SkyDNS, SocketPlane, Pertino
- Security: Control groups, SELinux, AppArmor (TOMOYO, GRSEC is not clear)
- Monitoring: CollectD plugin, Sysdig, cAdvisor
- Future: runC, Open Container Initiative
