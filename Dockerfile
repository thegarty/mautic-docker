# Use official Mautic image with Apache
FROM mautic/mautic:v4-apache

# Install PHP CLI (required for console commands like mautic:import)
RUN apt-get update && apt-get install -y php7.4-cli

# Copy custom startup script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Use our script as the container's entrypoint
CMD ["/entrypoint.sh"]
