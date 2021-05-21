FROM ruby:2.6.7
#RUN apt-get -q update && apt-get -y install git make gcc
WORKDIR /typerek
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
EXPOSE 3000
CMD rails s -b 0.0.0.0

