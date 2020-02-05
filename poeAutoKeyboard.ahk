#Include %A_ScriptDir%\lib\JSON.ahk
; �����ܼơA�����]�w�ɰѼ�
global settingConfig := 

;  Win + Z : ���հO���ɰѼ�Ū��
#Z::   
    ; ���X�]�w�� : keyboard����
    for index, element in settingConfig.keyboard
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
        Menu, bdMenu, Add, %A_LoopFileName%, getSettingConfig
    }
    ; ���ͦ���m : �ƹ��ثe��m
    MouseGetPos,MX,MY
    Menu, bdMenu, Show, % MX, % MY
    return
return  


; ���obuild�]�w�ɤ��e�A�Ȧs�ܥ����ܼ�settingConfig
getSettingConfig(fileName){
    ; ���obuild�]�w�ɸ��|
    filePath := getBuildPath(fileName)
    ; Ū��
    FileRead settingFile, %filePath%
    ; �NŪ����JSON�ɮפ��e�ରobj
    settingConfig := JSON.Load(settingFile)
    
    ; MsgBox choose setting config : %fileName%
}


; ���obuild�]�w�ɸ��|�A�w�]�bahk�ؿ��U��\build���|
getBuildPath(fileName=""){
    buildPath = %A_ScriptDir%\build\%fileName%
    return buildPath
}
