# Stage 1: Build stage
FROM openjdk:21-slim as build

# Install Maven
RUN apt-get update && apt-get install -y maven

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven configuration file and the source code to the container
COPY pom.xml ./
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Stage 2: Runtime stage
FROM openjdk:21-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Create directories for text files
RUN mkdir -p /app/data

# Copy the packaged WAR file from the build stage and rename it to upl.war
COPY --from=build /app/target/*.war upl.war

# Expose the port your application runs on (assuming port 8080)
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "upl.war"]
