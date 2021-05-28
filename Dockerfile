FROM ubuntu:18.04

ARG RUNNER_VERSION="2.278.0"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get upgrade -y && useradd -m docker
RUN apt-get install -y apt-transport-https curl jq build-essential libssl-dev libffi-dev python3 python3-venv python3-dev unzip
RUN apt -y install software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y php7.4 php7.4-cli php7.4-json php7.4-curl php7.4-zip php7.4-xml

RUN curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar -o /phpcs.phar && \
  mv /phpcs.phar /usr/bin/phpcs && \
  chmod +x /usr/bin/phpcs

RUN cd /home/docker && mkdir actions-runner && cd actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

RUN chown -R docker ~docker && /home/docker/actions-runner/bin/installdependencies.sh
COPY start.sh start.sh
RUN chmod +x start.sh
USER docker
ENTRYPOINT ["./start.sh"]