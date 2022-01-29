# Yes/No の確認
checkYesNo() {
  read YES_NO
  case "$YES_NO" in
    [Yy])
      ;;
    [Nn])
      exit
      ;;
    *)
      checkYesNo
  esac
}

# Git コマンドが使えるか確認する
git > /dev/null 2>&1

# Git コマンドの結果を判定する
if [ $? -ne 1 ]; then
  echo "ERROR: git コマンドが存在しません。インストールしてから実行してください。"
  exit 1
fi

# 全てのファイルをコミット対象にする
git add .

# 変更したファイル数を取得する
DIFF_FILES=$(git diff --cached --numstat | wc -l)

# 変更したファイルがあればコミットする
if [ $DIFF_FILES -ne 0 ]; then
  # コミットメッセージを入力する
  echo "コミットメッセージ(変更を簡単に説明する): \c"
  while [ -z $COMMIT_MESSAGE ]; do
    read COMMIT_MESSAGE
  done

  # コミットメッセージの確認
  echo "コミットメッセージは '$COMMIT_MESSAGE' でよろしいですか？ [y/N]: \c"
  checkYesNo

  # コミットする
  echo
  git commit -m "$COMMIT_MESSAGE"
  echo
fi

# プッシュするかの確認
echo "プッシュ(GitHubに反映)しますか？ [y/N]: \c"
checkYesNo

# GitHub の変更をプルしてくる
echo
git pull --rebase
echo

# プッシュする
echo
git push
echo
