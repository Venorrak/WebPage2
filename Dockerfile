FROM ubuntu:latest
COPY . /home/dev
WORKDIR /home/dev

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    git \
    ruby-full \
    mariadb-server \
    sudo \
    libcurl4-openssl-dev \
    libapr1-dev \
    libaprutil1-dev \
    apache2-dev \
    build-essential \
    libyaml-dev \
    libffi-dev \
    libssl-dev \
    zlib1g-dev \
    libmariadb-dev \
    libmariadb-dev-compat \
    pkg-config \
    ca-certificates \
    gnupg \
    tmux

# Install Node.js 22.x (LTS) from NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs

RUN npm install -g @angular/cli

RUN gem update && gem install bundler \
    rails 

RUN cd /home/dev/server && bundle install

RUN cd /home/dev/client && npm install

EXPOSE 80

# Keep the container running by using tail -f /dev/null
# or you can replace this with your actual web server command
CMD ["tail", "-f", "/dev/null"]
