# Stage 1: Build stage
FROM maven:3.8.3-openjdk-18 as build

WORKDIR /app

# Copy the Maven configuration files (pom.xml and settings.xml if any) to cache dependencies
COPY pom.xml .
COPY src ./src

# Download dependencies only if pom.xml is changed
RUN mvn dependency:go-offline

# Build the application
RUN mvn clean package -DskipTests

# Stage 2: Runtime stage
FROM openjdk:18-jdk-slim as runtime

WORKDIR /app

# Copy the packaged WAR file from the build stage
COPY --from=build /app/target/upl.war app.war

# Expose the port your application runs on (assuming port 8080)
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "app.war"]
