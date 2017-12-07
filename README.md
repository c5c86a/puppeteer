The goals here are to:

1. use puppeteer through docker-compose 1.9.0
2. use puppeteer through ubuntu 16.04

Usage:

docker-compose up -d
docker-compose exec puppeteer npm start 

Contributions:

Feel free to open issues at github with details, what you expected and what happened.

To build the image, edit the file Dockerfile. To test the image, edit the file .travis.yml and make sure that docker hub has finished. You should avoid modifying both files at the same commit.
