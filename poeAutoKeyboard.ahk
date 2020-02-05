#Include %A_ScriptDir%\lib\JSON.ahk
; 全域變數，紀錄設定檔參數
global settingConfig := 

;  Win + Z : 測試記錄檔參數讀取
#Z::   
    ; 走訪設定檔 : keyboard部分
    for index, element in settingConfig.keyboard
    {   
        Send % element.key
        ; MsgBox % "Element index " . index . " is " . element.time
    }
return 


; Win + Q : 開啟選單
#Q::    
    CoordMode, Menu, Screen
    CoordMode, Mouse, Screen
    ; 取得build設定檔路徑
    sourceFolder := getBuildPath()
    ; 走訪build目錄下所有設定檔名稱
    Loop , %sourceFolder%\*.* 
    {
        ; 建立選單
        Menu, bdMenu, Add, %A_LoopFileName%, getSettingConfig
    }
    ; 選單生成位置 : 滑鼠目前位置
    MouseGetPos,MX,MY
    Menu, bdMenu, Show, % MX, % MY
    return
return  


; 取得build設定檔內容，暫存至全域變數settingConfig
getSettingConfig(fileName){
    ; 取得build設定檔路徑
    filePath := getBuildPath(fileName)
    ; 讀檔
    FileRead settingFile, %filePath%
    ; 將讀取的JSON檔案內容轉為obj
    settingConfig := JSON.Load(settingFile)
    
    ; MsgBox choose setting config : %fileName%
}


; 取得build設定檔路徑，預設在ahk目錄下的\build路徑
getBuildPath(fileName=""){
    buildPath = %A_ScriptDir%\build\%fileName%
    return buildPath
}
