FROM node:8.11.2 as base

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/java-8-debian.list \
  && echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/java-8-debian.list \
  && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 \
  && apt-get -qq update \
  && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
  && apt-get install -y -qq oracle-java8-installer \
  && apt-get install -y -qq oracle-java8-set-default \
  && apt-get install -qq -y xvfb \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

FROM base

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
  && apt-get update -yqqq \
  && apt-get install -qq -y google-chrome-stable \
  && mv /usr/bin/google-chrome /usr/bin/google-chrome-orig \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

ADD google-chrome /usr/bin/google-chrome
RUN chmod +x /usr/bin/google-chrome