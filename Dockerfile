FROM node:6.11.5-stretch
LABEL maintainer="John Costanzo"

# Environment variables
ENV EMBER_VERSION=2.16.0 APP_DIR=/app

COPY entrypoint.sh /entrypoint.sh

RUN useradd -ms /bin/bash ember && \
  mkdir /app && \
  chown -R ember /app && \
  chmod -R 750 /app && \
  apt-get update -y && \
  apt-get install -y --no-install-recommends \
  python-dev \
  curl \
  git \
  apt-transport-https \
  gnupg && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
	echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
  apt-get update && \
  git clone https://github.com/facebook/watchman.git && \
	cd watchman && \
	git checkout v4.7.0 && \
	./autogen.sh && \
	./configure && \
	make && \
	make install && \
  mkdir /tmp/phantomjs && \
	curl -L https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 | tar -xvj -C /tmp/phantomjs --strip-components=1 phantomjs-2.1.1-linux-x86_64/bin && \
	mv /tmp/phantomjs/bin/phantomjs /usr/bin && \
	rm -rf /tmp/phantomjs && \
  apt-get install -y --no-install-recommends \
  yarn \
  google-chrome-stable && \
  yarn global add ember-cli@$EMBER_VERSION && \
  apt-get remove -y \
  curl \
  git && \
  sed -i 's/"$@"/--no-sandbox --disable-setuid-sandbox "$@"/g' /opt/google/chrome/google-chrome && \
  rm -rf /var/lib/apt/lists/* && \
  rm -Rf /tmp/* && \
  rm -Rf /usr/local/share/.cache/* ** \
  rm -Rf /usr/share/icons/*

EXPOSE 4200 7020 7357

WORKDIR /app

CMD ["/entrypoint.sh"]
