# Stage 1: Build the application (Using Maven with Amazon Corretto)
FROM maven:3.8.4-amazoncorretto-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the application (Using Amazon Corretto Slim)
FROM amazoncorretto:17-alpine
WORKDIR /EasyCRUD
COPY --from=build /EasyCRUD/target/*.jar student-registration-backend-0.0.1-snapshot.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "student-registration-backend-0.0.1-snapshot.jar"]
