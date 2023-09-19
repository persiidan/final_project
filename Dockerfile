# Use the official Python image as the base image
FROM python:latest

# Set the working directory in the container
WORKDIR /app

# Copy your Python application files into the container
COPY . /app

RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz
# Install any dependencies your application needs (e.g., Flask, Django, etc.)
# If you have a requirements.txt file, you can use it to install dependencies
# Example: 
RUN pip install -r requirements.txt

# Expose the port your web application will listen on (e.g., 5000)
EXPOSE 5000

# Specify the command to run your Python web application
CMD ["python", "./python-app/webapp.py", "&"] 