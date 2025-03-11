FROM python:3.9-slim

WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app files
COPY . .

# Expose port 8501 (Streamlit default)
EXPOSE 8501

# Run Streamlit
CMD ["streamlit", "run", "streamlit_app.py"]
