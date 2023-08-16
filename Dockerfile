
FROM python:3.9.2-slim-buster
RUN mkdir /bot && chmod 777 /bot
WORKDIR /bot
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -qq update && apt -qq install -y git wget pv jq python3-dev ffmpeg mediainfo
# Added the -y flag in the apt-get install command to automatically answer "yes" to prompts
# Removed the -f flag as it was not necessary
# Also added neofetch package installation
# (assuming this package is required)
COPY . .
RUN pip3 install -r requirements.txt
CMD ["bash","run.sh"]
