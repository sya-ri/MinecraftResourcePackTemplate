# MinecraftResourcePackTemplate

## 👀 原理

最適化のために [PackSquash-action](https://github.com/ComunidadAylas/PackSquash-action) を使用しています。

このソフトウェアはリソースパックに対して

- モデルデータ(`.json`) 内の不要な記述を削除
- 画像データ(`.png`) や 音声データ(`.ogg`) を非劣化圧縮
- 不要なファイルを削除

することにより軽量化を行います。

## ⚙ セットアップ

1. `Use This Template` を押してリポジトリの設定を入力します。
2. `Repository name` に好きなプロジェクト名を入力してください。
3. `Description` にプロジェクトの説明を書いてください。
4. 公開しても良ければ `Public` を選択し、非公開にしたければ `Private` を選択してください。
5. `Create repository from template` を押してリポジトリを作成してください。

## ❗ 前提環境

### Git

- [Windows での手順](https://qiita.com/elu_jaune/items/280b4773a3a66c7956fe)
- [Mac での手順](https://qiita.com/suke_masa/items/4bed855628f7414293f8)

に従って、`git` コマンドを使えるようにしてください。

## 📖 使い方

### 1. リポジトリをクローンする

ただ、ダウンロードするだけでは使うことができません。`Git` の機能の一つであるクローンを使ってダウンロードしてくる必要があります。

```shell
git clone https://github.com/あなたのユーザー名/リポジトリ名
```

というコマンドをクローンしたいフォルダにいる状態で実行してください。

### 2. `pack` のリソースパックに変更を加える
それ以外の場所にファイルを置いても、リソースパックには反映されません。

### 3. `apply.bat` / `apply.sh` を起動する

#### エラー: Git コマンドが見つからない

```
ERROR: git コマンドが存在しません。インストールしてから実行してください。
```

以上のエラーが表示された場合、`git` コマンドが使えない状態になっています。導入されていない・パスが通っていない可能性があるので、確認してください。

### 4. コミットメッセージを入力する

```
コミットメッセージ(変更を簡単に説明する):
```

加えた変更に対する説明を簡単に記述してください。

### 5. コミットメッセージの確認をする

```
コミットメッセージは '{3 で入力したコミットメッセージ}' でよろしいですか？ [y/N]: 
```

表示されたコミットメッセージで問題なければ `y` と入力してください。

### 6. GitHub へのプッシュ

```
プッシュ(GitHubに反映)しますか？ [y/N]: 
```

基本的に `y` と入力してください。連続で変更を加える場合のみ `N` と入力してください。

### 7. リソースパックのダウンロード

最新のリリースから `pack.zip` をダウンロードすることができます。

## 🔧 開発

### `pack` と Minecraft のリソースパックを連携する

#### Windows

1. `.minecraft` の中の `resourcepacks` のパスをメモしておく。
2. クローンしたフォルダの中の `pack` のパスをメモしておく。
3. `Win + S` を同時押しして `command` と入力。
4. 検索結果に出てきたコマンドプロンプトを右クリックして `管理者として実行` を押す。
5. `MKLINK /D <1でメモしたパス>\<好きな名前> <2でメモしたパス>` というコマンドを実行。(`<`, `>` を入力する必要はありません。)
6. `～～～のシンボリックリンクが作成されました` というメッセージが出たら成功。
7. マインクラフトでリソースパックを選択。

## ❓ サポート

### Optifine への対応

Optifine 向けに `.jpm` や `.jem` のファイルを含んでいる場合は、以下の設定を行わなければそれらのファイルが削除されてしまいます。

[.github/workflows/packsquash.yml](.github/workflows/packsquash.yml) の `allow_optifine_mod` オプションのコメントを外してください。

#### 変更前
```yml
          # allow_optifine_mod: true
```

#### 変更後
```yml
          allow_optifine_mod: true
```

### その他

何かわからないことがあれば、[@sya_ri_dayo](https://twitter.com/sya_ri_dayo) (Twitter) や [サポートサーバー](https://link.s7a.dev/discord) (Discord) にご連絡ください。
