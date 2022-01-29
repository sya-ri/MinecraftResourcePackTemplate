# Git コマンドが使えるか確認する
git > /dev/null 2>&1

# Git コマンドの結果を判定する
if [ $? -ne 1 ]; then
  echo "ERROR: git コマンドが存在しません。インストールしてから実行してください。"
  exit 1
fi

# GitHub の変更をプルしてくる
echo
git pull --rebase
echo
