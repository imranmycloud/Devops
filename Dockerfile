# Use Maven to build the project
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy the whole project into Docker (clone the repo manually or in Jenkins first)
COPY . .

# Build the WAR file
RUN mvn clean package -DskipTests

# Use a JDK runtime to run the app
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy the WAR file from the builder stage
COPY --from=builder /app/target/bookstore-*.war /app/bookstore.war

# Expose port 8080
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "/app/bookstore.war"]
