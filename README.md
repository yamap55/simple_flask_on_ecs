# simple_flask_on_ecs

本リポジトリはシンプルな Flask アプリケーションを ECS で動作させるためのリポジトリです

## 環境詳細

- Python : 3.11
- Flask
- Gunicorn
- コンテナリポジトリ
  - GitHub Packages
  - https://github.com/yamap55/simple_flask_on_ecs/pkgs/container/simple_flask_on_ecs

### 開発手順

1. VS Code 起動
2. 左下のアイコンクリック
3. 「Dev Containers: Reopen in Container」クリック
4. しばらく待つ
   - 初回の場合コンテナー image の取得や作成が行われる
5. 起動したら開発可能

## コンテナイメージ直接起動

```bash
docker run --rm -p 8000:8000 -d ghcr.io/yamap55/simple_flask_on_ecs:latest
```

※gunicorn 経由で Flask のアプリケーションが起動される

## ローカル環境で flask を起動

```bash
cd /project/api/
flask run
```

※ローカル環境では gunicorn は使用しない前提なのでインストールされていません
