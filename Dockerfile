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
RUN apt-get purge `dpkg -l | grep php | awk '{print $2}' |tr "\n" " "` \
    && export LC_ALL=C.UTF-8 \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update && apt-get install -y \
        cups \
        fop \
        nginx \
        php5.6-cli \
        php5.6-fpm \
        php5.6-curl \
        php5.6-mbstring \
        php5.6-sqlite \
        php5.6-xsl \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs \
    && apt-get install -y build-essential \
    && npm -g install bower \
    && npm -g install gulp

#RUN wget -O /tmp/nodejs.tar.gz https://nodejs.org/dist/v4.4.3/node-v4.4.3-linux-x64.tar.gz \
#    && tar -C /tmp/ -xzf /tmp/nodejs.tar.gz \
#    && rm /tmp/nodejs.tar.gz \
#    && mv /tmp/node-v4.4.3-linux-x64 /opt/node \
#    && mkdir /opt/node/etc \
#    && echo 'prefix=/usr/local' > /opt/node/etc/npmrc \
#    && ln -s /opt/node/bin/node /usr/local/bin/node \
#    && ln -s /opt/node/bin/npm /usr/local/bin/npm \


EXPOSE 80

# install composer
RUN php -r "readfile('https://getcomposer.org/installer');" | php \
    && mv composer.phar /usr/local/bin/composer

COPY ./scripts/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 755 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
