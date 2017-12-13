[![Build Status](https://travis-ci.org/nicosmaris/puppeteer.svg?branch=master)](https://travis-ci.org/nicosmaris/puppeteer) [Images](https://hub.docker.com/r/nicosmaris/puppeteer/tags/)

The goals here are to use puppeteer through:

1. docker-compose
2. ubuntu 16.04

Nodejs 8 does not support debian 7 and puppeteer 0.13 does not support nodejs 4.

#### Usage

1. Make sure that your version have the following and at a set of versions listed at .travis.yml:

a. ubuntu
b. nodejs (or docker and docker-compose)
2. Download this repository, go to a folder under `examples` and run the following:

```
docker-compose -f docker-compose.puppeteer.yml up -d
docker-compose exec puppeteer npm start 
```

#### Contributions

Feel free to open issues at github with details, what you expected and what happened.

The branching strategy is that:

1. branches that contain the word 'master' test how the image is used and are long lived
2. branches that contain the word develop test how the image is built and are short lived
3. the branch develop builds the image on travis and pushes it to hub.docker.com
4. there should be no other branch naming

