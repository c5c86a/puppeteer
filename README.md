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

The branching strategy is that:

1. branches that contain the word 'master' test how the image is used and are long lived
2. branches that contain the word develop test how the image is built and are short lived
3. the branch develop builds the image on travis and pushes it to hub.docker.com
4. there should be no other branch naming

