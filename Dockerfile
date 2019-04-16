FROM ruby:2.6.0
RUN apt-get update -qq && apt-get install -y build-essential nodejs

ENV APP_HOME /kafka-consumer-app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile /kafka-consumer-app/Gemfile
COPY Gemfile.lock /kafka-consumer-app/Gemfile.lock
RUN bundle install
COPY . /kafka-consumer-app

