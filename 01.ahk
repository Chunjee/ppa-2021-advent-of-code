SetBatchLines, -1
#SingleInstance, Force
#NoTrayIcon

; input
FileRead, OutputVar, % A_ScriptDir "\data\01input.txt"
array := StrSplit(OutputVar, "`n", "`r")

; --- Part One ---
outputCount := 0

for key, value in array {
	; skip first measurement
	if (A_Index == 1) {
		AA := array[A_Index] + array[A_Index + 1] + array[A_Index + 2]
		lastInput := value
	}
	if (value > lastInput) {
		outputCount++
	}
	lastInput := value
}
msgbox, % outputCount
; => 1446



; --- Part Two ---
outputCount := 0
for key, value in array {
	; exit if chunk cannot be created
	if ((A_Index + 2) > array.count()) {
		break
	}
	; skip first measurement
	if (A_Index == 1) {
		AA := array[A_Index] + array[A_Index + 1] + array[A_Index + 2]
	}
	B := array[A_Index + 1] + array[A_Index + 2] + array[A_Index + 3]
	AA := array[A_Index] + array[A_Index + 1] + array[A_Index + 2]
	if (B > AA) {
		outputCount++
	}
}
msgbox, % outputCount
; => 1486
