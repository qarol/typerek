FROM ruby:3.0.3
WORKDIR /typerek
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
EXPOSE 3000
CMD ./bin/dev
