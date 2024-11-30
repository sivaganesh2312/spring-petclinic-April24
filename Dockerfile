FROM maven:3.9.9-amazoncorretto-17-alpine AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-slim
WORKDIR /app
COPY --from=build /app/target/spring-petclinic-*.jar /app/petclinic.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/petclinic.jar"]
