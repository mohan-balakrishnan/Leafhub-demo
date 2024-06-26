# Use Java 8 from the repo image
FROM openjdk:8-jdk

# Install Maven for the app
RUN apt-get update && apt-get install -y maven sudo

# Setup default work dir
WORKDIR /app

# Setup the git repo
RUN git clone https://github.com/TestLeafInc/jenkins-pipeline /app

# Change the directory
WORKDIR /app/leafhub

# Pull the latest code
RUN git pull

# Setup the command to run maven as spring-boot app
CMD ["mvn","spring-boot:run"]

# Expose the app port : 80
EXPOSE 80
