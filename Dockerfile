FROM tomcat:10.1.19-jdk17

# Remove the default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the pre-built WAR file directly into Tomcat
COPY FashionStore.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
