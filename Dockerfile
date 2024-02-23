#Stage 1: Build Python application
FROM python:3.11 AS builder

WORKDIR /app

#Copy only the requirements file to leverage Docker cache
COPY requirements.txt .

#Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

#Stage 2: Final image with Nginx and Python app
FROM nginx:latest

#Copy the built Python application from the builder stage
COPY --from=builder /app /app

#Set the working directory
WORKDIR /app

#Expose the default Nginx port
EXPOSE 80

#Command to start both Nginx and Python application
CMD ["nginx", "-g", "daemon off;"]