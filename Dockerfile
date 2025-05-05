FROM mautic/mautic:v4-apache

# Install PHP CLI for Mautic background tasks
RUN apt-get update && \
    apt-get install -y software-properties-common lsb-release apt-transport-https ca-certificates gnupg2 && \
    curl -fsSL https://packages.sury.org/php/apt.gpg | gpg --dearmor -o /usr/share/keyrings/php.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
    apt-get update && \
    apt-get install -y php7.4-cli

# Copy startup script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
