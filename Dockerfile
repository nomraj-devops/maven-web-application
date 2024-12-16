FROM 975049963237.dkr.ecr.us-east-1.amazonaws.com/testpipelinejava:8.0.18-jre8
COPY target/maven-web-application.war /usr/local/tomcat/webapps/maven-web-application.war
