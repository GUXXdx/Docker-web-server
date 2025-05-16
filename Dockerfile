FROM ubuntu:latest

# Update/upgrade
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y software-properties-common

# Add the PPA repository
RUN add-apt-repository ppa:ondrej/php

# Install apache2
RUN apt install -y apache2

# Install php
RUN apt install -y php8.3 php8.3-cli php8.3-bz2 php8.3-curl php8.3-mbstring php8.3-intl php8.3-pgsql
RUN apt install -y libapache2-mod-php8.2
RUN apt install -y php8.3-fpm
RUN a2enconf php8.3-fpm

# Install Node.js
RUN apt install -y nodejs

# https certif
RUN apt install certbot
RUN apt install python3-certbot-apache


CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]