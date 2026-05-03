# Use Tomcat 9 with JDK 17 as the base image
# STAGE 1: The Build Stage (The "Kitchen")
# We use a Maven image that already has JDK 17 installed
FROM maven:3.8.6-eclipse-temurin-17 AS build_stage

# Set the working directory inside the container
WORKDIR /app

# Copy your project files (pom.xml and src folder) into the container
COPY pom.xml .
COPY src ./src

# Run the build command inside the container
# This creates the .war file inside the container's /app/target folder
RUN mvn clean package -DskipTests

# -----------------------------------------------------------------------

# STAGE 2: The Runtime Stage (The "Server")
# This is your original Tomcat image
FROM tomcat:9-jre17-temurin-jammy

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# COPY the .war file FROM the build_stage instead of your local disk
# We use '--from=build_stage' to grab the file created in the first step
COPY --from=build_stage /app/target/NETFLIX-1.2.3.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]