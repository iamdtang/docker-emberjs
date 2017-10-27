FROM node:6.11.5-stretch
LABEL maintainer="John Costanzo"

# Environment variables
ENV EMBER_VERSION=2.16.0

COPY ./docker/entrypoint.sh /entrypoint.sh

RUN apt-get update -y && \
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
  google-chrome-stable \
	--no-install-recommends && \
  sed -i 's/"$@"/--no-sandbox "$@"/g' /opt/google/chrome/google-chrome && \
  yarn global add ember-cli@$EMBER_VERSION && \
  chmod +x /entrypoint.sh && \
  apt-get remove -y \
  curl \
  git && \
  rm -rf /var/lib/apt/lists/*


EXPOSE 4200 49153 5779

WORKDIR /app

CMD ["/entrypoint.sh"]