FROM ruby:2.7.6 AS builder

ARG RAILS_ENV="production"
ENV RAILS_ENV=${RAILS_ENV}

WORKDIR /app

RUN apt-get -q update \
    && apt-get -y install build-essential nodejs \
    && curl -sSL https://deb.nodesource.com/setup_18.x | bash - \
    && curl -sSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo 'deb https://dl.yarnpkg.com/debian/ stable main' | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y --no-install-recommends nodejs yarn \
    && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man \
    && apt-get clean \
    && gem install bundle

COPY Gemfile* ./
RUN bundle install --jobs "$(nproc)" --retry 5

COPY . .

#RUN if [ "${RAILS_ENV}" != "development" ]; then \
#    SECRET_KEY_BASE=dummyvalue rake assets:precompile; fi

RUN SECRET_KEY_BASE=dummyvalue rake assets:precompile

CMD ["bash"]

FROM ruby:2.7.6 AS app

WORKDIR /app

ARG RAILS_ENV="production"
ARG UID=1000
ARG GID=1000

RUN apt-get -q update && \
    apt-get -y install build-essential nodejs && \
    gem install bundler && \
    apt-get clean && \
    groupadd -g ${GID} ruby && \
    useradd --create-home --no-log-init -u ${UID} -g ${GID} ruby && \
    chown ruby:ruby -R /app

USER ruby

COPY --chown=ruby:ruby --from=builder /usr/local/bundle /usr/local/bundle
COPY --chown=ruby:ruby --from=builder /app/public/assets public/assets
COPY --chown=ruby:ruby . .

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
