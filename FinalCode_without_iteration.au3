#include <File.au3>

$xnConfirm = False
$xnConfirmMsg = 0

while $xnConfirm = False

     $xnFile = FileOpenDialog("filesize.txt","D:\Autoit Git Performance Script","All (*.*)") ; open the file dialogue window
   If FileExists($xnFile) = True Then
            $xnConfirm = True
         Else
               $xnConfirmMsg = msgbox(1,"File Not Found...",$xnFile & " does not exist." & @crlf &  "Please select another file.")
      EndIf
WEnd

ShellExecute("D:\repo1")

sleep(1500)

Send("{ENTER} {DOWN} ")

Send("{ENTER} ")

; need to check later for Winwaitactive function {DOWN} {ENTER}

Sleep(3000)

Send("{ENTER}")

If WinActive("[CLASS:OGrid; INSTANCE:1]") Then ; Check if window is currently active.

    Sleep(50000)
	Example()

Else

	Example()




EndIf


Func Example()
    ; Retrieve the file size (in bytes) of the intended file.
    Local $iFileSize = FileGetSize("D:\repo1\TPDotnet-Text-Core_de+en.mdb")


		 $count = 5

		; need to put the loop
		  Sleep(2500)
	      Send(""& $count)

		  Send("^s")
		  Sleep(5000)
		  Send("!y" ); send cntrl + y

		  Send("{c}") ;press c
		  Sleep(1500)
		  Send ( "!{F4}") ;send alt f4
		  Sleep(5000)
		 $file = FileOpen($xnFile, 1)
		 FileWrite($file,$iFileSize & @crlf ) ; file write with new line
		 FileClose($xnFile)
		 Send("{DOWN}  ")
		 Send ("+{F10}") ; send mouse right click
		 Sleep(500)
		 Send("{DOWN} {DOWN} {DOWN} {DOWN} {DOWN} {DOWN} {DOWN} {DOWN} {DOWN} {ENTER}")
		 Sleep(5000)
		 Send("14")
		 Sleep(1000)
		 ControlClick("D:\repo1\TPDotnet-Text-Core_de+en.mdb - Commit - TortoiseGit", "C&ommit", "[CLASS:Button; INSTANCE:14]")
		 Sleep(6000)
		 ControlClick("D:\repo1 - Git Command Progress - TortoiseGit", "Close", "[CLASS:Button; INSTANCE:1]")
		 Sleep(10000)



EndFunc   ;==>Example

Func ByteSuffix($iBytes)
    Local $iIndex = 0, $aArray = [' bytes', ' KB', ' MB', ' GB', ' TB', ' PB', ' EB', ' ZB', ' YB']
    While $iBytes > 1023
        $iIndex += 1
        $iBytes /= 1024
    WEnd
    Return Round($iBytes) & $aArray[$iIndex]
EndFunc   ;==>ByteSuffix