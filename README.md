storm-vagrant
=============


Vagrant config to create a virtualized Storm cluster

Pulled from https://github.com/ptgoetz/storm-vagrant

Usage:

Warning, this script may alter files on the host OS !

storm-starter.jar is an altered version of storm starter which writes to a cassandra cluster.  It expects the 
cluster to be at 192.168.2.10.  See:


https://github.com/acobley/vagrant-cassandra

for a vagrant cassandra provisioner.

If you include a Lib directory then any jar files in there will be added to the storm libs directory

watch the Vagrantfile for the versions of Storm and the Cassandra drivers that are downloaded.

(Note: I'm sure this can be done more effectively, but it works for me !) 