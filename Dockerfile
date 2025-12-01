FROM python:3.10.8-slim-buster

# Install system packages
RUN apt update && apt install -y git && apt clean

# Set working directory
WORKDIR /TheMovieProviderBot

# Copy requirements first (better layer caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy all project files
COPY . .

# Make start.sh executable
RUN chmod +x /start.sh

# Start the bot
CMD ["/bin/bash", "start.sh"]
