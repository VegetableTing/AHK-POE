#Include %A_ScriptDir%\lib\JSON.ahk
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

testBuildConfig(){
 ; 走訪設定檔 : keyboard部分
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
    ; 取得build設定檔路徑
    sourceFolder := getBuildPath()
    ; 走訪build目錄下所有設定檔名稱
    Loop , %sourceFolder%\*.* 
    {
        ; 建立選單
        tempFileName := StrReplace(A_LoopFileName, "."A_LoopFileExt ,"")
        Menu, bdMenu, Add, %tempFileName%, getBuildConfig
    }
    ; 選單生成位置 : 滑鼠目前位置
    MouseGetPos,MX,MY
    Menu, bdMenu, Show, % MX, % MY
    return
}



; 取得build設定檔內容，暫存至全域變數settingConfig
getBuildConfig(fileName){
    ; 取得build設定檔路徑
    filePath := getBuildPath(fileName)
    ; 讀檔
    FileRead settingFile, %filePath%
    ; 將讀取的JSON檔案內容轉為obj
    buildConfig := JSON.Load(settingFile)
    ; 紀錄目前設定檔名稱至setting.ini
    IniWrite, %fileName%, %iniName%, AutoKeyboard, build
    ; MsgBox choose setting config : %fileName%
}



; 取得build設定檔路徑，預設在ahk目錄下的\build路徑
getBuildPath(fileName=""){
    if(fileName = ""){
        ; 未輸入檔案名稱，取得Build設定檔目錄
        buildPath = %A_ScriptDir%\build\
    } else {
        ; 有檔案名稱，補上副檔名Json 
        buildPath = %A_ScriptDir%\build\%fileName%.json
    }
    return buildPath
}
