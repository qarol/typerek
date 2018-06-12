FROM ruby:2.3.7
#RUN apt-get -q update && apt-get -y install git make gcc
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
RUN rake db:schema:load
EXPOSE 3000
CMD rails s -b 0.0.0.0

