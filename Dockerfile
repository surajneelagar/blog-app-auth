# Use an official lightweight Python image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory inside the container
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire app into the container
COPY . .

# Ensure the database and tables are created when the container starts
# (We'll handle this in entrypoint or via manual initialization)

# Command to start the app using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]
