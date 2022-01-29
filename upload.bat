@echo off
setlocal ENABLEDELAYEDEXPANSION

@rem Git コマンドが使えるか確認する
git > nul 2>&1

@rem Git コマンドの結果を判定する
if %errorlevel% neq 1 (
  echo ERROR: git コマンドが存在しません。インストールしてから実行してください。
  exit /b 1
)

@rem 全てのファイルをコミット対象にする
git add .

@rem 変更したファイル数を取得する
set DIFF_FILES=0
for /f "usebackq" %%A in (`git diff --cached --numstat`) do (
  set /a DIFF_FILES += 1
)

@rem 変更したファイルなければコミット処理を省略する
if %DIFF_FILES% equ 0 goto :RUN_PUSH

@rem コミットメッセージを入力する
:ENTER_COMMIT_MESSAGE
set /P COMMIT_MESSAGE="コミットメッセージ(変更を簡単に説明する): "
if ["%COMMIT_MESSAGE%"]==[] goto :ENTER_COMMIT_MESSAGE

@rem コミットメッセージの確認
set /P YES_NO="コミットメッセージは '%COMMIT_MESSAGE%' でよろしいですか？ [y/N]: "
if /I not %YES_NO%==y exit /b

@rem コミットする
echo;
git commit -m "%COMMIT_MESSAGE%"
echo;

:RUN_PUSH

@rem プッシュするかの確認
set /P YES_NO="プッシュ(GitHubに反映)しますか？ [y/N]: "
if /I not %YES_NO%==y exit /b

@rem GitHub の変更をプルしてくる
echo;
git pull --rebase
echo;

@rem プッシュする
echo;
git push
echo;