FROM alpine:edge
LABEL Maintainer_Name="Tom Wizda"
LABEL Maintainer_Email="twizda@mirantis.com"
LABEL BuildDate="27 February 2024"

# Environment variables
# Override these with a .env file or passing them into your Docker builld
#ENV LAUNCHPAD_VERSION="1.5.6-alpha1"

# Copy in our source binaries
RUN mkdir /usr/local/launchpad
COPY releases/ /usr/local/launchpad
COPY releases/motd /etc/motd

CMD ["/bin/sh", "-c", "/bin/cat /etc/motd" ]