#!/bin/bash

# Create administrator account
sudo nextcloud.manual-install <admin_username> <admin_password>
# Configure trusted domains (only localhost by default)
sudo nextcloud.occ config:system:get trusted_domains
sudo nextcloud.occ config:system:set trusted_domains 1 --value=<dns-domain>
# Set 512M as PHP memory limit 
sudo snap get nextcloud php.memory-limit # Should be 512M
sudo snap set nextcloud php.memory-limit=512M
# Set background jobs interval (e.g. checking for new emails, update RSS feeds, ...)
sudo snap set nextcloud nextcloud.cron-interval=10m # Default: 15m
