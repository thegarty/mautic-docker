FROM mautic/mautic:v4-apache

# ✅ Install PHP CLI for cron jobs
RUN apt-get update && apt-get install -y php-cli

# ✅ Add startup script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# ✅ Use custom entrypoint for dynamic config tuning
CMD ["/entrypoint.sh"]
