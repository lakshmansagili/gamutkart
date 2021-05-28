FROM ubuntu
RUN apt-get update -y
RUN apt-get install -y openjdk-8-jdk
ENV JAVA_HOME /usr
ADD apache-tomcat-10.0.6.tar.gz /root
COPY target/flipkart.war /root/apache-tomcat-10.0.6/webapps
ENTRYPOINT /root/apache-tomcat-10.0.6/bin/startup.sh && bash
