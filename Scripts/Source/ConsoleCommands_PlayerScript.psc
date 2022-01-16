scriptName ConsoleCommands_PlayerScript 

event OnPlayerLoadGame()
    ConsoleCommands.GetInstance().ListenForConsoleCommands()
endEvent
