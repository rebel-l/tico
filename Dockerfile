# TiCo
#
# VERSION 2.1.0

FROM ubuntu:16.04
MAINTAINER Rebel L <dj@rebel-l.net>

LABEL vendor="Rebel L" \
      version="2.1.0" \
      description="This image provides the TicketConverter called TiCo for printing Jira tickets on DIN A6 paper."

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    nginx
EXPOSE 80

COPY ./scripts/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 755 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
