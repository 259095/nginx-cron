FROM nginx:latest
RUN apt-get update && apt-get install -y cron curl jq

COPY hello-cron /etc/cron.d/hello-cron
RUN chmod 0644 /etc/cron.d/hello-cron
RUN crontab /etc/cron.d/hello-cron
RUN touch /var/log/cron.log
CMD cron && tail -f /var/log/cron.log