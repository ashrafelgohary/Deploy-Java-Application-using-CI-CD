FROM tomcat:9.0 
# Use a specific version
# Remove default webapps to keep the image clean
RUN rm -rf /usr/local/tomcat/webapps/*

RUN cp -R /usr/local/tomcat/webapps.dist/*	/usr/local/tomcat/webapps
# Copy WAR files to deploy the application
COPY webapp/target/*.war /usr/local/tomcat/webapps/

# Set proper permissions (if required)
# Create tomcat user and group
RUN groupadd -r tomcat && useradd -r -g tomcat tomcat

# Set correct permissions
RUN chown -R tomcat:tomcat /usr/local/tomcat/webapps

# Switch to the tomcat user
USER tomcat
