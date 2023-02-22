FROM ruby:3.2.1

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Install Yarn
RUN apt-get update && apt-get install -y curl gnupg
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

RUN mkdir /farmstream
WORKDIR /farmstream

COPY Gemfile /farmstream/Gemfile
COPY Gemfile.lock /farmstream/Gemfile.lock

RUN yarn install

RUN bundle install

COPY . /farmstream
