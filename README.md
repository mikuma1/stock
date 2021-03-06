# 名前
STOCK!

# 概要
会社、個人で使える消耗品の管理サイトです。

# URL
https://stock-app.work

# テストアカウント
### 組織アカウント
* name: 株式会社STOCK
* password: qqq111
### 管理者ユーザーアカウント
* email: admin@sample.com
* password: qqq111
### 使用者ユーザーアカウント
* email: not-admin@sample.com
* password: qqq111

# 機能一覧
* 組織
  * 登録、ログイン
* ユーザー
  * 登録、ログイン、編集、削除
  * 一覧
  * 管理者権限管理(Ajax)
* 消耗品
  * 登録、ログイン、編集、削除
  * 一覧、詳細
  * 在庫変更
  * 閲覧権限（cancanccan）
* 使用記録
  * 登録
* 入庫記録
  * 登録

# 実装予定の機能
  * 消耗品検索
  * 使用分析(組織全体、ユーザー毎)

# 目指した課題解決
前職で消耗品の管理を経験し、多くの時間、手間がかかると実感しました。
効率的な消耗品の管理ができるよう作成しました。
### 消耗品の在庫の可視化
全ての消耗品の在庫を目視で確認するのは手間と時間がかかるため、
計算上の在庫数を一覧で確認できるようにしました。
### 消耗品の管理場所の共有
消耗品がどこに保管されているのか単品毎にわかるようにしました。
### 発注の簡易化(一元管理)
単品毎に消耗品のURLを記載できるようにしました。


# 実装した機能についてのGIFと説明
* (管理者)消耗品一覧画面
<img src="https://user-images.githubusercontent.com/72071661/100399854-b6ccc480-3097-11eb-9eed-50d70739dc8b.png" width=50%>

* (使用者)消耗品一覧画面
<img src="https://user-images.githubusercontent.com/72071661/100399894-df54be80-3097-11eb-8616-16a9058b7173.png" width=50%>

* (管理者)ユーザー 一覧画面
<img src="https://user-images.githubusercontent.com/72071661/100399922-00b5aa80-3098-11eb-9944-88349f1a2d9c.png" width=50%>

# 工夫したポイント
* 権限機能を作成し、使用者は最低限の機能のみにしました。
* クリック数を減らすため、消耗品一覧画面で在庫補正、入庫記録、使用記録ができるように実装しました。
* 発注する手間をなくすため、１クリックで発注画面に遷移する仕様にしました。

# 使用技術
* フロントエンド
  * HTML/CSS
  * JavaScript
  * BootStrap
* バックエンド
  * Ruby 2.6.5
  * Rails 6.0.3
* バージョン管理
  * Git/Github
* 本番環境
  * AWS(EC2, VPC, RDS, Route53, ACM, ALB, S3)
* 開発環境
  * Docker/docker-compose
  * MySQL
* テスト
  * RSpec
  * RuboCop

# データベース設計
![ER図](https://user-images.githubusercontent.com/72071661/100399961-29d63b00-3098-11eb-9090-013350bb6ddd.png)