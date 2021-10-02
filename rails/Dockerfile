FROM ruby:2.6.6

RUN apt-get update -qq && \
  apt-get install -y apt-utils \
  build-essential \
  libpq-dev \
  nodejs \
  vim \
  default-mysql-client \
  sudo  && \
  gem install bundler:2.0.1

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

ADD . /app
RUN mkdir -p tmp/sockets
RUN rm -r tmp/pids
RUN mkdir tmp/pids

EXPOSE 3000

ENV HOST 0.0.0.0

RUN chmod +x ./entrypoint.sh

CMD ["./rails/entrypoint.sh"]