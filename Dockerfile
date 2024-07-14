# Stage 1: Build stage
FROM maven:3.8.3-openjdk-11-slim as build

WORKDIR /app

# Copy the Maven configuration files (pom.xml) to cache dependencies
COPY pom.xml .

# Download dependencies only if pom.xml is changed
RUN mvn dependency:go-offline

# Copy the entire project to build
COPY . .

# Package the application as a WAR file
RUN mvn clean package -DskipTests

# Stage 2: Runtime stage
FROM openjdk:11-slim as runtime

WORKDIR /app

# Copy the packaged WAR file from the build stage
COPY --from=build /app/target/UPL.war app.war

# Expose the port your application runs on (assuming port 8080)
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "app.war"]
