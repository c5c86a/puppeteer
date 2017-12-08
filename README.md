[![Build Status](https://travis-ci.org/nicosmaris/puppeteer.svg?branch=master)](https://travis-ci.org/nicosmaris/puppeteer) [Images](https://hub.docker.com/r/nicosmaris/puppeteer/tags/)

The goals here are to use puppeteer through:

1. docker-compose
2. ubuntu 16.04

#### Usage

1. Make sure that the version of your docker and docker-compose at your ubuntu 16.04 is listed at .travis.yml
2. Download this repository and replace the file docker-compose.yml with the following content:

```
version: '2'
services:
  puppeteer:
    image: nicosmaris/puppeteer
    user: $USER
    cap_add:
      - SYS_ADMIN
    shm_size: 512M
    cpuset: 0-1
    volumes:
      - .:/app
    tty: true
    stdin_open: true
```

3. Run the following commands

```
docker-compose up -d
docker-compose exec puppeteer npm start 
```

#### Contributions

Feel free to open issues at github with details, what you expected and what happened.

To build the image, edit the file Dockerfile. To test the image, edit the file .travis.yml and make sure that docker hub has finished. You should avoid modifying both files at the same commit.
