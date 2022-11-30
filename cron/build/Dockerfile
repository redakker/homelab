FROM ubuntu

# Install Cron
RUN apt-get update
RUN apt-get -y install cron curl

CMD ["cron", "-f"]