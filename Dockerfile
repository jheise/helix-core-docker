FROM ubuntu:14.04

RUN apt-get update && apt-get install -y python-software-properties software-properties-common wget
RUN add-apt-repository -y ppa:webupd8team/java
RUN  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN apt-get update && apt-get install -y oracle-java7-installer
ENV ZK zookeeper:2181
RUN mkdir -p /helix/helix-core
RUN wget -O /helix/helix-core.tar http://www.carfab.com/apachesoftware/helix/0.6.4/binaries/helix-core-0.6.4-pkg.tar
RUN tar xf /helix/helix-core.tar -C /helix/helix-core --strip-components=1
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
ENV CLUSTER supercluster_v6
CMD cd /helix/helix-core/bin && ./run-helix-controller.sh --zkSvr $ZK --cluster $CLUSTER
