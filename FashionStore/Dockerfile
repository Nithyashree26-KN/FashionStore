# Stage 1: Build the application using Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run the application using Tomcat 10.1
FROM tomcat:10.1.19-jdk17
# Remove the default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*
# Copy the built WAR file from the build stage
COPY --from=build /app/target/FashionStore.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
