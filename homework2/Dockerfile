FROM ruby:3.1.2-alpine3.16
RUN apk --update add build-base postgresql-dev
WORKDIR /app
COPY Gemfile* ./
RUN bundle install --jobs "$(nproc)"
COPY . .
EXPOSE 8000
CMD ["bundle", "exec", "puma"]