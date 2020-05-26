
FROM openjdk:8

LABEL maintainer="naman11396@gmail.com"

VOLUME /tmp
EXPOSE 8087

ARG WAR_FILE=target/Complaintportal-SNAPSHOT.war

ADD ${WAR_FILE} Complaintportal-SNAPSHOT.war

ENTRYPOINT ["java","-jar","/Complaintportal-SNAPSHOT.war"]
