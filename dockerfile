FROM maven:3.8.5-openjdk-17 as builder

WORKDIR /app
COPY . /app

RUN mvn package

FROM openjdk:17-slim

COPY --from=builder /app/target/actuator-demo-0.0.1-SNAPSHOT.jar /app/actuator-demo.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/actuator-demo.jar"]

