SetBatchLines, -1
#SingleInstance, Force
#NoTrayIcon

; includes
#Include %A_ScriptDir%\node_modules
#Include biga.ahk\export.ahk

A := new biga() ; requires https://www.npmjs.com/package/biga.ahk

; input
FileRead, OutputVar, % A_ScriptDir "\data\02input.txt"
array := StrSplit(OutputVar, "`n", "`r")

; --- Part One ---
horizontal := 0
depth := 0
for key, value in array {
	vals := StrSplit(value, " ")
	if (A.startsWith(value, "down")) {
		depth += vals[2]
	}
	if (A.startsWith(value, "up")) {
		depth -= vals[2]
	}
	if (A.startsWith(value, "forward")) {
		horizontal += vals[2]
	}
}
msgbox, % horizontal * depth
; => 1524750



; --- Part Two ---
aim := 0
horizontal := 0
depth := 0
for key, value in array {
	vals := strSplit(value, " ")
	if (A.startsWith(value, "down")) {
		aim += vals[2]
	}
	if (A.startsWith(value, "up")) {
		aim -= vals[2]
	}
	if (A.startsWith(value, "forward")) {
		horizontal += vals[2]
		depth += (vals[2] * aim)
	}
}
msgbox, % horizontal * depth
; => 1592426537