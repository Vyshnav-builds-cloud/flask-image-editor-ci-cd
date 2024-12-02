FROM python:3.10-slim

WORKDIR /app

# Copy application files
COPY . /app
RUN apt-get update && apt-get install -y \
    libgl1 \
    libglib2.0-0 \
    && apt-get clean

# Install Python dependencies
RUN pip install --no-cache-dir -r requirement.txt
RUN pip install --no-cache-dir numpy
# Expose the application port
EXPOSE 5001

# Run the application
CMD ["python", "main.py"]

