FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y python3.10 python3.10-venv python3-pip git

# Create a virtual environment using Python 3.10
RUN python3.10 -m venv /venv

# Upgrade pip inside the virtual environment and install dependencies
RUN /venv/bin/pip install --upgrade pip && /venv/bin/pip install PyYAML

# Copy application files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
