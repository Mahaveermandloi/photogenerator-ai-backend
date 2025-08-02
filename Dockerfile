# Use Maven image for build
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app

# Copy everything and make mvnw executable
COPY . .
RUN chmod +x mvnw && ./mvnw clean package -DskipTests

# Use OpenJDK image to run
FROM eclipse-temurin:21-jdk
WORKDIR /app

# Copy JAR from previous stage
COPY --from=build /app/target/*.jar app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
