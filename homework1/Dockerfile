FROM ruby:3.1.2-alpine3.16
RUN apk --update add build-base
WORKDIR /app
COPY Gemfile* .
RUN bundle install --jobs "$(nproc)"
COPY . .
EXPOSE 8000
CMD ["rackup", "-o", "0.0.0.0", "-p", "8000"]