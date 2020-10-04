#cs

Fonctions de:

################################################################
# Extracteur de liens favoris Google (exclusivement)		   #
################################################################

Lilian Boinard

#ce

; Directives de préprocesseur
#include <MsgBoxConstants.au3>
#include <Array.au3>
#include <File.au3>
#include <FTPEx.au3>
#include <Inet.au3>
#include-once

#Region ### Variables

Local $googleBookmarks = "C:\Documents and Settings\" & @UserName & "\Local Settings\Application Data\Google\Chrome\User Data\Default\Bookmarks"

Local $googleBookmarksBak = "C:\Documents and Settings\" & @UserName & "\Local Settings\Application Data\Google\Chrome\User Data\Default\Profile 1\Bookmarks"

Local $file = "result.txt", $regex = "https?://*.*", $bookmarksPath

#EndRegion ### Variables

Func pathBookmarks()

If FileExists($googleBookmarks) Then

   $bookmarksPath &= $googleBookmarks

ElseIf FileExists($googleBookmarksBak) Then

   $bookmarksPath &= $googleBookmarksBak

Else

   MsgBox($MB_ICONERROR, "Error", "File ""Bookmarks"" not exist")

   Exit

EndIf

Return($bookmarksPath)

EndFunc

Func takeLinks()

   Local $txt = FileRead($bookmarksPath)

   If FileExists($file) Then

	  FileDelete($file)

   EndIf

   _FileCreate($file)

   Global $array = StringRegExp($txt, $regex, $STR_REGEXPARRAYGLOBALMATCH)

   FileOpen($file)

   _FileWriteFromArray($file, $array)

   FileClose($file)

   GUICtrlSetData($Progress1, 100)

EndFunc ;==> Script End