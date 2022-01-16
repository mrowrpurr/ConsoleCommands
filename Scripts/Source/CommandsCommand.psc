scriptName CommandsCommand extends ConsoleCommand
{Console command that prints out list of available console commands}

event OnRun(string[] arguments)
    Debug.MessageBox("This will print out console commands, arguments: " + arguments)
endEvent
