FROM ubuntu:16.04 
MAINTAINER "lucky"
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y wget
ENV JAVA_HOME /usr/bin/java
CMD cd /root
RUN wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.66/bin/apache-tomcat-8.5.66.tar.gz
RUN tar -zxvf apache-tomcat-8.5.66.tar.gz
RUN rm -rf apache-tomcat-8.5.66.tar.gz
RUN mv apache-tomcat-8.5.66 /root/apache-tomcat
COPY target/flipkart.war /root/apache-tomcat/webapps
ENTRYPOINT /root/apache-tomcat/bin/startup.sh && bash
