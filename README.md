storm-vagrant
=============


Vagrant config to create a virtualized Storm cluster

Forked from https://github.com/ptgoetz/storm-vagrant

Usage:

Warning, this script may alter files on the host OS !

storm-starter.jar is an altered version of storm starter which writes to a cassandra cluster.  It expects the 
cluster to be at 192.168.2.10.  See:


https://github.com/acobley/vagrant-cassandra

for a vagrant cassandra provisioner.

If you include a Libs directory then any jar files in there will be added to the storm libs directory

The topology jar file, storm-starter.jar is exported from this cut down storm starter project:

https://github.com/acobley/CassandraStorm

To run the topology, vagrant ssh to storm1 or storm2 and run the storm jar command:

/usr/share/storm/bin/storm jar /vagrant/storm-starter.jar storm.starter.ExclamationTopology TopologyName

Where TopologyName is the name you want to call this instance

Watch the Vagrantfile for the versions of Storm and the Cassandra drivers that are downloaded.

(Note: I'm sure this can be done more effectively, but it works for me !) 

/*    keyspace for the stormsync    
CREATE KEYSPACE keyspace2 WITH REPLICATION = {'class' : 'SimpleStrategy', 'replication_factor': 1};
use keyspace2;

CREATE TABLE StormSync (
minute varchar,
processtime varchar,
interaction_time timeuuid,
Value varchar,
SaverId varChar,
PRIMARY KEY (minute,interaction_time)
) with CLUSTERING ORDER BY (interaction_time DESC);
        

NOTE:
If you see a lot of this sort of error:

b.s.d.supervisor [INFO] 59012fc4-f123-49f7-951a-12fff29ab328 still hasn't started

check your jar file names in the Libs directory.  If a file has a space character it will cause the cluster version to start.


