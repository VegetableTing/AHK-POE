#Include %A_ScriptDir%\lib\JSON.ahk
; �����ܼơA�����]�w�ɰѼ�
global buildConfig := 
global iniName := "setting.ini"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; �Ұʮɦ۰�Ū���W���]�w��setting.ini
IniRead, buildName, %iniName%, AutoKeyboard, build
getBuildConfig(buildName)
; MsgBox, The value is %OutputVar%



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;  Win + Z : ���հO���ɰѼ�Ū��
#Z::   
    ; ���X�]�w�� : keyboard����
    for index, element in buildConfig.keyboard
    {   
        Send % element.key
        ; MsgBox % "Element index " . index . " is " . element.time
    }
return 


; Win + Q : �}�ҿ��
#Q::    
    CoordMode, Menu, Screen
    CoordMode, Mouse, Screen
    ; ���obuild�]�w�ɸ��|
    sourceFolder := getBuildPath()
    ; ���Xbuild�ؿ��U�Ҧ��]�w�ɦW��
    Loop , %sourceFolder%\*.* 
    {
        ; �إ߿��
        Menu, bdMenu, Add, %A_LoopFileName%, getBuildConfig
    }
    ; ���ͦ���m : �ƹ��ثe��m
    MouseGetPos,MX,MY
    Menu, bdMenu, Show, % MX, % MY
    return
return  


; ���obuild�]�w�ɤ��e�A�Ȧs�ܥ����ܼ�settingConfig
getBuildConfig(fileName){
    ; ���obuild�]�w�ɸ��|
    filePath := getBuildPath(fileName)
    ; Ū��
    FileRead settingFile, %filePath%
    ; �NŪ����JSON�ɮפ��e�ରobj
    buildConfig := JSON.Load(settingFile)
    ; �����ثe�]�w�ɦW�٦�setting.ini
    IniWrite, %fileName%, %iniName%, AutoKeyboard, build
    ; MsgBox choose setting config : %fileName%
}


; ���obuild�]�w�ɸ��|�A�w�]�bahk�ؿ��U��\build���|
getBuildPath(fileName=""){
    buildPath = %A_ScriptDir%\build\%fileName%
    return buildPath
}
