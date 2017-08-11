# TiCo
#
# VERSION 2.1.0

FROM ubuntu:16.04
MAINTAINER Rebel L <dj@rebel-l.net>

LABEL vendor="Rebel L" \
      version="2.1.0" \
      description="This image provides the TicketConverter called TiCo for printing Jira tickets on DIN A6 paper."

# Prepare install of packages
RUN apt-get update \
    && apt-get install -y \
    curl \
    software-properties-common

# Install necessary packages
RUN apt-get purge `dpkg -l | grep php| awk '{print $2}' |tr "\n" " "` \
    && export LC_ALL=C.UTF-8 \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update && apt-get install -y \
        cups \
        fop \
        nginx \
        nodejs \
        npm \
        php5.6-cli \
        php5.6-fpm \
        php5.6-curl \
        php5.6-sqlite \
        php5.6-xsl
EXPOSE 80

# install composer
RUN php -r "readfile('https://getcomposer.org/installer');" | php \
    && mv composer.phar /usr/local/bin/composer

COPY ./scripts/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 755 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
