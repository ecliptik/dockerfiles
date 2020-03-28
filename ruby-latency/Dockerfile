FROM ruby:2.6-slim
LABEL maintainer="Micheal Waltz <dockerfiles@accounts.ecliptik.com>"

WORKDIR /app
COPY . .

RUN bundle install --standalone

EXPOSE 4567

ENTRYPOINT [ "bundle" ]
CMD [ "exec", "rackup", "config.ru", "-p", "9292", "--host", "0.0.0.0" ]
