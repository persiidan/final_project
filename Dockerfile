# Use the official Python image as the base image
FROM python:latest

# Set the working directory in the container
WORKDIR /app

# Copy your Python application files into the container
COPY . /app

# Install any dependencies your application needs (e.g., Flask, Django, etc.)
# If you have a requirements.txt file, you can use it to install dependencies
# Example: 
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose the port your web application will listen on (e.g., 5000)
EXPOSE 6969

# Specify the command to run your Python web application
CMD ["python", "./python-app/webapp.py", "&"] 
