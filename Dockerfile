FROM ubuntu:16.04

MAINTAINER Nicos Maris <nicosmaris@>

ARG COMMIT
ENV COMMIT ${COMMIT:-master}
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y curl && \
curl -sL https://deb.nodesource.com/setup_8.x | bash -  && \
apt-get install -y nodejs  && \
nodejs -v  && \
npm -v

# Install latest chrome dev package
# Note: this also installs the necessary libs so we don't need the dependencies
RUN apt-get update && apt-get install -y wget --no-install-recommends \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-unstable \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge --auto-remove -y curl \
    && rm -rf /src/*.deb

WORKDIR app

# Add pptr user.
RUN groupadd -r pptruser && useradd -r -g pptruser -G audio,video pptruser \
    && mkdir -p /home/pptruser/Downloads \
    && chown -R pptruser:pptruser /home/pptruser \
    && chown -R pptruser:pptruser /app

# Run user as non privileged.
USER pptruser

# Uncomment to skip the chromium download when installing puppeteer.
# ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

COPY package.json ./
RUN cd /tmp \
    && npm install  \
    && cd - \
    && ln -s /tmp/node_modules

CMD ["tail", "-F", "container.log"]
