# Use a Maven image for building the project
FROM maven:3.9.6-eclipse-temurin-17 AS builder

# Set the working directory
WORKDIR /app

# Copy the project files to the container
COPY . .

# Build the project (skip tests if you want faster builds)
RUN mvn clean package -DskipTests

# Use a JDK runtime for running the application
FROM eclipse-temurin:17-jdk

# Set the working directory
WORKDIR /var/lib/jenkins/workspace/test/addressbook/addressbook_main

# Copy the built jar from the builder stage
COPY --from=builder /var/lib/jenkins/workspace/test/addressbook/addressbook_main/target/addressbook.war /app/addressbook.war
