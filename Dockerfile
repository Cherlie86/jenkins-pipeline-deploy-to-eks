#Use the official Nginx image as the base image
FROM nginx:latest

#Install Python 3.11 and pip
RUN apt-get update &&
apt-get install -y python3.11 python3-pip

#Set the working directory
WORKDIR /app

#Display Python version and pip version for verification
RUN python3.11 --version &&
pip3 --version

#Expose the default Nginx port
EXPOSE 80

#Command to start both Nginx and Python application (replace this with your own setup)
CMD ["nginx", "-g", "daemon off;"]