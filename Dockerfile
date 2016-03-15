FROM alpine:edge
MAINTAINER faye.salwin@opower.com

RUN apk --update add \
  ca-certificates \
  ruby \
  build-base \
  ruby-io-console \
  ruby-bundler \
  ruby-dev && \
  rm -fr /usr/share/ri
RUN echo 'gem: --no-document' > /.gemrc
COPY files/Gemfile* /
RUN bundle install
COPY files/config.ru /
CMD ["thin","start","-R","config.ru","-p","80"]
EXPOSE 80
