FROM maven:3.6.3-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM maven:3.6.3-openjdk-17-slim
COPY --from=build target/ems-backend-0.0.1-SNAPSHOT.jar Demo.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","Demo.jar"]