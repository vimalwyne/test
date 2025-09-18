# Use Java 17 runtime
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copy the built JAR file into the container
COPY target/myapp-1.0-SNAPSHOT.jar app.jar

# Run the app
ENTRYPOINT ["java", "-cp", "app.jar", "com.example.App"]

