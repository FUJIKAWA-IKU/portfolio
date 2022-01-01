# 日々是鍛錬 (にちにちこれたんれん)

## はじめに
予めゲストユーザーを作成していますので是非こちらでも使ってみてください  
email : guest@example<span>.com</span>  
password : guest  

## なぜ作ったか  
　私は現在スポーツジムで受付業務を行っています。業務を通して、自分の想像より多くのご年配のお客様がスポーツジムを足繁くご利用いただいていることに驚きました。そのことについて社員の方と話すと、社員の方から「**歳を重ねてできないことが増えると、何かできるようになることに対してより大きな喜びを感じる**」と聞きました。  
　高齢化社会が進み、身体的・精神的機能の向上が期待できる運動は今後ますます重要視され、その結果、幅広い年齢層の人々が運動を楽しく続けられるためのサービスの需要が高まることが予想されます。そのような社会的背景も含め、私は**幅広い世代の人々に運動することの楽しさを知ってもらい、できなかったことができるようになる喜びを感じてほしい**と思い、本サービスを作成しました。  


## 機能一覧
日々の運動習慣を記録できるアプリです  
1. 運動した時間や走行距離などをグラフで見ることができます  
2. つぶやき投稿・いいね機能で他に運動を頑張っている人たちと切磋琢磨できます  


## 使い方
マイページ中央にある左二つのアイコンから、それぞれランニングあるいは筋トレの運動記録を入力できます  
Runnningアイコン：走行時間・走行距離を記録できます  
Workoutアイコン：筋トレした時間・部位を記録できます  

![output](https://user-images.githubusercontent.com/81734783/144445451-70356536-4b62-4fd3-9a46-c0da29cc527b.gif)  

テストユーザーの使用例  

![screenshot](https://user-images.githubusercontent.com/81734783/144441499-e1157da7-cc10-4243-8dff-85cab62dfe66.png)  


## こだわり
1. 今回は一人でアプリを開発しましたが、今後複数人でアプリを開発する場合もあることを想定し、マシン間で同一の開発環境が手軽に構築できるなど様々なメリットを持つ**Docker**を学習し、本アプリに導入しました。

2. 作業の効率化を図るため、CI/CDサービスを導入しました。CI/CDサービスの中でも、昨今特に注目を集めている**CircleCI**を選択し、GitHubのリポジトリにpushする度にRSpecとRubocopが自動テストされるように設計しています。

3. 幅広い年齢層の方に使って欲しいため、メイン機能である運動習慣を記録するための操作は、**アイコンを大きくする・イラストを使用する**ことで直感的に分かりやすいデザインにしました。


## ER図
![erd-1](https://user-images.githubusercontent.com/81734783/144443246-2675c53a-8474-4ce0-ba4d-7b08e5484404.png)


## 使用したgem (一部抜粋)
* chart.js (グラフの描画)
* gon (RailsとJavascriptの連携)
* kaminari (ページネーション)
* rspec-rails (テスト)
* capybara (UIテスト用のフレームワーク)
* factory_bot_rails (テスト用のサンプルデータ作成)
* rubocop (コード解析)
* launchy (デバック)
* pry-rails (デバック)  

  
## 使用した技術
* サーバーサイド言語：Ruby
* データベース：PostgreSQL
* インフラ：AWS, Docker&docker-compose, CircleCI
* ソース管理：Git
* フロント：HTML, CSS, JS
* テストフレームワーク：RSpec  


## その他
知識のアウトプットの場として、ほぼ毎日Qiitaに記事を挙げていますので一度ご覧いただけると嬉しいです  
https://qiita.com/i-f
