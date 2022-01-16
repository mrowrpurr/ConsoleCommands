scriptName ConsoleCommands extends Quest

event OnInit()
    Debug.MessageBox("Hello from Custom Console Commands")
    bool isCustomConsole = UI.GetBool("Console", "_global.Console.SUPPORTS_CUSTOM_COMMANDS")
    Debug.MessageBox("Do we have the custom modified console available? " + isCustomConsole)
endEvent
