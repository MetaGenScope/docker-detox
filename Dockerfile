#
# NOTE: THIS DOCKERFILE IS BASED ON OFFICIAL PYTHON IMAGE
#       https://github.com/docker-library/python/blob/master/3.6/jessie/slim/Dockerfile
#

FROM python:3.6-slim-jessie

# Update PATH
ENV PATH /root/.pyenv/bin:$PATH

# Install apt dependencies
RUN set -ex \
	&& buildDeps=" \
        git \
		dpkg-dev \
		gcc \
		libbz2-dev \
		libc6-dev \
		libexpat1-dev \
		libffi-dev \
		libgdbm-dev \
		liblzma-dev \
		libncursesw5-dev \
		libreadline-dev \
		libsqlite3-dev \
		libssl-dev \
		make \
		tcl-dev \
		tk-dev \
		wget \
		xz-utils \
		zlib1g-dev \
	" \
    && apt-get update && apt-get install -y $buildDeps --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Install pyenv
RUN wget -O - https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash \
    && eval "$(pyenv init -)" \
    && eval "$(pyenv virtualenv-init -)"

# Install Python versions
RUN pyenv install 2.6.9 \
    && pyenv install 2.7.10 \
    && pyenv install 3.2.6 \
    && pyenv install 3.3.6 \
    && pyenv install 3.4.3 \
    && pyenv global 2.6.9 2.7.10 3.2.6 3.3.6 3.4.3

# Install detox
RUN pip install detox
