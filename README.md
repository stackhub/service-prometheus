# Purpose

This repo allows for the immediate and simple use of the Prometheus monitoring
tool.  This tool monitors container and machine activity across multiple hosts.

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


For an example stack file, please see the 
[`stack-prometheus` repo](http://github.com/stackhub/stack-prometheus).

## Compatibility

This image is only useful in conjunction with the StackEngine CAC. It will not
work stand-alone due the leveraging of certain built in features of the CAC.

# License

MIT
