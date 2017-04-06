# Source: https://nodejs.org/en/docs/guides/nodejs-docker-webapp/
FROM ubuntu:16.04

MAINTAINER Henry Carbajal <henry.carbajal@almundo.com>

# Setted fix to issue "debconf: unable to initialize frontend: Dialog"
# http://askubuntu.com/questions/506158/unable-to-initialize-frontend-dialog-when-using-ssh
ENV DEBIAN_FRONTEND noninteractive

# Create app directory
RUN mkdir -p /var/www/docker-mean-fullstack
WORKDIR /var/www/docker-mean-fullstack

# Install app dependencies
COPY package.json /var/www/docker-mean-fullstack/

# Update sources
RUN apt-get -y update

# Packages installations
RUN apt-get -y install \
    # Install NPM
    nodejs \
    # Install NPM
    npm \
    # To compile and install native addons from npm
    build-essential 

RUN npm install

# Bundle app source
COPY . /var/www/docker-mean-fullstack

EXPOSE 8080
CMD [ "npm", "start" ]