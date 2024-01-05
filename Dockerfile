FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  nodejs

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . ./

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
