FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y postgresql-client
# yarnパッケージ管理ツールをインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn
# Node.jsをインストール
RUN apt-get install -y nodejs npm && npm install n -g && n 10.17.0

WORKDIR /port
COPY Gemfile /port/Gemfile
COPY Gemfile.lock /port/Gemfile.lock
RUN gem install bundler
RUN bundle install
RUN gem install -v 6.1.4.1 rails
COPY . /port

# コンテナー起動時に毎回実行されるスクリプトを追加
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# イメージ実行時に起動させる主プロセスを設定
CMD ["rails", "server", "-b", "0.0.0.0"]