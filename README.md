# Overview

This image, coupled with the StackEngine Container Application Center, allows
you to monitor any number of docker hosts and their containers using Google's
`cAdvisor` and Soundcloud's `Prometheus.`

The Prometheus configuration is extremely simple so as to offer very little
opinion on how a user would run the Prometheus service itself. For
information on configuring Prometheus to meet _your_ needs, please see [the 
documentation](http://prometheus.io/docs/operating/configuration/).

When coupled with the StackEngine Scheduler, use of this container means that
adding a new host to your mesh through the container applicaiton center will 
see `cAdvisor` start on that host and register itself with Prometheus. 

Scale without headache.

# Usage

The `stackhub/prometheus` image must be passed the following environment 
variables a run time:

* SE_API_TOKEN - Your token can be found under "Settings > My Profile"
* SE_LEADER_IP - This is the IP address of the host of your StackEngine mesh 
  leader.  It is used by the running container to find the Service Discovery 
  layer.
* SE_CADVISOR_KEY - The Service Registry key that tracks the running instances
  `cadvisor`.  IT will be of the form 
  `apps/<INSTANCE_NAME>-<cadvisorServiceName_cAdvisorServicePort>/containers`
  for example `apps/prom-cadv-cadvisor-8080/containers`
* SE_CADVISOR_RANGE - The Service Registry key expressed as a range.  For
  example `/apps/prom-cadv-cadvisor-8080/containers/*`

For an example stack file, please see the 
[`stack-prometheus` repo](http://github.com/stackhub/stack-prometheus).

## Compatibility

This image is only useful in conjunction with the StackEngine CAC. It will not
work stand-alone due the leveraging of certain built in features of the CAC.

# License

MIT
