#SingleInstance Force
#UseHook  ; 启用键盘钩子
SetKeyDelay, -1  ; 禁用按键延迟

LWinDown := false  ; 初始化一个变量来跟踪Windows键是否被按下

LWin::  ; 当Windows键被按下时
    LWinDown := true  ; 设置变量为true
    Send {Blind}{vkE8} ; 发送无效码禁止单独win键触发菜单
return

LWin Up::  ; 当Windows键被松开时
    LWinDown := false  ; 重置变量
    Send {Blind}{vkE8} ; 发送无效码禁止单独win键触发菜单
return

;;;;;;;;;;;;;;;;;;;;win+key bind;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; win + shift + up
+Up::
if (LWinDown) {
    Send {Blind}{LWin Down}+{Up}{LWin Up}
} else {
    Send +{Up}  
}
return

; win + shift + down
+Down::
if (LWinDown) {
    Send {Blind}{LWin Down}+{Down}{LWin Up}
} else {
    Send +{Down}  
}
return

; win + shift + right
+Right::
if (LWinDown) {
    Send {Blind}{LWin Down}+{Right}{LWin Up}
} else {
    Send +{Right}  
}
return

; win + shift + left
+Left::
if (LWinDown) {
    Send {Blind}{LWin Down}+{Left}{LWin Up}
} else {
    Send +{Left}  
}
return

; win + r
r::
if (LWinDown) {
    Send {Blind}{LWin Down}{r}{LWin Up}
} else {
    Send {r}  
}
return

; win + Return -> google chrome
Return::
if (LWinDown) {
    Run,chrome
} else {
    Send {Return}  
}
return

; ctrl + win + return
^Return::
if (LWinDown) {
    Run,wt yazi
} else {
    Send ^{Return}  
}
return


; ctrl + win + right
^Right::
if (LWinDown) {
    Run,%HOMEPATH%/.glzr/scripts/shellexec.exe %HOMEPATH%/.glzr/scripts/gj.exe mr
} else {
    Send ^{Right}  
}
return

; ctrl + win + left
^Left::
if (LWinDown) {
    Run,%HOMEPATH%/.glzr/scripts/shellexec.exe %HOMEPATH%/.glzr/scripts/gj.exe ml
} else {
    Send ^{Left}  
}
return


; win + Right -> next workspace
Right::
if (LWinDown) {  
    Run,%HOMEPATH%/.glzr/scripts/shellexec.exe %HOMEPATH%/.glzr/scripts/gj.exe fr
    ; Send {Blind}{LWin Down}{Right}{LWin Up}
} else {
    Send {Right}
}
return

; win + Left -> prev workspace
Left::
if (LWinDown) {  
    Run,%HOMEPATH%/.glzr/scripts/shellexec.exe %HOMEPATH%/.glzr/scripts/gj.exe fl
} else {
    Send {Left}
}
return


; alt + WheelUp -> prev workspace
WheelUp::
if (LWinDown) {
    Run, shellexec glazewm command focus --prev-workspace
} else {
    send {WheelUp}
}
Return

; alt + WheelUp - > next workspace
WheelDown::
if (LWinDown) {
    Run, shellexec glazewm command focus --next-workspace
} else {
    send {WheelDown}
}
Return

; middle mouse button - > toggle fullscreen
MButton:: 
Run, shellexec glazewm command toggle-fullscreen
return
