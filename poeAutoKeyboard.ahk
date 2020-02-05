#Include %A_ScriptDir%\lib\poeAutoKeyboardUtil.ahk
; 全域變數，紀錄設定檔參數
global buildConfig := 
global iniName := "setting.ini"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 啟動時自動讀取上次設定檔setting.ini
IniRead, buildName, %iniName%, AutoKeyboard, build
getBuildConfig(buildName)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#Z:: testBuildConfig()          ;  Win + Z : 測試記錄檔參數讀取
#Q:: openMenu()                 ; Win + Q : 開啟選單

