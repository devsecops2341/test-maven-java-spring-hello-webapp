FROM maven:3-openjdk-17 AS mbuilder
RUN mkdir /hello
RUN git clone https://github.com/devsecops2341/test-maven-java-spring-hello-webapp /hello
WORKDIR /hello
RUN mvn package

FROM tomcat:9-jre11
COPY --from=mbuilder /hello/target/hello-world.war /usr/local/tomcat/webapps/
