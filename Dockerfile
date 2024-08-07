FROM alpine:edge
LABEL Maintainer_Name="Tom Wizda"
LABEL Maintainer_Email="twizda@mirantis.com"
LABEL BuildDate="05 August 2024"
LABEL BuildNum="20240805"

# Environment variables
# Override these with a .env file or passing them into your Docker builld
ENV LAUNCHPAD_VERSION="1.5.8"
ENV LAUNCHPAD_PLATFORM="x64_64"
ENV LAUNCHPAD_OS="Linux"

# Copy in our source binaries
RUN mkdir /usr/local/launchpad
COPY releases/ /usr/local/launchpad
COPY releases/motd /etc/motd

CMD ["/bin/sh", "-c", "/bin/cat /etc/motd" ]