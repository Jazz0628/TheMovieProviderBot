# Use Python 3.10.8
FROM python:3.10.8-slim-buster

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Update and install dependencies
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y git build-essential libglib2.0-0 libsm6 libxrender1 libxext6 wget curl \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip, setuptools, wheel
RUN pip install --upgrade pip setuptools wheel

# Copy requirements and install
COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Create app directory
RUN mkdir /TheMovieProviderBot
WORKDIR /TheMovieProviderBot

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Run the bot
CMD ["/bin/bash", "/start.sh"]
