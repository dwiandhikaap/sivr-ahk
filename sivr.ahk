;Settings Stuff
#SingleInstance, force

SetTitleMatchMode, 2
SetTitleMatchMode, fast
SetKeyDelay, 0

;===============================================;
;           VSCode-Chrome Switcher              ;
;===============================================;

; [Pause] Switch window to VSCode
Pause::
WinActivate, ahk_exe Code.exe
return


; [Scroll Lock] Switch chrome to VSCode
ScrollLock::
WinActivate, ahk_exe chrome.exe
return


; [Shift + Pause] Switch VSCode between minimized, maximized, half-screen on the right side
+Pause::
IfWinExist, ahk_exe Code.exe
{
    windowState := Mod(windowState, 3)

    ; Check if it's minimized
    WinGet, State, MinMax, ahk_exe Code.exe
    if (State = -1)
    {
        windowState = 0
    }

    if (windowState = 0)
    {
        WinMaximize, ahk_exe Code.exe
        WinActivate, ahk_exe Code.exe
        
    }
    else if (windowState = 1)
    {
        WinRestore, ahk_exe Code.exe
        WinMove, ahk_exe Code.exe, , (A_ScreenWidth/2)-8, 0, (A_ScreenWidth/2)+14, (A_ScreenHeight)-40
        WinActivate, ahk_exe Code.exe
    }
    else {
        WinMinimize, ahk_exe Code.exe
    }
    windowState++  
}
return


; [Shift + Scroll Lock] Toggle Google Chrome between minimized, maximized, half-screen on the left side
+ScrollLock::
state := Mod(state, 3)
IfWinExist, Google Chrome
{
    ; Check if it's minimized
    WinGet, State, MinMax, Google Chrome
    if (state = -1)
    {
        windowState = 0
    }

    if (windowState = 0)
    {
        WinMaximize, Google Chrome
        WinActivate, Google Chrome
        
    }
    else if (windowState = 1)
    {
        WinRestore, Google Chrome
        WinMove, Google Chrome, , -8, 0, (A_ScreenWidth/2)+8, (A_ScreenHeight)-32
        WinActivate, Google Chrome
    }
    else{
        WinMinimize, Google Chrome
    }
    windowState++
}
return

;===============================================;
;           Chrome Tab Switcher                 ;
;                                               ;
;   NOTE: DON'T SPAM THE MOUSE WHEEL,           ;
;        IT MESSES WITH CHROME ZOOM SHORTCUT    ;
;===============================================;

; [Shift + Mouse Wheel Up] Next chrome tab
+WheelUp::
IfWinActive, Google Chrome
{
    sendevent {CTRL down}{TAB down}
    sendevent {CTRL up}{TAB up}
    return
}

; [Shift + Mouse Wheel Down] Previous chrome tab
+WheelDown::
IfWinActive, Google Chrome
{
    sendevent {CTRL down}{PgUp down}
    sendevent {CTRL up}{PgUp up}
    return
}