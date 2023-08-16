
FROM python:3.9.2-slim-buster

# Create a directory for the bot and give permissions
RUN mkdir /bot && chmod 777 /bot

# Set the working directory
WORKDIR /bot

# Set the environment variable for non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required packages
RUN apt-get -qq update && apt-get -qq install -y git wget pv jq python3-dev ffmpeg mediainfo neofetch

# Expose port 80 for the application
EXPOSE 80

# Copy the application code to the container
COPY . .

# Install the required Python packages
RUN pip3 install -r requirements.txt

# Set the health check command
# This command checks if the application is running properly
HEALTHCHECK CMD curl --fail http://localhost:80/ || exit 1

# Define the command to run the application
 ["CMDbash", "run.sh"]
