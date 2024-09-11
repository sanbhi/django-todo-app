# Use an appropriate base image
FROM python:3.12

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install dependencies
RUN apt-get update && \
    apt-get install -y python3-distutils && \
    pip install --no-cache-dir -r requirements.txt

# Copy the project files
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose the port and start the application
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]



