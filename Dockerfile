# Use Eclipse Temurin JDK image as base
FROM eclipse-temurin:17-jdk

# Set working directory inside the container
WORKDIR /app

# Copy the WAR file into the container (adjust the source path if needed)
COPY /var/lib/jenkins/workspace/test/addressbook/addressbook_main/target/addressbook.war /app/addressbook.war

# Expose the port the app will run on (adjust if needed)
EXPOSE 8080

# Run the WAR file with Java
CMD ["java", "-jar", "/app/addressbook.war"]
