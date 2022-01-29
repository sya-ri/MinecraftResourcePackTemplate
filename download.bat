@echo off
setlocal ENABLEDELAYEDEXPANSION

@rem Git �R�}���h���g���邩�m�F����
git > nul 2>&1

@rem Git �R�}���h�̌��ʂ𔻒肷��
if %errorlevel% neq 1 (
  echo ERROR: git �R�}���h�����݂��܂���B�C���X�g�[�����Ă�����s���Ă��������B
  exit /b 1
)

@rem GitHub �̕ύX���v�����Ă���
echo;
git pull --rebase
echo;
