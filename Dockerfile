# Use Python base image
FROM python:3.8

# Set working directory
WORKDIR /app

# Copy requirement file and install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy application code and templates explicitly
COPY app.py .
COPY templates/ templates/
COPY static/ static/
COPY *.yml .    
COPY scripts/ scripts/

# Expose port for Flask
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]

