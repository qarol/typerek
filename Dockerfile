FROM ruby:2.7.6
RUN apt-get -q update && \
    apt-get -y install build-essential nodejs && \
    gem install bundler
WORKDIR /typerek
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
EXPOSE 3000
CMD rails s -b 0.0.0.0

