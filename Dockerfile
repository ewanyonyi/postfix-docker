FROM alpine:latest

# Accept domain name as an environment variable
ARG DOMAIN_NAME
ENV DOMAIN_NAME ${DOMAIN_NAME}

# Install Postfix
RUN apk update && \
    apk add postfix && \
    rm -rf /var/cache/apk/*

# Configure Postfix
COPY main.cf /etc/postfix/main.cf
COPY master.cf /etc/postfix/master.cf

# Set the domain name in main.cf
RUN sed -i "s/myhostname =.*/myhostname = \$DOMAIN_NAME/" /etc/postfix/main.cf

# Create required directories
RUN mkdir -p /var/spool/postfix /var/mail /var/run/rsyslog

# Expose SMTP port
EXPOSE 25

# Start Postfix
CMD ["sh", "-c", "postfix start-fg"]

