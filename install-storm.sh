apt-get update
apt-get install -y unzip supervisor openjdk-7-jdk

/etc/init.d/supervisor stop

groupadd storm
useradd --gid storm --home-dir /home/storm --create-home --shell /bin/bash storm

unzip -o /vagrant/$1.zip -d /usr/share/

chown -R storm:storm /usr/share/$1
ln -s /usr/share/$1 /usr/share/storm
ln -s /usr/share/storm/bin/storm /usr/bin/storm
#unzip -o -j /vagrant/storm-starter_lib.zip -d /usr/share/storm/lib
mkdir /etc/storm
chown storm:storm /etc/storm

gunzip /vagrant/$2.tar.gz
tar xvf /vagrant/$2.tar -C /usr/share/java
mv /usr/share/java/$2/*.jar /usr/share/java
mv /usr/share/java/cassandra-java-driver-2.0.2/lib/*.jar /usr/share/java
rm /usr/share/storm/conf/storm.yaml
cp /vagrant/storm.yaml /usr/share/storm/conf/
cp /vagrant/cluster.xml /usr/share/storm/logback/
ln -s /usr/share/storm/conf/storm.yaml /etc/storm/storm.yaml 

mkdir /var/log/storm
chown storm:storm /var/log/storm

sed -i '1s/^//set CLASSPATH=%CLASSPATH%;//usr//share//java /' /usr/share/storm/storm-config.cmd

#sed -i 's/${storm.home}\/logs/\/var\/log\/storm/g' /usr/share/storm/logback/cluster.xml
