# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 言語設定
- 常に日本語で返答する

## 農業管理システム (FarmyAPI)

FarmyAPIは、Rails 8.0ベースの農業管理システムです。ユーザーが農場の圃場、作物品種、作業ログ、収穫、収支等を管理できるAPIを提供します。

### 主要なドメインモデル

- **User**: システムの基本ユーザー
- **FarmField**: 圃場情報（サイズ、場所、カテゴリ）
- **CropVariety**: 作物品種
- **WorkLog**: 作業記録
- **Harvest**: 収穫記録
- **GrainDrying**: 穀物乾燥記録
- **Threshing**: 脱穀記録
- **Income/Expense**: 収入・支出管理

### 技術スタック

- **Ruby**: Rails 8.0
- **データベース**: MySQL
- **キャッシュ**: Redis + Solid Cache
- **ジョブキュー**: Solid Queue + Sidekiq
- **リアルタイム通信**: Solid Cable
- **フロントエンド**: Turbo + Stimulus
- **テスト**: RSpec
- **リンター**: RuboCop (Rails Omakase)
- **デプロイ**: Kamal

### 開発コマンド

```bash
# サーバー起動
bundle exec rails server

# データベース操作
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed

# テスト実行
bundle exec rspec                 # 全テスト実行
bundle exec rspec spec/models/    # モデルテストのみ
bundle exec rspec spec/models/user_spec.rb  # 単一ファイルテスト

# リンター・コード品質チェック
bundle exec rubocop              # コードスタイルチェック
bundle exec brakeman             # セキュリティ脆弱性チェック

# アセット関連
bundle exec rails assets:precompile

# Sidekiqワーカー起動
bundle exec sidekiq

# バックグラウンドジョブ起動
bundle exec rails solid_queue:start
```

### 重要な設定ファイル

- `config/application.rb`: メインアプリケーション設定
- `config/routes.rb`: ルーティング定義
- `config/database.yml`: データベース設定
- `Gemfile`: 依存関係管理
- `.devcontainer/`: Dev Container設定

### データベーススキーマ

以下の主要テーブルが存在します：
- users (ユーザー管理)
- farm_fields (圃場管理)
- crop_varieties (作物品種管理)
- work_logs (作業記録)
- harvests (収穫記録)
- incomes/expenses (収支管理)

### 開発環境

- Dev Container使用
- VSCode + Ruby LSP推奨
- MySQL、Redis、Selenium自動設定
- ポート3000でRailsサーバー、3306でMySQLを転送

### 重要な開発ルール

- MVCアーキテクチャに従う
- Active Recordを使用したモデル設計
- 外部キー制約とインデックスを適切に設定
- 既存のコード規約とスタイルを維持
- セキュリティベストプラクティスに従う