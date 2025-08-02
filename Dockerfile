# Step 1: Build the application
FROM maven:3.9.6-eclipse-temurin-17 AS builder

# Set working directory
WORKDIR /app

# Copy the pom.xml and install dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source files
COPY src ./src

# Build the app (skip tests)
RUN mvn clean package -DskipTests

# Step 2: Run the application
FROM openjdk:17-jdk-slim

# Create app folder
WORKDIR /app

# Copy jar file from builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose the app port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
