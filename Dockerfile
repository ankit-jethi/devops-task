FROM python:3.8.5-alpine3.12

# Install gunicorn server
RUN pip install --upgrade pip \
    && pip install gunicorn

# Copy source code 
COPY src /app

# Change to app directory
WORKDIR /app

# Install the app dependencies
RUN pip install -r requirements.txt     

# Make port 8000 available from outside
EXPOSE 8000

# Start gunicorn server and bind it port 8000 on all interfaces
CMD ["gunicorn", "app:app", "--name", "devops-task", "--bind", "0.0.0.0:8000"]
