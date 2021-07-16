FROM maven:3.6.1-jdk-8 as maven_builder
WORKDIR /app
COPY . .
RUN mvn package

FROM tomcat:8.5.43-jdk8
COPY --from=maven_builder /app/target/jb-hello-world-maven-0.1.0.jar /usr/local/tomcat/webapps
