FROM ruby:2.2.3

ENV GEM_HOME=/opt/gem
ENV BUNDLE_APP_CONFIG=/home/user/.bundle
RUN gem install --no-user-install bundler
ENV GEM_HOME=/home/user/.gem
ENV GEM_PATH=${GEM_HOME}:/opt/gem
ENV PATH=/opt/gem/bin:/home/user/.gem/bin:${PATH}

RUN apt-get update && apt-get install -y nodejs
