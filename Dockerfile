FROM wurstmeister/kafka:latest

#RUN mkdir -p /usr/app
ADD kafka.yml /opt/kafka/libs/kafka.yml
#EXPOSE 2181 9092 9094
#ENV KAFKA_OPTS "-javaagent:/opt/kafka/libs/jmx_prometheus_javaagent.jar=7070:/opt/kafka/libs/kafka.yml"
RUN wget  https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.11.0/jmx_prometheus_javaagent-0.11.0.jar

RUN cp jmx_prometheus_javaagent-0.11.0.jar /opt/kafka/libs/jmx_prometheus_javaagent.jar
RUN chmod +r /opt/kafka/libs/jmx_prometheus_javaagent.jar
#RUN sed -i 's#while netstat#export KAFKA_OPTS=\nexport KAFKA_JMX_OPTS=\nwhile netstat#g' /usr/bin/create-topics.sh

EXPOSE 7070
