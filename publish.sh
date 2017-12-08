#!/usr/bin/env bash

set -x

if [[ $TRAVIS_BRANCH == *"develop"* ]]; then
  docker-compose up -d
  sleep 3
  docker-compose ps
  docker-compose logs puppeteer
  docker-compose exec puppeteer npm list | grep puppeteer  
  docker-compose exec puppeteer npm start 
  ls screenshot.png
fi

if [[ $TRAVIS_BRANCH == "develop" ]]; then
  if [[ $DOCKER_VERSION == '17.03.0' && $DOCKER_COMPOSE_VERSION == '1.9.0' ]]; then
    docker login -u nicosmaris -p "$DOCKER_PASS"
    docker push $TAG
  fi
fi

if [[ $TRAVIS_BRANCH == *"master"* ]]; then
  docker-compose images
  docker-compose down
  docker-compose -f docker-compose.puppeteer.yml up -d
  sleep 3
  docker-compose images
  docker-compose exec puppeteer npm start 
  ls screenshot.png
fi

