FROM ubuntu:14.04

ENV KAFKA_VERSION 1.0.0
ENV KAFKA_RELEASE 2.11
ENV KAFKA_MEDIA kafka_$KAFKA_RELEASE-$KAFKA_VERSION
ENV KAFKA_MIRROR http://apache.osuosl.org/kafka/

RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository ppa:openjdk-r/ppa && apt-get update
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y wget

RUN wget $KAFKA_MIRROR/$KAFKA_VERSION/$KAFKA_MEDIA.tgz && tar -xzf $KAFKA_MEDIA.tgz
RUN mv /$KAFKA_MEDIA /kafka
RUN echo $KAFKA_MEDIA > /kafka/.version

ADD files/server.properties /kafka/config/server.properties

ADD files/start.sh /bin/start.sh
RUN chmod +x /bin/start.sh

EXPOSE 2181
EXPOSE 9092

ENTRYPOINT ["/bin/start.sh"]
