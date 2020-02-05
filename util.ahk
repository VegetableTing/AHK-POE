#Include %A_ScriptDir%\lib\JSON.ahk
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

testBuildConfig(){
 ; ���X�]�w�� : keyboard����
    for index, element in buildConfig.keyboard
    {   
        Send % element.key
        MsgBox % "Element index " . index . " is " . element.time
    }
    return 
}


openMenu(){
    CoordMode, Menu, Screen
    CoordMode, Mouse, Screen
    ; ���obuild�]�w�ɸ��|
    sourceFolder := getBuildPath()
    ; ���Xbuild�ؿ��U�Ҧ��]�w�ɦW��
    Loop , %sourceFolder%\*.* 
    {
        ; �إ߿��
        tempFileName := StrReplace(A_LoopFileName, "."A_LoopFileExt ,"")
        Menu, bdMenu, Add, %tempFileName%, getBuildConfig
    }
    ; ���ͦ���m : �ƹ��ثe��m
    MouseGetPos,MX,MY
    Menu, bdMenu, Show, % MX, % MY
    return
}



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
    if(fileName = ""){
        ; ����J�ɮצW�١A���oBuild�]�w�ɥؿ�
        buildPath = %A_ScriptDir%\build\
    } else {
        ; ���ɮצW�١A�ɤW���ɦWJson 
        buildPath = %A_ScriptDir%\build\%fileName%.json
    }
    return buildPath
}
