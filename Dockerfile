FROM ruby:3.2.1

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /farmstream

WORKDIR /farmstream

COPY Gemfile /farmstream/Gemfile
COPY Gemfile.lock /farmstream/Gemfile.lock

RUN bundle install

COPY . /farmstream
