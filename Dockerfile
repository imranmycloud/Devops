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
WORKDIR /app

# Copy the built jar from the builder stage
COPY --from=builder /app/target/bookstore-*.jar /app/bookstore.jar

# Expose the port (default Vaadin port is 8080)
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "/app/bookstore.jar"]
