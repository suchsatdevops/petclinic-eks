FROM maven:3.5-jdk-8 as BUILD
COPY . /usr/src/
WORKDIR /usr/src/
RUN mvn clean package

FROM tomcat
COPY --from=BUILD /usr/src/target/petclinic.war /usr/local/tomcat/webapps/