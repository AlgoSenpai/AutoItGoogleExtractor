#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.15.0 (Beta)
 Author:         Lilian Boinard

 Script Function:
	Extract google favorite links in a .txt file and show in array.

#ce ----------------------------------------------------------------------------

; Script Start

; Directives de préprocesseur
#include "Func.au3"
#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

#Region #-# Pragma -->

#pragma compile(Out, FavGoExtractor.exe)
#pragma compile(Icon, icon.ico)
#pragma compile(ExecLevel, none)
#pragma compile(CompanyName, Pyro)
#pragma compile(FileDescription, Favorite Google links extractor)
#pragma compile(FileVersion, 1.0.0)

#EndRegion #-# Pragma -->

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Google extractor", 356, 66, 769, 486)
GUISetBkColor(0x000000)
$Label1 = GUICtrlCreateLabel("extracting favorite links...", 120, 8, 121, 17)
GUICtrlSetColor(-1, 0x00FF00)
$Progress1 = GUICtrlCreateProgress(40, 32, 278, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

pathBookmarks()

takelinks()

Sleep(1000)

_ArrayDisplay($array, "Favorite links")

Exit ;==> Script End