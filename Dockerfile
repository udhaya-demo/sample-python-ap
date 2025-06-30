# Base image
FROM python:3.8

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy application code and templates explicitly
COPY app.py .
COPY templates/ templates/
COPY static/ static/   # optional, if using static files
COPY *.yml .           # if using buildspec.yml and appspec.yml
COPY scripts/ scripts/ # optional, if using any deployment scripts

# Expose Flask port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
