#Include %A_ScriptDir%\lib\JSON.ahk

global settingConfig := 
; open build setting file
FileRead settingFile, %buildPath%\bv.json
; string to json 
settingJson := JSON.Load(settingFile)
; show json content
;  MsgBox % settingJson.name
   


; #Z::
; Loop, 1{
;     CoordMode, Menu, Screen
;     CoordMode, Mouse, Screen

;     fileName = bv
;     name = bv.json
;     ; MsgBox %bv%
;     Menu, bdMenu, Add, TEST1, % fileName
;     ; Menu, bdMenu, Add, TEST2, % showFile(name)

  
;     MouseGetPos,MX,MY
;     Menu, bdMenu, Show, % MX, % MY
;     return
    
;     bv():
;         Run % "https://www.google.com"
;     return
   
; }
; ; Return

#Z::
    MsgBox "press Win + Z"
    for index, element in settingConfig.drink ; Enumeration is the recommended approach in most cases.
    {
        Send % element.key
        ; MsgBox % "Element index " . index . " is " . element.time
    }
return 



; Win + Q : open menu
#Q::    
    ; select file folder
    ; FileSelectFolder , sourceFolder
    ; input box
    ; InputBox , extension 
    ; select file folder
    ; FileSelectFolder , targetFolder
    CoordMode, Menu, Screen
    CoordMode, Mouse, Screen
    ; get build setting file path
    sourceFolder := getBuildPath()
    Loop , %sourceFolder%\*.* 
    {
        fileList = %fileList%`r`n%A_LoopFileName%  
        ; showFile(A_LoopFileName)

        
        Menu, bdMenu, Add, %A_LoopFileName%, showFile
    }
    ; MsgBox %sourceFolder% : `r`n%fileList%
    MouseGetPos,MX,MY
    Menu, bdMenu, Show, % MX, % MY
    return
return  


; show json file content
showFile(fileName){
    filePath := getBuildPath(fileName)
    ; open build setting file
    FileRead settingFile, %filePath%
    ; string to json 
    settingConfig := JSON.Load(settingFile)
    
    ; MsgBox % getBuildPath(fileName)
    ; MsgBox % settingJson.name

    MsgBox choose setting config : %fileName%
}


getFile(fileName){
    filePath := getBuildPath(fileName)
    ; open build setting file
    FileRead settingFile, %filePath%
    ; string to json 
    settingJson := JSON.Load(settingFile)

    return settingJson
}


; get build setting file path
getBuildPath(fileName=""){
    buildPath = %A_ScriptDir%\build\%fileName%
    return buildPath
}
