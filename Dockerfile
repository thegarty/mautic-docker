FROM mautic/mautic:v4-apache

# Install PHP CLI for Mautic background tasks
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get install -y php7.4-cli

# Copy startup script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
