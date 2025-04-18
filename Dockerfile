# Use the official slim Python image
# syntax = docker/dockerfile:1.4
FROM python:3.11-slim 

# Set working directory inside container
WORKDIR app

# Copy requirements first to leverage Docker caching
COPY titanic_model_api/requirements.txt .


# Ensure that the `app` directory exists before copying
# If the `app` folder is missing in the build context, Docker will fail.
COPY titanic_model_api/app ./app

# Ensure that the wheel file exists in the build context
COPY dist/*.whl .

# Install the package from the wheel file
# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt 

# Expose the port FastAPI will run on
EXPOSE 8001

# Correct FastAPI command using uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8001"]
