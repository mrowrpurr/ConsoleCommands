scriptName ConsoleCommands extends Quest

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fields
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

float _lock
int _commandCount
string[] _commandNames0
string[] _commandNames1
string[] _commandNames2
string[] _commandNames3
string[] _commandNames4
string[] _commandNames5
string[] _commandNames6
string[] _commandNames7
string[] _commandNames8
string[] _commandNames9
ConsoleCommand[] _commands0
ConsoleCommand[] _commands1
ConsoleCommand[] _commands2
ConsoleCommand[] _commands3
ConsoleCommand[] _commands4
ConsoleCommand[] _commands5
ConsoleCommand[] _commands6
ConsoleCommand[] _commands7
ConsoleCommand[] _commands8
ConsoleCommand[] _commands9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

string[] property CommandNames
    string[] function get()
    endFunction
endProperty

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Initialization
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

event OnInit()
    _commandNames0 = new string[128]
    _commandNames1 = new string[128]
    _commandNames2 = new string[128]
    _commandNames3 = new string[128]
    _commandNames4 = new string[128]
    _commandNames5 = new string[128]
    _commandNames6 = new string[128]
    _commandNames7 = new string[128]
    _commandNames8 = new string[128]
    _commandNames9 = new string[128]
    _commands0 = new ConsoleCommand[128]
    _commands1 = new ConsoleCommand[128]
    _commands2 = new ConsoleCommand[128]
    _commands3 = new ConsoleCommand[128]
    _commands4 = new ConsoleCommand[128]
    _commands5 = new ConsoleCommand[128]
    _commands6 = new ConsoleCommand[128]
    _commands7 = new ConsoleCommand[128]
    _commands8 = new ConsoleCommand[128]
    _commands9 = new ConsoleCommand[128]

    RegisterForSingleUpdate(5)
endEvent

event OnUpdate()
    Debug.MessageBox("Command names: " + _commandNames0)
endEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Command Registry Management
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

function RegisterConsoleCommand(string name, ConsoleCommand cmd)
    Debug.MessageBox("Register Console Command '" + name + "' " + cmd)

    if ! name || ! cmd
        return
    endIf

    Lock()

    int index = _commandCount

    Debug.MessageBox("Index: " + index)

    if index < 128 ; 0
        _commandNames0[index] = name
        _commands0[index] = cmd
    elseIf index < (128 * 2) ; 1
        ; TODO
        ; ...
    endIf
    
    _commandCount += 1

    Unlock()
endFunction

function Lock(float lock = 0.0)
    if ! lock
        lock = Utility.RandomFloat(0, 10000000) ; TODO if desired use random number generatic in Papyrus to not block on SKSE function here
    endIf

    while _lock
        Utility.WaitMenuMode(0.05)
    endWhile

    _lock = lock

    if _lock == lock
        if _lock == lock
            return ; We have the lock!
        else
            Lock(lock)
        endIf
    else
        Lock(lock)
    endIf
endFunction

function Unlock()
    _lock = 0
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Global Function API
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ConsoleCommands function GetInstance() global
    return Quest.GetQuest("ConsoleCommands") as ConsoleCommands
endFunction

bool function IsCustomConsoleCommandsSupported() global
    return UI.GetBool("Console", "_global.Console.SUPPORTS_CUSTOM_COMMANDS")
endFunction

function EnableCustomConsoleCommands() global
    UI.SetBool("Console", "_global.Console.HandleEnterKey", false)
endFunction

function DisableCustomConsoleCommands() global
    UI.SetBool("Console", "_global.Console.HandleEnterKey", true)
endFunction

function Register(string name, ConsoleCommand cmd) global
    GetInstance().RegisterConsoleCommand(name, cmd)
endFunction
