FROM ruby:3.1.1

MAINTAINER Maxim Zelenkin <nudepatch@gmail.com>

RUN apt update -q && apt install -y \
    build-essential \
    libpq-dev \
    nano > /dev/null

ENV APP_PATH /app
RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH

ENV BUNDLE_PATH /bundle
ENV GEM_HOME /bundle
ENV PATH="/bundle/bin:${PATH}"

RUN printf '\
alias be="bundle exec" \n\
alias rc="bundle exec rails console" \n\
alias rg="bundle exec rails generate" \n\
alias credit="bundle exec rails credentials:edit -e development" \n\
' >> ~/.bashrc

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
