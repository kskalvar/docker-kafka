FROM ubuntu:14.04

RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository ppa:openjdk-r/ppa && apt-get update
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y wget
RUN wget http://apache.claz.org/kafka/0.9.0.0/kafka_2.11-0.9.0.0.tgz && tar -xzf kafka_2.11-0.9.0.0.tgz

ADD files/server.properties /kafka_2.11-0.9.0.0/config/server.properties

ADD files/start.sh /bin/start.sh
RUN chmod +x /bin/start.sh

EXPOSE 2181
EXPOSE 9092

ENTRYPOINT ["/bin/start.sh"]
