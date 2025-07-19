# 稲作栽培・収支管理システム - FarmyAPI（バックエンドAPI）

このリポジトリは、稲作農家向けの生産・収支記録管理アプリ「Farmy」の **バックエンドAPI** を提供する Ruby on Rails プロジェクトです。

## 特長

- Rails 8.0 を使用した RESTful API
- 圃場、作物品種、作業記録、収穫、乾燥、脱穀、収支の各ドメインを管理
- Dev Container 環境により開発準備が容易

## 技術スタック

- **言語・フレームワーク**: Ruby / Rails 8.0
- **データベース**: MySQL
- **キャッシュ**: Redis + Solid Cache
- **ジョブキュー**: Solid Queue + Sidekiq
- **リアルタイム通信**: Solid Cable
- **フロントエンド連携**: Turbo + Stimulus
- **テスト**: RSpec
- **リンター**: RuboCop（Rails Omakase）
- **デプロイ**: Kamal

## ドメインモデル

- `User`: ユーザー情報
- `FarmField`: 圃場（田畑）情報
- `CropVariety`: 作物品種
- `WorkLog`: 作業記録
- `Harvest`: 収穫記録
- `GrainDrying`: 乾燥記録
- `Threshing`: 脱穀記録
- `Income`, `Expense`: 収入・支出記録

## セットアップ手順（Dev Container）

1. このリポジトリをクローン
   ```bash
   git clone https://github.com/your-user/farmy-api.git
   cd farmy-api
   ```

2. VS Code でフォルダを開き、「Dev Containers: Reopen in Container」を実行

3. 自動で依存パッケージがインストールされます

4. 初期化コマンドを実行
   ```bash
   bundle exec rails db:create
   bundle exec rails db:migrate
   bundle exec rails db:seed # 任意
   ```

## 開発コマンド一覧

```bash
# サーバー起動
bundle exec rails server

# データベース操作
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed

# テスト実行
bundle exec rspec
bundle exec rspec spec/models/
bundle exec rspec spec/models/user_spec.rb

# コードチェック
bundle exec rubocop
bundle exec brakeman

# アセットプリコンパイル
bundle exec rails assets:precompile

# バックグラウンドジョブ
bundle exec sidekiq
bundle exec rails solid_queue:start
```


## 開発環境

- Dev Container 使用
- VSCode + Ruby LSP 推奨
- MySQL、Redis、Selenium 自動設定

