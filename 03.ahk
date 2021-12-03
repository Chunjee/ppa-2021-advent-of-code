SetBatchLines, -1
#SingleInstance, Force
#NoTrayIcon

; includes
#Include %A_ScriptDir%\node_modules
#Include biga.ahk\export.ahk

A := new biga() ; requires https://www.npmjs.com/package/biga.ahk

; input
FileRead, OutputVar, % A_ScriptDir "\data\03input.txt"
array := StrSplit(OutputVar, "`n", "`r")

; --- Part One ---
gamma := []
epsilon := []
loop, % A.size(array[1]) {
	index := A_Index
	column := []
	for key, value in array {
		valAsArray := strSplit(value)
		column.push(valAsArray[index])
	}
	one := A.count(column, 1)
	zero := A.count(column, 0)
	if (one > zero) {
		gamma.push(1)
		epsilon.push(0)
	} else {
		gamma.push(0)
		epsilon.push(1)
	}
}
; create binary strings after all array items have been parsed
gamma := A.join(gamma, "")
epsilon := A.join(epsilon, "")
msgbox, % "Answer: " dec(gamma) * dec(epsilon)



; --- Part Two ---




; --- functions ---
dec(x){
	b:=StrLen(x),r:=0
	loop,parse,x
		r|=A_LoopField<<--b
	return r
}

bin(x){
	return (x>>1 ? Bin(x>>1):"")x&1
}
