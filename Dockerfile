FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /port
COPY Gemfile /port/Gemfile
COPY Gemfile.lock /port/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /port

# コンテナー起動時に毎回実行されるスクリプトを追加
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# イメージ実行時に起動させる主プロセスを設定
CMD ["rails", "server", "-b", "0.0.0.0"]