FROM ruby:2.2
RUN mkdir /workspace
WORKDIR /workspace
ADD . /workspace
RUN bundle install --jobs 4
