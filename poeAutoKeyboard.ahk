#Include %A_ScriptDir%\lib\poeAutoKeyboardUtil.ahk
; �����ܼơA�����]�w�ɰѼ�
global buildConfig := 
global iniName := "setting.ini"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; �Ұʮɦ۰�Ū���W���]�w��setting.ini
IniRead, buildName, %iniName%, AutoKeyboard, build
getBuildConfig(buildName)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#Z:: testBuildConfig()          ;  Win + Z : ���հO���ɰѼ�Ū��
#Q:: openMenu()                 ; Win + Q : �}�ҿ��

