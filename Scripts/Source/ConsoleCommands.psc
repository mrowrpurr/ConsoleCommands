scriptName ConsoleCommands extends Quest

; LET'S MAKE AN MCM!

bool enterKeyOn = true

event OnInit()
    RegisterForUpdate(5)
endEvent

event OnUpdate()
    if enterKeyOn
        enterKeyOn = false
        UI.SetBool("Console", "_global.Console.HandleEnterKey", false)
        Debug.Notification("Disabled enter key")
    else
        enterKeyOn = true
        UI.SetBool("Console", "_global.Console.HandleEnterKey", true)
        Debug.Notification("Enabled enter key")
    endIf
endEvent
