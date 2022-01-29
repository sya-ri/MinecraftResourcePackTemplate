@echo off
setlocal ENABLEDELAYEDEXPANSION

@rem Git �R�}���h���g���邩�m�F����
git > nul 2>&1

@rem Git �R�}���h�̌��ʂ𔻒肷��
if %errorlevel% neq 1 (
  echo ERROR: git �R�}���h�����݂��܂���B�C���X�g�[�����Ă�����s���Ă��������B
  exit /b 1
)

@rem �S�Ẵt�@�C�����R�~�b�g�Ώۂɂ���
git add .

@rem �ύX�����t�@�C�������擾����
set DIFF_FILES=0
for /f "usebackq" %%A in (`git diff --cached --numstat`) do (
  set /a DIFF_FILES += 1
)

@rem �ύX�����t�@�C���Ȃ���΃R�~�b�g�������ȗ�����
if %DIFF_FILES% equ 0 goto :RUN_PUSH

@rem �R�~�b�g���b�Z�[�W����͂���
:ENTER_COMMIT_MESSAGE
set /P COMMIT_MESSAGE="�R�~�b�g���b�Z�[�W(�ύX���ȒP�ɐ�������): "
if ["%COMMIT_MESSAGE%"]==[] goto :ENTER_COMMIT_MESSAGE

@rem �R�~�b�g���b�Z�[�W�̊m�F
set /P YES_NO="�R�~�b�g���b�Z�[�W�� '%COMMIT_MESSAGE%' �ł�낵���ł����H [y/N]: "
if /I not %YES_NO%==y exit /b

@rem �R�~�b�g����
echo;
git commit -m "%COMMIT_MESSAGE%"
echo;

:RUN_PUSH

@rem �v�b�V�����邩�̊m�F
set /P YES_NO="�v�b�V��(GitHub�ɔ��f)���܂����H [y/N]: "
if /I not %YES_NO%==y exit /b

@rem GitHub �̕ύX���v�����Ă���
echo;
git pull --rebase
echo;

@rem �v�b�V������
echo;
git push
echo;