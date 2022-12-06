FROM ubuntu

# Install Cron
RUN apt-get update
RUN apt-get -y install cron curl wget
RUN mkdir /out

CMD ["cron", "-f"]