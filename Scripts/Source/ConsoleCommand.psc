scriptName ConsoleCommand extends Quest

string _name

string property Name
    string function get()
        if ! _name
            string scriptNameText = self ; [FooCommand < (00000800)>]
            scriptNameText = StringUtil.Substring(scriptNameText, 1, StringUtil.Find(scriptNameText, " ") - 1)
            int commandIndex = StringUtil.Find(scriptNameText, "Command")
            if commandIndex == StringUtil.GetLength(scriptNameText) - 7 ; "Command" is 7
                scriptNameText = StringUtil.Substring(scriptNameText, 0, commandIndex)
            endIf
            _name = scriptNameText
        endIf
        return _name
    endFunction
endProperty

event OnInit()
    OnCommandInit()
    ConsoleCommands.Register(Name, self)
endEvent

event OnCommandInit()
    ; Intended for console commands to override
endEvent

event OnRun(string[] arguments)
    ; Inteded for console commands to override
endEvent
