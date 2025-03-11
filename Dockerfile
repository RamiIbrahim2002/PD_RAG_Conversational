FROM python:3.9.16-slim

# Set the working directory
WORKDIR /app

# Copy only the requirements file to leverage Docker cache
COPY requirements.txt .

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Install dependencies with an increased timeout
RUN pip install --default-timeout=100 --no-cache-dir -r requirements.txt

# Copy the rest of your application files
COPY . .

# Expose port if your app requires it (e.g., Streamlit uses 8501 by default)
EXPOSE 8501

# Command to run your application (adjust as necessary)
CMD ["streamlit", "run", "app.py"]
