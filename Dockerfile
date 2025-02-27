FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y python3.12 python3.12-venv python3-pip git

# Create a virtual environment using Python 3.12
RUN python3.12 -m venv /venv

# Upgrade pip inside the virtual environment and install dependencies
RUN /venv/bin/pip install --upgrade pip && /venv/bin/pip install PyYAML

# Copy application files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure the entrypoint script is executable
RUN chmod +x /entrypoint.sh

# Use the virtual environment inside the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
