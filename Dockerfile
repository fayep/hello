FROM debian:jessie
MAINTAINER faye.salwin@opower.com

RUN apt-get update && apt-get install -y \
  ca-certificates \
  ruby \
  build-essential \
  ruby-dev && \
  rm -fr /var/lib/apt/lists/* && \
  rm -fr /usr/share/ri
RUN echo 'gem: --no-document' > /.gemrc
RUN gem install bundler
COPY files/Gemfile* /
RUN bundle install
COPY files/config.ru /
CMD ["thin","start","-R","config.ru","-p","80"]
EXPOSE 80
