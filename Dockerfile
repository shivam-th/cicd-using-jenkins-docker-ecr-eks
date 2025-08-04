# Use maven image to build the application
FROM maven:3.8.5-openjdk-17 AS builder

# Set the working directory
WORKDIR /app

# Copy the source code
COPY . .

# Build the application
RUN mvn clean package

##################################################

# Use a JDK image to run the application
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# copy build file from stage1
COPY --from=builder /app/target/*.jar app.jar

# Expose the port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]

