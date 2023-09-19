# Use the official Python image as the base image
FROM python:latest

# Set the working directory in the container
WORKDIR /app

# Copy your Python application files into the container
COPY . /app

# Install any dependencies your application needs (e.g., Flask, Django, etc.)
# If you have a requirements.txt file, you can use it to install dependencies
# Example: 
RUN pip install -r requirements.txt

# Install Docker client
USER root

# Install the Docker client
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce

# Switch back to the non-root user
USER 1001

# Expose the port your web application will listen on (e.g., 5000)
EXPOSE 5000

# Specify the command to run your Python web application
CMD ["python", "./python-app/webapp.py"]
