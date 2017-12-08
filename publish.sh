#!/usr/bin/env bash

if [[ $TRAVIS_BRANCH == 'master' && $DOCKER_VERSION == '17.03.0' && $DOCKER_COMPOSE_VERSION == '1.9.0' ]]; then
  docker login -u nicosmaris -p "$DOCKER_PASS"
  docker push $TAG

  docker-compose images
  docker-compose down

  cat > docker-compose.yml << EOL
version: '2'
services:
  puppeteer:
    image: $TAG
    user: $USER
    cap_add:
      - SYS_ADMIN
    shm_size: 512M
    cpuset: 0-1
    volumes:
      - .:/app
    tty: true
    stdin_open: true
EOL
  docker-compose up -d
  sleep 3
  docker-compose images
  docker-compose exec puppeteer npm start 
  ls screenshot.png
fi

