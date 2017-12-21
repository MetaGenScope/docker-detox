#
# NOTE: THIS DOCKERFILE IS BASED ON OFFICIAL PYTHON IMAGE
#       https://github.com/docker-library/python/blob/master/3.6/jessie/Dockerfile
#

FROM python:3.6-jessie

# Install apt dependencies
RUN set -ex \
	&& buildDeps=" \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        llvm \
        libncurses5-dev \
        libncursesw5-dev \
        xz-utils \
        tk-dev \
	" \
    && apt-get update && apt-get install -y $buildDeps --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Create detox user
RUN useradd -ms /bin/bash detox
USER detox
WORKDIR /home/detox

# Update PATH
ENV PATH /home/detox/.pyenv/bin:$PATH

# Install pyenv
RUN wget -O - https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

ADD bootstrap_pyenv.sh /home/detox/.bootstrap_pyenv.sh

# Install Python versions
RUN sh /home/detox/.bootstrap_pyenv.sh \
    && pyenv install 2.6.9 \
    && pyenv install 2.7.10 \
    && pyenv install 3.2.6 \
    && pyenv install 3.3.6 \
    && pyenv install 3.4.3 \
    && pyenv global 2.6.9 2.7.10 3.2.6 3.3.6 3.4.3

# Install detox
RUN pip install detox --user
