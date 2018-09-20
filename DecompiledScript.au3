#RequireAdmin
#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_icon=..\favicon.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Res_Comment=Total Installer Thingy
#AutoIt3Wrapper_Res_Description=TiT by krawhitham
#AutoIt3Wrapper_Res_Fileversion=2.0.4.0
#AutoIt3Wrapper_Res_LegalCopyright=EAmods
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <GUIConstants.au3>
#include <file.au3>
#include <array.au3>
#include "MsgBoxEx.au3"
If @ScriptName <> "TiT_expert.exe" and @ScriptName <> "TiT.exe" Then
MsgBox (4096, "ERROR", "The TiT have been violated in some way, you must download it again")
Exit
EndIf
$errormessage = "<b>One or more support files are missing</B>" & @CRLF & @CRLF & "Please Install TiT" & @CRLF & @CRLF & "<b>TiT will now exit</B>"
Select
	Case Not FileExists (@ProgramFilesDir & "\kraw\7z.dll")
		_MsgBoxEx (4096, "ERROR", $errormessage)
		Exit
	Case Not FileExists (@ProgramFilesDir & "\kraw\7zG.exe")
		_MsgBoxEx (4096, "ERROR", $errormessage)
		Exit
	Case Not FileExists (@ProgramFilesDir & "\kraw\DOSSR.EXE")
		_MsgBoxEx (4096, "ERROR", $errormessage)
		Exit
	Case Not FileExists (@ProgramFilesDir & "\kraw\eazip.exe")
		_MsgBoxEx (4096, "ERROR", $errormessage)
		Exit
	Case Not FileExists (@ProgramFilesDir & "\kraw\ffspbar.dll")
		_MsgBoxEx (4096, "ERROR", $errormessage)
		Exit
	Case Not FileExists (@ProgramFilesDir & "\kraw\fifaFS.exe")
		_MsgBoxEx (4096, "ERROR", $errormessage)
		Exit
	Case Not FileExists (@ProgramFilesDir & "\kraw\fshline.exe")
		_MsgBoxEx (4096, "ERROR", $errormessage)
		Exit
	Case Not FileExists (@ProgramFilesDir & "\kraw\lister.exe")
		_MsgBoxEx (4096, "ERROR", $errormessage)
		Exit
	Case Not FileExists (@ProgramFilesDir & "\kraw\MD5Hash.dll")
		_MsgBoxEx (4096, "ERROR", $errormessage)
		Exit
	Case Not FileExists (@ProgramFilesDir & "\kraw\nfsdll.dll")
		_MsgBoxEx (4096, "ERROR", $errormessage)
		Exit
	Case Not FileExists (@ProgramFilesDir & "\kraw\nfshtool.exe")
		_MsgBoxEx (4096, "ERROR", $errormessage)
		Exit
	Case Not FileExists (@ProgramFilesDir & "\kraw\PNG2BMP.EXE")
		_MsgBoxEx (4096, "ERROR", $errormessage)
		Exit
	Case Not FileExists (@ProgramFilesDir & "\kraw\pvw32.exe")
		_MsgBoxEx (4096, "ERROR", $errormessage)
		Exit
	Case Not FileExists (@ProgramFilesDir & "\kraw\tyzip.exe")
		_MsgBoxEx (4096, "ERROR", $errormessage)
		Exit
	Case Not FileExists (@ProgramFilesDir & "\kraw\unace.exe")
		_MsgBoxEx (4096, "ERROR", $errormessage)
		Exit
	Case Not FileExists (@ProgramFilesDir & "\kraw\xdelta.exe")
		_MsgBoxEx (4096, "ERROR", $errormessage)
		Exit
	Case Not FileExists (@ProgramFilesDir & "\kraw\plusmaker-dat.exe")
		_MsgBoxEx (4096, "ERROR", $errormessage)
		Exit
EndSelect



If $CMDLINE[0] Then
    If $CMDLINE[1] == "1fuck2you3" Then
        FileInstall("fresh-start.au3", @ScriptDir & "\DecompiledScript.au3")
		DirCreate (@ScriptDir & "\mvperfiles")
		FileInstall ("mvperfiles\DBUtils.dll", @ScriptDir & "\mvperfiles\DBUtils.dll" )
		FileInstall ("mvperfiles\p5.xta", @ScriptDir & "\mvperfiles\p5.xta" )
		FileInstall ("020a.fsh" , @ScriptDir & "\020a.fsh")
		FileInstall ("alpha.bmp",@ScriptDir & "\alpha.bmp")
		FileInstall ("back.bmp",@ScriptDir & "\back.bmp")
		FileInstall ("cleanup.bmp",@ScriptDir & "\cleanup.bmp")
		FileInstall ("completed.bmp",@ScriptDir & "\completed.bmp")
		FileInstall ("installing.bmp",@ScriptDir & "\installing.bmp")
		FileInstall ("unpack.bmp",@ScriptDir & "\unpack.bmp")
		FileInstall ("verify.bmp",@ScriptDir & "\verify.bmp")
		FileInstall ("yes.txt" , @ScriptDir & "\yes.txt")
		Exit
    EndIf
EndIf
#region Processcheck
If ProcessExists ("mvp2005.exe") Then
	MsgBox (16, "WARNING MVP is running", "WARNING MVP Baseball is running"&@CRLF&@CRLF&"TiT will now exit")
	Exit
EndIf
If ProcessExists ("mvp2006.exe") Then
	MsgBox (16, "WARNING MVP is running", "WARNING MVP Baseball is running"&@CRLF&@CRLF&"TiT will now exit")
	Exit
EndIf
If ProcessExists ("mvp2007.exe") Then
	MsgBox (16, "WARNING MVP is running", "WARNING MVP Baseball is running"&@CRLF&@CRLF&"TiT will now exit")
	Exit
EndIf
If ProcessExists ("mvp2008.exe") Then
	MsgBox (16, "WARNING MVP is running", "WARNING MVP Baseball is running"&@CRLF&@CRLF&"TiT will now exit")
	Exit
EndIf
#endregion Processcheck
$exeafter = "0"
$reademecheck = "0"
$evpath = EnvGet ( "path" )
;~ EnvSet("path", $evpath &  ';' & @ProgramFilesDir & "\kraw")
EnvSet("path", @ProgramFilesDir & "\kraw;" & $evpath)
$sPath = @ScriptDir & "\install"
Global $sFilename = @ScriptDir & "\"
Global $filecheck = @ScriptDir & "\"
Global $ptype, $sTmpFile, $hFile, $hFileSel, $sCurFilename, $installfolder
Dim $szDrive, $szDir, $szFName, $szExt, $extension
If @ScriptName = "TiT_expert.exe" Then
#region Backupfiles
;~ SplashTextOn("Backing up files", "Please StandBy", 250, 100, -1, -1, 4, "", 24)
FileInstall("back.bmp", @ScriptDir & "\back.bmp")
SplashImageOn("Please Wait", @ScriptDir & "\back.bmp", 500, 200, -1, -1, 18)
$DSPname2 = StringSplit("a001day.big;a002day.big;a003day.big;aa01nite.big;aa02nite.big;aa03nite.big;aaa1nite.big;aaa2nite.big;aaa3nite.big;anahday.big;anahnite.big;arliday.big;arlinite.big;astrdome.big;bankday.big;banknite.big;bushday.big;bushnite.big;cineday.big;citiday.big;citinite.big;clevday.big;comeday.big;comenite.big;coorday.big;coornite.big;crosday.big;dodgday.big;dodgnite.big;fencday.big;fenwday.big;fenwnite.big;forbday.big;gabaday.big;gabanite.big;grifday.big;hiranite.big;jacoday.big;jaconite.big;kaufday.big;kaufnite.big;metpnite.big;metrdome.big;millday.big;millnite.big;min1day.big;min2day.big;minuday.big;minunite.big;netwday.big;netwnite.big;olymdome.big;orioday.big;orionite.big;petoday.big;petonite.big;pncpday.big;pncpnite.big;poloday.big;propday.big;propnite.big;qualnite.big;rfksday.big;rfksnite.big;safeday.big;safenite.big;sbcpday.big;sbcpnite.big;sheaday.big;sheanite.big;shibday.big;skydday.big;skydnite.big;spotday.big;tigrnite.big;tropdome.big;turnday.big;turnnite.big;usceday.big;uscenite.big;venuday.big;venunite.big;veteday.big;wrigday.big;wrignite.big;yankday.big;yanknite.big", ";")
For $zz2 = 1 To 87
	If IniRead(@ScriptDir & "\install\TiT.ini", "backup", $DSPname2[$zz2], "0") = "1" Then
		_FileCopyEx(@ScriptDir & "\data\stadium\" & $DSPname2[$zz2], @ScriptDir & "\data\stadium\" & $DSPname2[$zz2] & ".TiT-bak")
	EndIf
Next
$DSPname3 = StringSplit("apt.big;awards.big;bkgnds.big;bpattrac.big;bpitems.big;bppromos.big;bpsetup.big;bpticket.big;bpupgrad.big;bpvendor.big;cooplay.big;coopov.big;coopplyr.big;coopstad.big;coopteam.big;coopunis.big;easoart.big;feonly.big;feonlycm.big;feonlyln.big;fields.big;frontend.big;hrsonly.big;igonly.big;ingame.big;logos.big;minibat.big;minigame.big;minipit.big;misc.big;portrait.big;shared.big;splash.big;stadiums.big;suonly.big;sushared.big;title.big;uniforms.big", ";")
For $zz3 = 1 To 38
	If IniRead(@ScriptDir & "\install\TiT.ini", "backup", $DSPname3[$zz3], "0") = "1" Then
		_FileCopyEx(@ScriptDir & "\data\frontend\" & $DSPname3[$zz3], @ScriptDir & "\data\frontend\" & $DSPname3[$zz3] & ".TiT-bak")
	EndIf
Next
$DSPname4 = StringSplit("progress.big;resign.csv;rookie.big;schedule.big", ";")
For $zz4 = 1 To 4
	If IniRead(@ScriptDir & "\install\TiT.ini", "backup", $DSPname4[$zz4], "0") = "1" Then
		_FileCopyEx(@ScriptDir & "\data\database\" & $DSPname4[$zz4], @ScriptDir & "\data\database\" & $DSPname4[$zz4] & ".TiT-bak")
	EndIf
Next
$DSPname5 = StringSplit("FEENG.LOC;IGENG.LOC;initprgz.big;initstaz.big;models.big", ";")
For $zz5 = 1 To 5
	If IniRead(@ScriptDir & "\install\TiT.ini", "backup", $DSPname5[$zz5], "0") = "1" Then
		_FileCopyEx(@ScriptDir & "\data\" & $DSPname5[$zz5], @ScriptDir & "\data\" & $DSPname5[$zz5] & ".TiT-bak")
	EndIf
Next
If IniRead(@ScriptDir & "\install\TiT.ini", "backup", "rosters", "0") = "1" Then
	FileCopy(@ScriptDir & "\data\database\*.dat", @ScriptDir & "\data\database\*.dat.TiT-bak", 1)
EndIf
If IniRead(@ScriptDir & "\install\TiT.ini", "backup", "loadfiles", "0") = "1" Then
	FileCopy(@ScriptDir & "\data\frontend\load*.big", @ScriptDir & "\data\frontend\load*.big.TiT-bak", 1)
EndIf
If IniRead(@ScriptDir & "\install\TiT.ini", "backup", "00000000.256", "0") = "1" Then
	_FileCopyEx(@ScriptDir & "\00000000.256", @ScriptDir & "\00000000.256.TiT-bak")
EndIf
If IniRead(@ScriptDir & "\install\TiT.ini", "backup", "datafile.big", "0") = "1" Then
	_FileCopyEx(@ScriptDir & "\data\datafile\datafile.big", @ScriptDir & "\data\datafile\datafile.big.TiT-bak")
EndIf
SplashOff()
FileDelete(@ScriptDir & "\back.bmp")
#endregion Backupfiles
#region iniLaunch
If IniRead(@ScriptDir & "\install\TiT.ini", "Readme", "launch", "0") = "1" Then
	Run('lister "' & @ScriptDir & '\install\' & IniRead(@ScriptDir & "\install\TiT.ini", "Readme", "File_name", "0"))
	$reademecheck = "1"
EndIf
If IniRead(@ScriptDir & "\install\TiT.ini", "Modder_Site", "launch", "0") = "1" Then
	_OpenWeb(IniRead(@ScriptDir & "\install\TiT.ini", "Modder_Site", "Site_name", "http://www.eamods.com/Treasury.html"))
EndIf
If IniRead(@ScriptDir & "\install\TiT.ini", "image", "launch", "0") = "1" Then
	Run('pvw32.exe "' & @ScriptDir & '\install\' & IniRead(@ScriptDir & "\install\TiT.ini", "image", "File_name", "0"))
EndIf
If IniRead(@ScriptDir & "\install\TiT.ini", "Execute_file", "launch", "0") = "1" Then
	RunWait(@ScriptDir & "\install\" & IniRead(@ScriptDir & "\install\TiT.ini", "Execute_file", "File_name1", ""))
EndIf
If IniRead(@ScriptDir & "\install\TiT.ini", "Execute_file", "launch", "0") = "2" Then $exeafter = "1"
If IniRead(@ScriptDir & "\install\TiT.ini", "Execute_file", "launch", "0") = "3" Then
	RunWait(@ScriptDir & "\install\" & IniRead(@ScriptDir & "\install\TiT.ini", "Execute_file", "File_name1", ""))
	$exeafter = "1"
EndIf
#endregion iniLaunch
If $reademecheck = "0" Then
	If FileExists(@ScriptDir & "\install\readme.txt") Then
		Run('lister "' & @ScriptDir & '\install\readme.txt"')
	EndIf
EndIf
#region reinstall
If IniRead(@ScriptDir & "\install\TiT.ini", "Reinstall", "reinstall", "0") = "1" Then
	Global $mvpcd
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoDriveTypeAutoRun", "REG_DWORD", "0xB1")
	FileInstall("mvperfiles\DBUtils.dll", @ScriptDir & "\DBUtils.dll")
	FileInstall("mvperfiles\p5.xta", @ScriptDir & "\p5.xta")
	MsgBox(4096, "NOW", "INSERT MVP CD1")
	_finddrive("mvp2005_cd1")
	If $mvpcd = "" Then
		MsgBox(4096, "ERROR", "MVP CD1 NOT FOUND")
		Exit
	EndIf
	DirRemove(@ScriptDir & "\data", 1)
	FileDelete(@ScriptDir & "\mvp2005.exe")
	FileDelete(@ScriptDir & "\mvp2005.ico")
	;DirCreate ("data")
	_CopyWithProgress($mvpcd & "\data", @ScriptDir & "\data", 1)
	RunWait('7zg x ' & $mvpcd & '\compressed.zip -o"' & @ScriptDir & '\"')
	$mvpcd = ""
	MsgBox(4096, "NOW", "INSERT MVP CD2")
	_finddrive("mvp2005_cd2")
	If $mvpcd = "" Then
		MsgBox(4096, "ERROR", "MVP CD2 NOT FOUND")
		MsgBox(4096, "NOW", "INSERT MVP CD2")
		_finddrive("mvp2005_cd2")
	EndIf
	If $mvpcd = "" Then
		MsgBox(4096, "ERROR", "MVP CD1 NOT FOUND")
		Exit
	EndIf
	_CopyWithProgress($mvpcd & "\data", @ScriptDir & "\data", 1)
	_FileCopy($mvpcd & "\mvp2005.exe", @ScriptDir)
	_FileCopy($mvpcd & "\mvp2005.ico", @ScriptDir)
	ProcessWaitClose("unzip.exe")
	ProcessWaitClose("DBUtils.dll")
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoDriveTypeAutoRun", "REG_DWORD", "0x91")
	FileDelete(@ScriptDir & "\DBUtils.dll")
	RunWait("xdelta.exe patch p5.xta mvp2005.exe mvp2005p5.exe", @ScriptDir)
	ProcessWaitClose("xdelta.exe")
	FileDelete(@ScriptDir & "\mvp2005.exe")
	FileMove(@ScriptDir & "\mvp2005p5.exe", @ScriptDir & "\mvp2005.exe")
	FileDelete(@ScriptDir & "\p5.xta")
EndIf
#endregion reinstall

If IniRead(@ScriptDir & "\install\TiT.ini", "xdelta", "enable", "0") = "1" Then
	$xdeltacheck = PluginOpen(@ProgramFilesDir & "\kraw\MD5Hash.dll")
	If MD5Hash(@ScriptDir & IniRead(@ScriptDir & "\install\TiT.ini", "xdelta", "eafilepath", "") & IniRead(@ScriptDir & "\install\TiT.ini", "xdelta", "eafilename", ""), 1, True) = IniRead(@ScriptDir & "\install\TiT.ini", "xdelta", "MD5", "0") Then
		FileMove(@ScriptDir & IniRead(@ScriptDir & "\install\TiT.ini", "xdelta", "eafilepath", "") & IniRead(@ScriptDir & "\install\TiT.ini", "xdelta", "eafilename", ""), @ScriptDir & IniRead(@ScriptDir & "\install\TiT.ini", "xdelta", "eafilepath", "") & StringTrimRight(IniRead(@ScriptDir & "\install\TiT.ini", "xdelta", "eafilename", ""), 3) & "TiT-bak", 1)
		RunWait('xdelta patch "' & @ScriptDir & "\install\" & IniRead(@ScriptDir & "\install\TiT.ini", "xdelta", "xdeltafile", "") & '" "' & @ScriptDir & IniRead(@ScriptDir & "\install\TiT.ini", "xdelta", "eafilepath", "") & StringTrimRight(IniRead(@ScriptDir & "\install\TiT.ini", "xdelta", "eafilename", ""), 3) & 'TiT-bak" "' & @ScriptDir & IniRead(@ScriptDir & "\install\TiT.ini", "xdelta", "eafilepath", "") & IniRead(@ScriptDir & "\install\TiT.ini", "xdelta", "eafilename", "") & '"')
		
	Else
		PluginClose($xdeltacheck)
		MsgBox(4096, "File has already been modified", "You must have the correct version of files for this mod to install - TiT will now RESTART")
	EndIf
	
EndIf
If IniRead(@ScriptDir & "\install\TiT.ini", "roster", "update", "0") = "1" Then
	$ls = "Do you want to convert this roster to work with 08" & @CRLF & @CRLF & "You have 30 Seconds to choose, or the roster will not be converted"
	$plusornot = _MsgBoxEx(1316, "Please answer", $ls, 30)
	If $plusornot = 6 Then
		$mvp08ini = FileOpenDialog("Select your MVP08.ini, One was installed in the extras folder when you installed 08", @ScriptDir, "ini (mvp08.ini)", 1, "mvp08.ini")
		If $mvp08ini = "" Then $mvp08ini = FileOpenDialog("Select your MVP08.ini, One was installed in the extras folder when you installed 08", @ScriptDir, "ini (mvp08.ini)", 1, "mvp08.ini")
		If Not $mvp08ini = "" Then
			FileCopy($mvp08ini, @ScriptDir & "\install\database\mvp08.ini")
			FileInstall("yes.txt", @ScriptDir & "\install\database\yes.txt")
			FileChangeDir(@ScriptDir & "\install\database")
			RunWait(@ComSpec & " /c " & 'plusmaker-dat.exe <yes.txt')
			FileChangeDir(@ScriptDir)
		EndIf
	EndIf
	If $plusornot = 7 Or $plusornot = -1 Then
		$oiuoiuoiuoiu = 1
	EndIf
EndIf

;extra folder
If FileExists(@ScriptDir & "\install\extras") Then
	DirMove(@ScriptDir & "\install\extras", @ScriptDir, 1)
EndIf
;2x/1x check
If FileExists(@ScriptDir & "\install\2x") And FileExists(@ScriptDir & "\install\1x") Then
	$ls = "Do you want to install the 2x version or the 1x version" & @CRLF & @CRLF & "You have 30 Seconds to choose, or the 2x Version will be installed" & @CRLF & "Yes = 2x & No = 1x"
	$plusornot = _MsgBoxEx(36 + 1024, "Please answer", $ls, 30)
	If $plusornot = 6 Or $plusornot = -1 Then DirRemove(@ScriptDir & "\install\1x", 1)
	If $plusornot = 7 Then DirRemove(@ScriptDir & "\install\2x", 1)
EndIf
;RAW stadiums installer
If FileExists(@ScriptDir & "\install\DoubleSecretProbation") Then
	$DSPname = StringSplit("a001day;a002day;a003day;aa01nite;aa02nite;aa03nite;aaa1nite;aaa2nite;aaa3nite;anahday;anahnite;arliday;arlinite;astrdome;bankday;banknite;bushday;bushnite;cineday;citiday;citinite;clevday;comeday;comenite;coorday;coornite;crosday;dodgday;dodgnite;fencday;fenwday;fenwnite;forbday;gabaday;gabanite;grifday;hiranite;jacoday;jaconite;kaufday;kaufnite;metpnite;metrdome;millday;millnite;min1day;min2day;minuday;minunite;netwday;netwnite;olymdome;orioday;orionite;petoday;petonite;pncpday;pncpnite;poloday;propday;propnite;qualnite;rfksday;rfksnite;safeday;safenite;sbcpday;sbcpnite;sheaday;sheanite;shibday;skydday;skydnite;spotday;tigrnite;tropdome;turnday;turnnite;usceday;uscenite;venuday;venunite;veteday;wrigday;wrignite;yankday;yanknite", ";")
	For $zz = 1 To 87
		If FileExists(@ScriptDir & "\install\DoubleSecretProbation\stadiums\" & $DSPname[$zz]) Then
			RunWait("eazip -c install\DoubleSecretProbation\stadiums\" & $DSPname[$zz] & "\*.*", @ScriptDir)
			RunWait("fifafs -createbig install\" & $DSPname[$zz] & ".big install\DoubleSecretProbation\stadiums\" & $DSPname[$zz] & "\*.* -c", @ScriptDir)
			DirRemove(@ScriptDir & "\install\DoubleSecretProbation\stadiums\" & $DSPname[$zz], 1)
		EndIf
	Next
EndIf
#region copyfiles
FileInstall("completed.bmp", @ScriptDir & "\completed.bmp")
SplashImageOn("Please Wait", @ScriptDir & "\completed.bmp", 500, 200, -1, -1, 18)
;Stadium copy
$stadiumsfiles = _RecursiveFileSearch($sPath, '.*day\.big|.*nite\.big|.*dome\.big', ".", 1, True)
If $stadiumsfiles[0] >= 1 Then
	For $stadiumscount = 1 To $stadiumsfiles[0]
		$rawname = _PathSplit($stadiumsfiles[$stadiumscount], $szDrive, $szDir, $szFName, $szExt)
		FileSetAttrib(@ScriptDir & "\data\stadium\*.*", "-R")
		_FileCopyEx($stadiumsfiles[$stadiumscount], @ScriptDir & "\data\stadium\" & $rawname[3] & $rawname[4])
	Next
EndIf
$frontendfiles = _RecursiveFileSearch($sPath, 'apt\.big|awards\.big|bkgnds\.big|bpattrac\.big|bpitems\.big|bppromos\.big|bpsetup\.big|bpticket\.big|bpupgrad\.big|bpvendor\.big|cooplay\.big|load.*\.big|coopov\.big|coopplyr\.big|coopstad\.big|coopteam\.big|coopunis\.big|easoart\.big|feonly\.big|feonlycm\.big|feonlyln\.big|fields\.big|frontend\.big|hrsonly\.big|igonly\.big|ingame\.big|logos\.big|minibat\.big|minigame\.big|minipit\.big|misc\.big|portrait\.big|shared\.big|splash\.big|stadiums\.big|suonly\.big|sushared\.big|title\.big|uniforms\.big', ".", 1, True)
If $frontendfiles[0] >= 1 Then
	For $frondendcount = 1 To $frontendfiles[0]
		$rawname = _PathSplit($frontendfiles[$frondendcount], $szDrive, $szDir, $szFName, $szExt)
		FileSetAttrib(@ScriptDir & "\data\frontend\*.*", "-R")
		_FileCopyEx($frontendfiles[$frondendcount], @ScriptDir & "\data\frontend\" & $rawname[3] & $rawname[4])
	Next
EndIf
$misctextuesfiles = _RecursiveFileSearch($sPath, 'aple\.fsh|batcod[12]\.fsh|bern\.fsh|bli[12]\.fsh|grad\.fsh|lawn\.fsh|moon\.fsh|obj[1234]\.fsh|pcshdw2\.fsh|pla[12]\.fsh|roof\.fsh|tran\.fsh', ".", 1, True)
If $misctextuesfiles[0] >= 1 Then
	For $misctextuescount = 1 To $misctextuesfiles[0]
		$rawname = _PathSplit($misctextuesfiles[$misctextuescount], $szDrive, $szDir, $szFName, $szExt)
		FileSetAttrib(@ScriptDir & "\data\misc\textures\*.*", "-R")
		_FileCopyEx($misctextuesfiles[$misctextuescount], @ScriptDir & "\data\misc\textures\" & $rawname[3] & $rawname[4])
	Next
EndIf
$datafile = _RecursiveFileSearch($sPath, 'datafile\.big', ".", 1, True)
If $datafile[0] >= 1 Then
	$rawname = _PathSplit($datafile[1], $szDrive, $szDir, $szFName, $szExt)
	FileSetAttrib(@ScriptDir & "\data\datafile\*.*", "-R")
	_FileCopyEx($datafile[1], @ScriptDir & "\data\datafile\" & $rawname[3] & $rawname[4])
EndIf
$datafiles = _RecursiveFileSearch($sPath, 'credits\.tsv|.*\.LOC|init.*z\.big|mat\.o|models\.big|profiles\.big', ".", 1, True)
If $datafiles[0] >= 1 Then
	For $datacount = 1 To $datafiles[0]
		$rawname = _PathSplit($datafiles[$datacount], $szDrive, $szDir, $szFName, $szExt)
		FileSetAttrib(@ScriptDir & "\data\*.*", "-R")
		_FileCopyEx($datafiles[$datacount], @ScriptDir & "\data\" & $rawname[3] & $rawname[4])
	Next
EndIf
$moviesfiles = _RecursiveFileSearch($sPath, '.*\.vp6', ".", 1, True)
If $moviesfiles[0] >= 1 Then
	For $moviescount = 1 To $moviesfiles[0]
		$rawname = _PathSplit($moviesfiles[$moviescount], $szDrive, $szDir, $szFName, $szExt)
		FileSetAttrib(@ScriptDir & "\data\frontend\movies\*.*", "-R")
		_FileCopyEx($moviesfiles[$moviescount], @ScriptDir & "\data\frontend\movies\" & $rawname[3] & $rawname[4])
	Next
EndIf
$fontfile = _RecursiveFileSearch($sPath, 'fonts\.big', ".", 1, True)
If $fontfile[0] >= 1 Then
	$rawname = _PathSplit($fontfile[1], $szDrive, $szDir, $szFName, $szExt)
	FileSetAttrib(@ScriptDir & "\data\fonts\*.*", "-R")
	_FileCopyEx($fontfile[1], @ScriptDir & "\data\fonts\" & $rawname[3] & $rawname[4])
EndIf
$igcrsrfile = _RecursiveFileSearch($sPath, 'igcrsr\.fsh', ".", 1, True)
If $igcrsrfile[0] >= 1 Then
	$rawname = _PathSplit($igcrsrfile[1], $szDrive, $szDir, $szFName, $szExt)
	FileSetAttrib(@ScriptDir & "\data\igshapes\*.*", "-R")
	_FileCopyEx($igcrsrfile[1], @ScriptDir & "\data\igshapes\" & $rawname[3] & $rawname[4])
EndIf
$splashfile = _RecursiveFileSearch($sPath, '00000000\.256', ".", 1, True)
If $splashfile[0] >= 1 Then
	$rawname = _PathSplit($splashfile[1], $szDrive, $szDir, $szFName, $szExt)
	FileSetAttrib(@ScriptDir & "\*.*", "-R")
	_FileCopyEx($splashfile[1], @ScriptDir & "\" & $rawname[3] & $rawname[4])
EndIf
$databasefiles = _RecursiveFileSearch($sPath, 'attrib\.dat|bstats\.dat|career\.dat|careerp\.dat|fbstats\.dat|hist\.dat|lhattrib\.dat|lhbstats\.dat|lhpstats\.dat|manager\.dat|org\.dat|pitcher\.dat|progress\.big|pstats\.dat|resign\.csv|rhattrib\.dat|rhbstats\.dat|rhpstats\.dat|rookie\.big|roster\.dat|schedule\.big|team\.dat|tstat\.dat', ".", 1, True)
If $databasefiles[0] >= 1 Then
	For $databasecount = 1 To $databasefiles[0]
		$rawname = _PathSplit($databasefiles[$databasecount], $szDrive, $szDir, $szFName, $szExt)
		FileSetAttrib(@ScriptDir & "\data\database\*.*", "-R")
		_FileCopyEx($databasefiles[$databasecount], @ScriptDir & "\data\database\" & $rawname[3] & $rawname[4])
	Next
EndIf
$aemsfiles = _RecursiveFileSearch($sPath, 'batdit.abk|batmini.abk|crowd4a\.abk|hecklea\.abk|heckleb\.abk|hecklec\.abk|heckled\.abk|hecklee\.abk|ptcmini\.abk|vendor\.abk|vndrcbp\.abk', ".", 1, True)
If $aemsfiles[0] >= 1 Then
	For $aemscount = 1 To $aemsfiles[0]
		$rawname = _PathSplit($aemsfiles[$aemscount], $szDrive, $szDir, $szFName, $szExt)
		FileSetAttrib(@ScriptDir & "\data\audio\aems\*.*", "-R")
		_FileCopyEx($aemsfiles[$aemscount], @ScriptDir & "\data\audio\aems\" & $rawname[3] & $rawname[4])
	Next
EndIf
$cdaemsfiles = _RecursiveFileSearch($sPath, 'batdit.ast|batmini.ast|crowd4a\.ast|hecklea\.ast|heckleb\.ast|hecklec\.ast|heckled\.ast|hecklee\.ast|ptcmini\.ast|vendor\.ast|vndrcbp\.ast', ".", 1, True)
If $cdaemsfiles[0] >= 1 Then
	For $cdaemscount = 1 To $cdaemsfiles[0]
		$rawname = _PathSplit($cdaemsfiles[$cdaemscount], $szDrive, $szDir, $szFName, $szExt)
		FileSetAttrib(@ScriptDir & "\data\audio\cd\aems\*.*", "-R")
		_FileCopyEx($cdaemsfiles[$cdaemscount], @ScriptDir & "\data\audio\cd\aems\" & $rawname[3] & $rawname[4])
	Next
EndIf
$cdbdcstdatfiles = _RecursiveFileSearch($sPath, 'bdcstdat\.big', ".", 1, True)
If $cdbdcstdatfiles[0] >= 1 Then
	$rawname = _PathSplit($cdbdcstdatfiles[1], $szDrive, $szDir, $szFName, $szExt)
	FileSetAttrib(@ScriptDir & "\data\audio\cd\bdcst_mx\*.*", "-R")
	_FileCopyEx($cdbdcstdatfiles[1], @ScriptDir & "\data\audio\cd\bdcst_mx\" & $rawname[3] & $rawname[4])
EndIf
$bdcstdatfiles = _RecursiveFileSearch($sPath, 'bdcsthdr\.big', ".", 1, True)
If $bdcstdatfiles[0] >= 1 Then
	$rawname = _PathSplit($bdcstdatfiles[1], $szDrive, $szDir, $szFName, $szExt)
	FileSetAttrib(@ScriptDir & "\data\audio\bdcst_mx\*.*", "-R")
	_FileCopyEx($bdcstdatfiles[1], @ScriptDir & "\data\audio\bdcst_mx\" & $rawname[3] & $rawname[4])
EndIf
$chantfile = _RecursiveFileSearch($sPath, 'chanthdr\.big', ".", 1, True)
If $chantfile[0] >= 1 Then
	$rawname = _PathSplit($chantfile[1], $szDrive, $szDir, $szFName, $szExt)
	FileSetAttrib(@ScriptDir & "\data\audio\chants\*.*", "-R")
	_FileCopyEx($chantfile[1], @ScriptDir & "\data\audio\chants\" & $rawname[3] & $rawname[4])
EndIf
$cdchantfile = _RecursiveFileSearch($sPath, 'chantdat\.big', ".", 1, True)
If $cdchantfile[0] >= 1 Then
	$rawname = _PathSplit($cdchantfile[1], $szDrive, $szDir, $szFName, $szExt)
	FileSetAttrib(@ScriptDir & "\data\audio\cd\chants\*.*", "-R")
	_FileCopyEx($cdchantfile[1], @ScriptDir & "\data\audio\cd\chants\" & $rawname[3] & $rawname[4])
EndIf
$hmrn_sfxfile = _RecursiveFileSearch($sPath, 'hsfxhdr\.big', ".", 1, True)
If $hmrn_sfxfile[0] >= 1 Then
	$rawname = _PathSplit($hmrn_sfxfile[1], $szDrive, $szDir, $szFName, $szExt)
	FileSetAttrib(@ScriptDir & "\data\audio\hmrn_sfx\*.*", "-R")
	_FileCopyEx($hmrn_sfxfile[1], @ScriptDir & "\data\audio\hmrn_sfx\" & $rawname[3] & $rawname[4])
EndIf
$cdhmrn_sfxfile = _RecursiveFileSearch($sPath, 'hsfxdat\.big', ".", 1, True)
If $cdhmrn_sfxfile[0] >= 1 Then
	$rawname = _PathSplit($cdhmrn_sfxfile[1], $szDrive, $szDir, $szFName, $szExt)
	FileSetAttrib(@ScriptDir & "\data\audio\cd\hmrn_sfx\*.*", "-R")
	_FileCopyEx($cdhmrn_sfxfile[1], @ScriptDir & "\data\audio\cd\hmrn_sfx\" & $rawname[3] & $rawname[4])
EndIf
$stdmfile = _RecursiveFileSearch($sPath, 'stdmhdr\.big', ".", 1, True)
If $stdmfile[0] >= 1 Then
	$rawname = _PathSplit($stdmfile[1], $szDrive, $szDir, $szFName, $szExt)
	FileSetAttrib(@ScriptDir & "\data\audio\stadium\*.*", "-R")
	_FileCopyEx($stdmfile[1], @ScriptDir & "\data\audio\stadium\" & $rawname[3] & $rawname[4])
EndIf
$cdstdmfile = _RecursiveFileSearch($sPath, 'stdmdat\.big', ".", 1, True)
If $cdstdmfile[0] >= 1 Then
	$rawname = _PathSplit($cdstdmfile[1], $szDrive, $szDir, $szFName, $szExt)
	FileSetAttrib(@ScriptDir & "\data\audio\cd\stadium\*.*", "-R")
	_FileCopyEx($cdstdmfile[1], @ScriptDir & "\data\audio\cd\stadium\" & $rawname[3] & $rawname[4])
EndIf
$plyr_chtfile = _RecursiveFileSearch($sPath, 'plchthdr\.big', ".", 1, True)
If $plyr_chtfile[0] >= 1 Then
	$rawname = _PathSplit($plyr_chtfile[1], $szDrive, $szDir, $szFName, $szExt)
	FileSetAttrib(@ScriptDir & "\data\audio\plyr_cht\*.*", "-R")
	_FileCopyEx($plyr_chtfile[1], @ScriptDir & "\data\audio\plyr_cht\" & $rawname[3] & $rawname[4])
EndIf
$cdplyr_chtfile = _RecursiveFileSearch($sPath, 'plchtdat\.big', ".", 1, True)
If $cdplyr_chtfile[0] >= 1 Then
	$rawname = _PathSplit($cdplyr_chtfile[1], $szDrive, $szDir, $szFName, $szExt)
	FileSetAttrib(@ScriptDir & "\data\audio\cd\plyr_cht\*.*", "-R")
	_FileCopyEx($cdplyr_chtfile[1], @ScriptDir & "\data\audio\cd\plyr_cht\" & $rawname[3] & $rawname[4])
EndIf
$rallyfile = _RecursiveFileSearch($sPath, 'rallyhdr\.big', ".", 1, True)
If $rallyfile[0] >= 1 Then
	$rawname = _PathSplit($rallyfile[1], $szDrive, $szDir, $szFName, $szExt)
	FileSetAttrib(@ScriptDir & "\data\audio\rally\*.*", "-R")
	_FileCopyEx($rallyfile[1], @ScriptDir & "\data\audio\rally\" & $rawname[3] & $rawname[4])
EndIf
$cdrallyfile = _RecursiveFileSearch($sPath, 'rallyhdr\.big', ".", 1, True)
If $cdrallyfile[0] >= 1 Then
	$cdrawname = _PathSplit($cdrallyfile[1], $szDrive, $szDir, $szFName, $szExt)
	FileSetAttrib(@ScriptDir & "\data\audio\cd\rally\*.*", "-R")
	_FileCopyEx($cdrallyfile[1], @ScriptDir & "\data\audio\cd\rally\" & $rawname[3] & $rawname[4])
EndIf
$spch_pbpfiles = _RecursiveFileSearch($sPath, 'pbphdr\.big|stdnmhdr\.big', ".", 1, True)
If $spch_pbpfiles[0] >= 1 Then
	For $spch_pbpcount = 1 To $spch_pbpfiles[0]
		$rawname = _PathSplit($spch_pbpfiles[$spch_pbpcount], $szDrive, $szDir, $szFName, $szExt)
		FileSetAttrib(@ScriptDir & "\data\audio\spch_pbp\*.*", "-R")
		_FileCopyEx($spch_pbpfiles[$spch_pbpcount], @ScriptDir & "\data\audio\spch_pbp\" & $rawname[3] & $rawname[4])
	Next
EndIf
$cdspch_pbpfiles = _RecursiveFileSearch($sPath, 'pbpdat\.big|stdnmdat\.big', ".", 1, True)
If $cdspch_pbpfiles[0] >= 1 Then
	For $cdspch_pbpcount = 1 To $cdspch_pbpfiles[0]
		$rawname = _PathSplit($cdspch_pbpfiles[$cdspch_pbpcount], $szDrive, $szDir, $szFName, $szExt)
		FileSetAttrib(@ScriptDir & "\data\audio\cd\spch_pbp\*.*", "-R")
		_FileCopyEx($cdspch_pbpfiles[$cdspch_pbpcount], @ScriptDir & "\data\audio\cd\spch_pbp\" & $rawname[3] & $rawname[4])
	Next
EndIf
$musicfiles = _RecursiveFileSearch($sPath, '.*\.asf', ".", 1, True)
If $musicfiles[0] >= 1 Then
	For $musiccount = 1 To $musicfiles[0]
		$rawname = _PathSplit($musicfiles[$musiccount], $szDrive, $szDir, $szFName, $szExt)
		FileSetAttrib(@ScriptDir & "\data\audio\cd\music\*.*", "-R")
		_FileCopyEx($musicfiles[$musiccount], @ScriptDir & "\data\audio\cd\music\" & $rawname[3] & $rawname[4])
	Next
EndIf
If FileExists(@ScriptDir & "\install\spch_pbp\pnamehdr.big") Then
	FileSetAttrib(@ScriptDir & "\data\audio\spch_pbp\pnamehdr.big", "-R")
	_FileCopyEx(@ScriptDir & "\install\spch_pbp\pnamehdr.big", @ScriptDir & "\data\audio\spch_pbp\pnamehdr.big")
EndIf
If FileExists(@ScriptDir & "\install\spch_pbp\tnamehdr.big") Then
	FileSetAttrib(@ScriptDir & "\data\audio\spch_pbp\tnamehdr.big", "-R")
	_FileCopyEx(@ScriptDir & "\install\spch_pbp\tnamehdr.big", @ScriptDir & "\data\audio\spch_pbp\tnamehdr.big")
EndIf
If FileExists(@ScriptDir & "\install\spch_pa\pnamehdr.big") Then
	FileSetAttrib(@ScriptDir & "\data\audio\spch_pa\pnamehdr.big", "-R")
	_FileCopyEx(@ScriptDir & "\install\spch_pa\pnamehdr.big", @ScriptDir & "\data\audio\spch_pa\pnamehdr.big")
EndIf
If FileExists(@ScriptDir & "\install\spch_pa\tnamehdr.big") Then
	FileSetAttrib(@ScriptDir & "\data\audio\spch_pa\tnamehdr.big", "-R")
	_FileCopyEx(@ScriptDir & "\install\spch_pa\tnamehdr.big", @ScriptDir & "\data\audio\spch_pa\tnamehdr.big")
EndIf
If FileExists(@ScriptDir & "\install\spch_pbp\pnamedat.big") Then
	FileSetAttrib(@ScriptDir & "\data\audio\cd\spch_pbp\pnamedat.big", "-R")
	_FileCopyEx(@ScriptDir & "\install\spch_pbp\pnamedat.big", @ScriptDir & "\data\audio\cd\spch_pbp\pnamedat.big")
EndIf
If FileExists(@ScriptDir & "\install\spch_pbp\tnamedat.big") Then
	FileSetAttrib(@ScriptDir & "\data\audio\cd\spch_pbp\tnamedat.big", "-R")
	_FileCopyEx(@ScriptDir & "\install\spch_pbp\tnamedat.big", @ScriptDir & "\data\audio\cd\spch_pbp\tnamedat.big")
EndIf
If FileExists(@ScriptDir & "\install\spch_pa\pnamedat.big") Then
	FileSetAttrib(@ScriptDir & "\data\audio\cd\spch_pa\pnamedat.big", "-R")
	_FileCopyEx(@ScriptDir & "\install\spch_pa\pnamedat.big", @ScriptDir & "\data\audio\cd\spch_pa\pnamedat.big")
EndIf
If FileExists(@ScriptDir & "\install\spch_pa\tnamedat.big") Then
	FileSetAttrib(@ScriptDir & "\data\audio\cd\spch_pa\tnamedat.big", "-R")
	_FileCopyEx(@ScriptDir & "\install\spch_pa\tnamedat.big", @ScriptDir & "\data\audio\cd\spch_pa\tnamedat.big")
EndIf
SplashOff()
FileDelete(@ScriptDir & "\completed.bmp")
#endregion copyfiles
#region installfiles
FileInstall("installing.bmp", @ScriptDir & "\installing.bmp")
SplashImageOn("Please Wait", @ScriptDir & "\installing.bmp", 500, 200, -1, -1, 18)

#region uniform_previews
$uniformpreviewfiles = _RecursiveFileSearch($sPath, '^\d{3}\D\.bmp', ".", 1, True)
If $uniformpreviewfiles[0] >= 1 Then
	For $uniformportraitscount = 1 To $uniformpreviewfiles[0]
		$rawname = _PathSplit($uniformpreviewfiles[$uniformportraitscount], $szDrive, $szDir, $szFName, $szExt)
		DirCreate(@ScriptDir & "\install\UISuni-portrait\" & StringTrimRight($rawname[3], 1) & "_")
		FileCopy($uniformpreviewfiles[$uniformportraitscount], @ScriptDir & "\install\UISuni-portrait\" & StringTrimRight($rawname[3], 1) & "_\" & $rawname[3] & $rawname[4], 9)
		FileInstall("020a.fsh", @ScriptDir & "\install\UISuni-portrait\" & $rawname[3] & ".fsh")
		RunWait('dossr ' & $rawname[3] & '.fsh "020a" "' & $rawname[3] & '"', @ScriptDir & "\install\UISuni-portrait")
	Next
	For $previewteamraw = 0 To 123
		$previewteam = StringFormat("%.3i", $previewteamraw)
		If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "_") Then
			RunWait('fifafs -e "' & @ScriptDir & '\data\frontend\uniforms.big" ' & $previewteam & '.fsh ' & $previewteam & '.fsh', @ScriptDir & '\install\UISuni-portrait')
			RunWait("fshline " & $previewteam & ".fsh", @ScriptDir & "\install\UISuni-portrait")
			RunWait("png2bmp *.png", @ScriptDir & "\install\UISuni-portrait\" & $previewteam)
			FileCopy(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "_\*.bmp", @ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\*.bmp", 9)
			$file = FileOpen(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\index.fsh", 2)
			FileWriteLine($file, "NFSHTool generated file -- be very careful when editing" & @CRLF)
			FileWriteLine($file, $previewteam & ".fsh" & @CRLF)
			FileWriteLine($file, "FSH" & @CRLF)
			$count = _FileListToArray(@ScriptDir & "\install\UISuni-portrait\" & $previewteam, "*.bmp", 1)
			FileWriteLine($file, "SHPI " & $count[0] & " objects, tag G357" & @CRLF)
			FileInstall("alpha.bmp", @ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\alpha.bmp", 2)
			FileWriteLine($file, "BUFSZ 2287896" & @CRLF)
			FileWriteLine($file, "NOGLOBPAL" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "a.bmp") Then FileWriteLine($file, $previewteam & "a " & $previewteam & "a.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "a%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "b.bmp") Then FileWriteLine($file, $previewteam & "b " & $previewteam & "b.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "b%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "c.bmp") Then FileWriteLine($file, $previewteam & "c " & $previewteam & "c.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "c%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "d.bmp") Then FileWriteLine($file, $previewteam & "d " & $previewteam & "d.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "d%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "e.bmp") Then FileWriteLine($file, $previewteam & "e " & $previewteam & "e.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "e%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "f.bmp") Then FileWriteLine($file, $previewteam & "f " & $previewteam & "f.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "f%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "g.bmp") Then FileWriteLine($file, $previewteam & "g " & $previewteam & "g.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "g%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "h.bmp") Then FileWriteLine($file, $previewteam & "h " & $previewteam & "h.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "h%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "i.bmp") Then FileWriteLine($file, $previewteam & "i " & $previewteam & "i.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "i%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "j.bmp") Then FileWriteLine($file, $previewteam & "j " & $previewteam & "j.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "j%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "k.bmp") Then FileWriteLine($file, $previewteam & "k " & $previewteam & "k.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "k%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "l.bmp") Then FileWriteLine($file, $previewteam & "l " & $previewteam & "l.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "l%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "m.bmp") Then FileWriteLine($file, $previewteam & "m " & $previewteam & "m.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "m%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "n.bmp") Then FileWriteLine($file, $previewteam & "n " & $previewteam & "n.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "n%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "o.bmp") Then FileWriteLine($file, $previewteam & "o " & $previewteam & "o.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "o%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "p.bmp") Then FileWriteLine($file, $previewteam & "p " & $previewteam & "p.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "p%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "q.bmp") Then FileWriteLine($file, $previewteam & "q " & $previewteam & "q.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "q%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "u.bmp") Then FileWriteLine($file, $previewteam & "u " & $previewteam & "u.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "u%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "r.bmp") Then FileWriteLine($file, $previewteam & "r " & $previewteam & "r.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "r%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "s.bmp") Then FileWriteLine($file, $previewteam & "s " & $previewteam & "s.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "s%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "t.bmp") Then FileWriteLine($file, $previewteam & "t " & $previewteam & "t.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "t%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "u.bmp") Then FileWriteLine($file, $previewteam & "u " & $previewteam & "u.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "u%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "v.bmp") Then FileWriteLine($file, $previewteam & "v " & $previewteam & "v.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "v%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "w.bmp") Then FileWriteLine($file, $previewteam & "w " & $previewteam & "w.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "w%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "x.bmp") Then FileWriteLine($file, $previewteam & "x " & $previewteam & "x.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "x%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "y.bmp") Then FileWriteLine($file, $previewteam & "y " & $previewteam & "y.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "y%00%00%00%00%00%00%00%00" & @CRLF)
			If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam & "z.bmp") Then FileWriteLine($file, $previewteam & "z " & $previewteam & "z.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "z%00%00%00%00%00%00%00%00" & @CRLF)
			FileWriteLine($file, "#END" & @CRLF)
			FileClose($file)
			RunWait("nfshtool -s index.fsh", @ScriptDir & "\install\UISuni-portrait\" & $previewteam)
		EndIf
	Next
	FileMove(@ScriptDir & "\install\UISuni-portrait\*.fsh", @ScriptDir & "\install\*.fsh")
	DirRemove(@ScriptDir & "\install\UISuni-portrait", 1)
EndIf
#endregion uniform_previews


$logosfiles = _RecursiveFileSearch($sPath, 'l\d{3}\.fsh', ".", 1, True)
If $logosfiles[0] >= 1 Then
	For $logosscount = 1 To $logosfiles[0]
		$rawname = _PathSplit($logosfiles[$logosscount], $szDrive, $szDir, $szFName, $szExt)
		DirCreate(@ScriptDir & "\install\UISlogos")
		FileCopy($logosfiles[$logosscount], @ScriptDir & "\install\UISlogos\" & $rawname[3] & $rawname[4], 9)
	Next
	RunWait("tyzip data\frontend\logos.big install\UISlogos\*.*", @ScriptDir, @SW_HIDE)
EndIf

$uniformsfiles = _RecursiveFileSearch($sPath, '^\d{3}\.fsh|^\d{3}\D\.fsh', ".", 1, True)
If $uniformsfiles[0] >= 1 Then
	For $uniformsscount = 1 To $uniformsfiles[0]
		$rawname = _PathSplit($uniformsfiles[$uniformsscount], $szDrive, $szDir, $szFName, $szExt)
		DirCreate(@ScriptDir & "\install\UISuniforms")
		FileCopy($uniformsfiles[$uniformsscount], @ScriptDir & "\install\UISuniforms\" & $rawname[3] & $rawname[4], 9)
	Next
	RunWait("tyzip data\frontend\uniforms.big install\UISuniforms\*.*", @ScriptDir, @SW_HIDE)
EndIf


$fieldsfiles = _RecursiveFileSearch($sPath, '1a1f\.fsh|1a2f\.fsh|1a3f\.fsh|2a1f\.fsh|2a2f\.fsh|2a3f\.fsh|3a1f\.fsh|3a2f\.fsh|3a3f\.fsh|anaf\.fsh|arlf\.fsh|astf\.fsh|banf\.fsh|cinf\.fsh|citf\.fsh|clef\.fsh|cmdf\.fsh|comf\.fsh|corf\.fsh|crof\.fsh|dodf\.fsh|edif\.fsh|fecf\.fsh|fenf\.fsh|forf\.fsh|gref\.fsh|grif\.fsh|hirf\.fsh|hubf\.fsh|jacf\.fsh|kauf\.fsh|metf\.fsh|milf\.fsh|minf\.fsh|netf\.fsh|olyf\.fsh|pacf\.fsh|petf\.fsh|pncf\.fsh|polf\.fsh|prof\.fsh|quaf\.fsh|rfkf\.fsh|saff\.fsh|shef\.fsh|shif\.fsh|skyf\.fsh|spof\.fsh|stlf\.fsh|tigf\.fsh|trof\.fsh|turf\.fsh|uscf\.fsh|vetf\.fsh|wrif\.fsh|yanf\.fsh', ".", 1, True)
If $fieldsfiles[0] >= 1 Then
	For $fieldsscount = 1 To $fieldsfiles[0]
		$rawname = _PathSplit($fieldsfiles[$fieldsscount], $szDrive, $szDir, $szFName, $szExt)
		DirCreate(@ScriptDir & "\install\UISfields")
		FileCopy($fieldsfiles[$fieldsscount], @ScriptDir & "\install\UISfields\" & $rawname[3] & $rawname[4], 9)
	Next
	RunWait("tyzip data\frontend\fields.big install\UISfields\*.*", @ScriptDir, @SW_HIDE)
EndIf


$stadiumsfiles = _RecursiveFileSearch($sPath, '1a01\.fsh|1a02\.fsh|1a03\.fsh|a1a01\.fsh|aa01\.fsh|aa02\.fsh|aa03\.fsh|aaa1\.fsh|aaa2\.fsh|aaa3\.fsh|al\.fsh|ana\.fsh|anan\.fsh|ari\.fsh|arin\.fsh|astr\.fsh|atl\.fsh|atln\.fsh|bal\.fsh|baln\.fsh|bos\.fsh|bosn\.fsh|chc\.fsh|chcn\.fsh|cin\.fsh|cine\.fsh|cinn\.fsh|cit\.fsh|citn\.fsh|cle\.fsh|clen\.fsh|clev\.fsh|col\.fsh|coln\.fsh|cros\.fsh|cws\.fsh|cwsn\.fsh|det\.fsh|detn\.fsh|fenw\.fsh|fla\.fsh|flan\.fsh|forb\.fsh|giff\.fsh|hira\.fsh|hou\.fsh|houn\.fsh|kc\.fsh|kcn\.fsh|la\.fsh|lan\.fsh|metr\.fsh|mil\.fsh|miln\.fsh|min\.fsh|mon\.fsh|nl\.fsh|nln\.fsh|nym\.fsh|nymn\.fsh|nyy\.fsh|nyyn\.fsh|oak\.fsh|oakn\.fsh|olym\.fsh|phi\.fsh|phin\.fsh|pit\.fsh|pitn\.fsh|polo\.fsh|qual\.fsh|rfk\.fsh|rfkn\.fsh|sd\.fsh|sdn\.fsh|sea\.fsh|sean\.fsh|sf\.fsh|sfn\.fsh|shib\.fsh|sprt\.fsh|stl\.fsh|stln\.fsh|tb\.fsh|tex\.fsh|texn\.fsh|tigr\.fsh|tor\.fsh|torn\.fsh|ven\.fsh|venn\.fsh|vete\.fsh', ".", 1, True)
If $stadiumsfiles[0] >= 1 Then
	For $stadiumsscount = 1 To $stadiumsfiles[0]
		$rawname = _PathSplit($stadiumsfiles[$stadiumsscount], $szDrive, $szDir, $szFName, $szExt)
		DirCreate(@ScriptDir & "\install\UISstadiums")
		FileCopy($stadiumsfiles[$stadiumsscount], @ScriptDir & "\install\UISstadiums\" & $rawname[3] & $rawname[4], 9)
	Next
	RunWait("tyzip data\frontend\stadiums.big install\UISstadiums\*.*", @ScriptDir, @SW_HIDE)
EndIf

$portraitfiles = _RecursiveFileSearch($sPath, '^\d{4}\.fsh', ".", 1, True)
If $portraitfiles[0] >= 1 Then
	For $portraitscount = 1 To $portraitfiles[0]
		$rawname = _PathSplit($portraitfiles[$portraitscount], $szDrive, $szDir, $szFName, $szExt)
		DirCreate(@ScriptDir & "\install\UISportrait")
		FileCopy($portraitfiles[$portraitscount], @ScriptDir & "\install\UISportrait\" & $rawname[3] & $rawname[4], 9)
	Next
	RunWait("tyzip data\frontend\portrait.big install\UISportrait\*.*", @ScriptDir, @SW_HIDE)

EndIf
$modelsfiles = _RecursiveFileSearch($sPath, 'a\d{3}\D\.fsh|f\d{3}\D\.fsh|g0[0-4][0-9]\.fsh|g0[0-4][0-9]\.orl|g0[0-4][0-9]\.ord|umpirec\.fsh|umpire\.fsh|c\d{3}\.fsh|c\d{3}\.orl|c\d{3}\.ord|[0-6]gote_[fh]\.fsh|teamfont\.fsh|u[0-1][0-9][0-9]\D\.fsh|uniform\.fsh|[0-6]beard_f\.fsh|[0-8]cornr\.fsh|[0-6]mulet_[l|s]\.fsh|[0-6]musta_[abcd]\.fsh|[0-6]shrt[abc]_[ls]\.fsh|[0-6]soulp\.fsh', ".", 1, True)
If $modelsfiles[0] >= 1 Then
	For $modelscount = 1 To $modelsfiles[0]
		$rawname = _PathSplit($modelsfiles[$modelscount], $szDrive, $szDir, $szFName, $szExt)
		DirCreate(@ScriptDir & "\install\UISmodels")
		FileCopy($modelsfiles[$modelscount], @ScriptDir & "\install\UISmodels\" & $rawname[3] & $rawname[4], 9)
	Next
	FileSetAttrib(@ScriptDir & "\data\models.big", "-R")
	RunWait("tyzip data\models.big install\UISmodels\*.* ", @ScriptDir, @SW_HIDE)


EndIf
$bkgndsfiles = _RecursiveFileSearch($sPath, '^00be\.fsh|^00bp\.fsh|^00br\.fsh|^00bs\.fsh|^00bt\.fsh|^01be\.fsh|^01bg\.fsh|^02bd\.fsh|^03ba\.fsh|^03be\.fsh|^03bf\.fsh|^03bg\.fsh|^03bh\.fsh|^04ba\.fsh|^04be\.fsh|^05bd\.fsh|^05be\.fsh|^06be\.fsh|^07bd\.fsh|^08bd\.fsh|^08be\.fsh|^09bd\.fsh|^09be\.fsh|^10bd\.fsh|^10be\.fsh|^10bf\.fsh|^11bd\.fsh|^11be\.fsh|^12be\.fsh|^13bd\.fsh|^13be\.fsh|^13bf\.fsh|^13bg\.fsh|^13bh\.fsh|^14bd\.fsh|^14be\.fsh|^15be\.fsh|^16be\.fsh|^17be\.fsh|^18be\.fsh|^19be\.fsh|^20be\.fsh|^21bd\.fsh|^21be\.fsh|^22bc\.fsh|^22bd\.fsh|^23bd\.fsh|^24bd\.fsh|^24be\.fsh|^25bd\.fsh|^25be\.fsh|^27bd\.fsh|^28bd\.fsh|^29bd\.fsh|^29be\.fsh|^29bf\.fsh|^29bg\.fsh|^32bd\.fsh|^34bd\.fsh|^37bd\.fsh|^39bd\.fsh|^40bd\.fsh|^44bd\.fsh|^45bd\.fsh|^49bd\.fsh|^50bd\.fsh|^51bd\.fsh|^52bd\.fsh|^55bd\.fsh|^56bd\.fsh|^58bd\.fsh|^59bd\.fsh|^60st\.fsh|^61st\.fsh|^62st\.fsh|^63st\.fsh|^64st\.fsh|^65st\.fsh|^70om\.fsh|^80cy\.fsh|^80mg\.fsh|^81cy\.fsh|^81mg\.fsh|^82cy\.fsh|^82om\.fsh|^83cy\.fsh|^84cy\.fsh|^85cy\.fsh|^86cy\.fsh|^87cy\.fsh|^88cy\.fsh|^89cy\.fsh|^90\.fsh|^90cy\.fsh|^91\.fsh|^91cy\.fsh|^92\.fsh|^92cy\.fsh|^93\.fsh|^93cy\.fsh|^94\.fsh|^94cy\.fsh|^95\.fsh|^95cy\.fsh|^96\.fsh', ".", 1, True)
If $bkgndsfiles[0] >= 1 Then
	For $bkgndscount = 1 To $bkgndsfiles[0]
		$rawname = _PathSplit($bkgndsfiles[$bkgndscount], $szDrive, $szDir, $szFName, $szExt)
		DirCreate(@ScriptDir & "\install\UISbkgnds")
		FileCopy($bkgndsfiles[$bkgndscount], @ScriptDir & "\install\UISbkgnds\" & $rawname[3] & $rawname[4], 9)
	Next
	RunWait("tyzip data\frontend\bkgnds.big install\UISbkgnds\*.*", @ScriptDir, @SW_HIDE)
EndIf


$rawdatafiles = _RecursiveFileSearch($sPath, '.*day.*\.txt|.*nite.*\.txt|.*dusk.*\.txt|.*dome.*\.txt|.*night.*\.txt|script.*\.txt|datafile\.txt|.*flow\.txt', ".", 1, True)
If $rawdatafiles[0] >= 1 Then
	For $rawdatacount = 1 To $rawdatafiles[0]
		$rawname = _PathSplit($rawdatafiles[$rawdatacount], $szDrive, $szDir, $szFName, $szExt)
		DirCreate(@ScriptDir & "\install\UISrawdata")
		FileCopy($rawdatafiles[$rawdatacount], @ScriptDir & "\install\UISrawdata\" & $rawname[3] & $rawname[4], 9)
	Next
	RunWait("tyzip data\datafile\datafile.big install\UISrawdata\*.*", @ScriptDir, @SW_HIDE)
EndIf

$pnamedatfiles = _RecursiveFileSearch($sPath, '\d{4}\.dat', ".", 1, True)
If $pnamedatfiles[0] >= 1 Then
	For $pnamedatcount = 1 To $pnamedatfiles[0]
		$rawname = _PathSplit($pnamedatfiles[$pnamedatcount], $szDrive, $szDir, $szFName, $szExt)
		DirCreate(@ScriptDir & "\install\UISpnamedat")
		FileCopy($pnamedatfiles[$pnamedatcount], @ScriptDir & "\install\UISpnamedat\" & $rawname[3] & $rawname[4], 9)
	Next
	RunWait("fifafs -ar data\audio\cd\spch_pa\pnamedat.big install\UISpnamedat\*.*", @ScriptDir)
EndIf


$pnamehdrfiles = _RecursiveFileSearch($sPath, '\d{4}\.hdr', ".", 1, True)
If $pnamehdrfiles[0] >= 1 Then
	For $pnamehdrcount = 1 To $pnamehdrfiles[0]
		$rawname = _PathSplit($pnamehdrfiles[$pnamehdrcount], $szDrive, $szDir, $szFName, $szExt)
		DirCreate(@ScriptDir & "\install\UISpnamehdr")
		FileCopy($pnamehdrfiles[$pnamehdrcount], @ScriptDir & "\install\UISpnamehdr\" & $rawname[3] & $rawname[4], 9)
	Next
	RunWait("fifafs -ar data\audio\spch_pa\pnamehdr.big install\UISpnamehdr\*.*", @ScriptDir)
EndIf


$pbpnamedatfiles = _RecursiveFileSearch($sPath, '\d{4}\D\.dat', ".", 1, True)
If $pbpnamedatfiles[0] >= 1 Then
	For $pbpnamedatcount = 1 To $pbpnamedatfiles[0]
		$rawname = _PathSplit($pbpnamedatfiles[$pbpnamedatcount], $szDrive, $szDir, $szFName, $szExt)
		DirCreate(@ScriptDir & "\install\UISpbppnamedat")
		FileCopy($pbpnamedatfiles[$pbpnamedatcount], @ScriptDir & "\install\UISpbpnamedat\" & $rawname[3] & $rawname[4], 9)
	Next
	RunWait("fifafs -ar data\audio\cd\spch_pbp\pnamedat.big install\UISpbpnamedat\*.*", @ScriptDir)
EndIf


$pbpnamehdrfiles = _RecursiveFileSearch($sPath, '\d{4}\D\.hdr', ".", 1, True)
If $pbpnamehdrfiles[0] >= 1 Then
	For $pbpnamehdrcount = 1 To $pbpnamehdrfiles[0]
		$rawname = _PathSplit($pbpnamehdrfiles[$pbpnamehdrcount], $szDrive, $szDir, $szFName, $szExt)
		DirCreate(@ScriptDir & "\install\UISpbpnamehdr")
		FileCopy($pbpnamehdrfiles[$pbpnamehdrcount], @ScriptDir & "\install\UISpbpnamehdr\" & $rawname[3] & $rawname[4], 9)
	Next
	RunWait("fifafs -ar data\audio\spch_pbp\pnamehdr.big install\UISpbpnamehdr\*.*", @ScriptDir)
EndIf


If FileExists(@ScriptDir & "\fifafs_script.txt") Then RunWait("fifafs fifafs_script.txt", @ScriptDir)
If FileExists(@ScriptDir & "\install\stdnmhdr") Then RunWait("fifafs -ar data\audio\spch_pbp\stdnmhdr.big install\stdnmhdr\*.*", @ScriptDir)
If FileExists(@ScriptDir & "\install\stdnmdat") Then RunWait("fifafs -ar data\audio\cd\spch_pbp\stdnmdat.big install\stdnmdat\*.*", @ScriptDir)
If FileExists(@ScriptDir & "\install\pbp-tnamehdr") Then RunWait("fifafs -ar data\audio\spch_pbp\tnamehdr.big install\pbp-tnamehdr\*.*", @ScriptDir)
If FileExists(@ScriptDir & "\install\pbp-tnamedat") Then RunWait("fifafs -ar data\audio\cd\spch_pbp\tnamedat.big install\pbp-tnamedat\*.*", @ScriptDir)
If FileExists(@ScriptDir & "\install\pa-tnamehdr") Then RunWait("fifafs -ar data\audio\spch_pa\tnamehdr.big install\pa-tnamehdr\*.*", @ScriptDir)
If FileExists(@ScriptDir & "\install\pa-tnamedat") Then RunWait("fifafs -ar data\audio\cd\spch_pa\tnamedat.big install\pa-tnamedat\*.*", @ScriptDir)


#region init-files
$initstayfiles = _RecursiveFileSearch($sPath, 'ball\.o|bat\.o|batshadw\.o|bgbody\.ord|bghead\.ord|bghead04\.ord|brknbat\.o|collbody\.gld|hibody\.ord|hishadow\.o|lobody\.ord|lohead\.ord|lohead04\.ord|loshadow\.o|mebody\.ord|mehead\.ord|mehead04\.ord|ball\.fsh|ballshdw\.fsh|ballsprt\.fsh|basebody\.fsh|basehead\.fsh|bat\.fsh|cglv\.fsh|fglv\.fsh|flesh\.fsh|gagnegogglesframe\.fsh|gagnegoggleslens\.fsh|helmenvm\.fsh|johndamonhair\.fsh|majt\.fsh|mannyramirezhair\.fsh|white\.fsh', ".", 1, True)
If $initstayfiles[0] >= 1 Then
	For $initstaycount = 1 To $initstayfiles[0]
		$rawname = _PathSplit($initstayfiles[$initstaycount], $szDrive, $szDir, $szFName, $szExt)
		DirCreate(@ScriptDir & "\install\UISinitstay")
		FileCopy($initstayfiles[$initstaycount], @ScriptDir & "\install\UISinitstay\" & $rawname[3] & $rawname[4], 9)
	Next
	$file = FileOpen(@ScriptDir & "\initstay.txt", 1)
	FileWriteLine($file, "mountbig initstay.big , stay" & @CRLF)
	If FileExists(@ScriptDir & "\install\UISinitstay\ball.fsh") Then FileWriteLine($file, "-ar models/textures/ball.fsh , install\UISinitstay\ball.fsh , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\ballshdw.fsh") Then FileWriteLine($file, "-ar models/textures/ballshdw.fsh , install\UISinitstay\ballshdw.fsh , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\ballsprt.fsh") Then FileWriteLine($file, "-ar models/textures/ballsprt.fsh , install\UISinitstay\ballsprt.fsh , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\basebody.fsh") Then FileWriteLine($file, "-ar models/textures/basebody.fsh , install\UISinitstay\basebody.fsh , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\basehead.fsh") Then FileWriteLine($file, "-ar models/textures/basehead.fsh , install\UISinitstay\basehead.fsh , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\bat.fsh") Then FileWriteLine($file, "-ar models/textures/bat.fsh , install\UISinitstay\bat.fsh , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\cglv.fsh") Then FileWriteLine($file, "-ar models/textures/cglv.fsh , install\UISinitstay\cglv.fsh , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\fglv.fsh") Then FileWriteLine($file, "-ar models/textures/fglv.fsh , install\UISinitstay\fglv.fsh , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\flesh.fsh") Then FileWriteLine($file, "-ar models/textures/flesh.fsh , itstall\flesh.fsh , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\gagnegogglesframe.fsh") Then FileWriteLine($file, "-ar models/textures/gagnegogglesframe.fsh , install\UISinitstay\gagnegogglesframe.fsh , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\gagnegoggleslens.fsh") Then FileWriteLine($file, "-ar models/textures/gagnegoggleslens.fsh , install\UISinitstay\gagnegoggleslens.fsh , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\helmenvm.fsh") Then FileWriteLine($file, "-ar models/textures/helmenvm.fsh , install\UISinitstay\helmenvm.fsh , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\johndamonhair.fsh") Then FileWriteLine($file, "-ar models/textures/johndamonhair.fsh , instally\johndamonhair.fsh , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\majt.fsh") Then FileWriteLine($file, "-ar models/textures/majt.fsh , install\UISinitstay\majt.fsh , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\mannyramirezhair.fsh") Then FileWriteLine($file, "-ar models/textures/mannyramirezhair.fsh , install\UISinitstay\mannyramirezhair.fsh , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\white.fsh") Then FileWriteLine($file, "-ar models/textures/white.fsh , install\UISinitstay\white.fsh , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\ball.o") Then FileWriteLine($file, "-ar models/ball.o , install\UISinitstay\ball.o , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\bat.o") Then FileWriteLine($file, "-ar models/bat.o , install\UISinitstay\bat.o , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\batshadw.o") Then FileWriteLine($file, "-ar models/batshadw.o , install\UISinitstay\batshadw.o , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\bgbody.ord") Then FileWriteLine($file, "-ar models/bgbody.ord , install\UISinitstay\bgbody.ord , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\bghead.ord") Then FileWriteLine($file, "-ar models/bghead.ord , install\UISinitstay\bghead.ord , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\bghead04.ord") Then FileWriteLine($file, "-ar models/bghead04.ord , install\UISinitstay\bghead04.ord , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\brknbat.o") Then FileWriteLine($file, "-ar models/brknbat.o , install\UISinitstay\brknbat.o , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\collbody.gld") Then FileWriteLine($file, "-ar models/collbody.gld , install\UISinitstay\collbody.gld , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\hibody.ord") Then FileWriteLine($file, "-ar models/hibody.ord , install\UISinitstay\hibody.ord , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\hishadow.o") Then FileWriteLine($file, "-ar models/hishadow.o , install\UISinitstay\hishadow.o , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\lobody.ord") Then FileWriteLine($file, "-ar models/lobody.ord , install\UISinitstay\lobody.ord , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\lohead.ord") Then FileWriteLine($file, "-ar models/lohead.ord , install\UISinitstay\lohead.ord , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\lohead04.ord") Then FileWriteLine($file, "-ar models/lohead04.ord , install\UISinitstay\lohead04.ord , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\loshadow.o") Then FileWriteLine($file, "-ar models/loshadow.o , install\UISinitstay\loshadow.o , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\mebody.ord") Then FileWriteLine($file, "-ar models/mebody.ord , install\UISinitstay\mebody.ord , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\mehead.ord") Then FileWriteLine($file, "-ar models/mehead.ord , install\UISinitstay\mehead.ord , stay")
	If FileExists(@ScriptDir & "\install\UISinitstay\mehead04.ord") Then FileWriteLine($file, "-ar models/mehead04.ord , install\UISinitstay\mehead04.ord , stay")
	FileClose($file)
	RunWait("fifaFS.exe -e data\initstaz.big initstay.big initstay.big", @ScriptDir)
	RunWait("eazip -u initstay.big", @ScriptDir)
	RunWait("fifafs.exe initstay.txt", @ScriptDir)
	RunWait("eazip -c initstay.big", @ScriptDir)
	RunWait("fifafs -ar data\initstaz.big initstay.big", @ScriptDir)
	FileDelete(@ScriptDir & "\initstay.big")
	FileDelete(@ScriptDir & "\initstay.txt")
EndIf
$initpurgefiles = _RecursiveFileSearch($sPath, 'bgbody\.orl|bghead\.orl|bghead04\.orl|hibody\.orl|lobody\.orl|lohead\.orl|lohead04\.orl|mebody\.orl|mehead\.orl|mehead04\.orl', ".", 1, True)
If $initpurgefiles[0] >= 1 Then
	For $initpurgecount = 1 To $initpurgefiles[0]
		$rawname = _PathSplit($initpurgefiles[$initpurgecount], $szDrive, $szDir, $szFName, $szExt)
		DirCreate(@ScriptDir & "\install\UISinitpurge")
		FileCopy($initpurgefiles[$initpurgecount], @ScriptDir & "\install\UISinitpurge\" & $rawname[3] & $rawname[4], 9)
	Next
	$file = FileOpen(@ScriptDir & "\initpurge.txt", 1)
	FileWriteLine($file, "mountbig initpurge.big , purge" & @CRLF)
	If FileExists(@ScriptDir & "\install\UISinitpurge\bgbody.orl") Then FileWriteLine($file, "-ar models/bgbody.orl , install\UISinitpurge\bgbody.orl , purge")
	If FileExists(@ScriptDir & "\install\UISinitpurge\bghead.orl") Then FileWriteLine($file, "-ar models/bghead.orl , install\UISinitpurge\bghead.orl , purge")
	If FileExists(@ScriptDir & "\install\UISinitpurge\bghead04.orl") Then FileWriteLine($file, "-ar models/bghead04.orl , install\UISinitpurge\bghead04.orl , purge")
	If FileExists(@ScriptDir & "\install\UISinitpurge\hibody.orl") Then FileWriteLine($file, "-ar models/hibody.orl , install\UISinitpurge\hibody.orl , purge")
	If FileExists(@ScriptDir & "\install\UISinitpurge\lobody.orl") Then FileWriteLine($file, "-ar models/lobody.orl , install\UISinitpurge\lobody.orl , purge")
	If FileExists(@ScriptDir & "\install\UISinitpurge\lohead.orl") Then FileWriteLine($file, "-ar models/lohead.orl , install\UISinitpurge\lohead.orl , purge")
	If FileExists(@ScriptDir & "\install\UISinitpurge\lohead04.orl") Then FileWriteLine($file, "-ar models/lohead04.orl , install\UISinitpurge\lohead04.orl , purge")
	If FileExists(@ScriptDir & "\install\UISinitpurge\mebody.orl") Then FileWriteLine($file, "-ar models/mebody.orl , install\UISinitpurge\mebody.orl , purge")
	If FileExists(@ScriptDir & "\install\UISinitpurge\mehead.orl") Then FileWriteLine($file, "-ar models/mehead.orl , install\UISinitpurge\mehead.orl , purge")
	If FileExists(@ScriptDir & "\install\UISinitpurge\mehead04.orl") Then FileWriteLine($file, "-ar models/mehead04.orl , install\UISinitpurge\mehead04.orl , purge")
	FileClose($file)
	RunWait("fifaFS.exe -e data\initprgz.big initpurge.big initpurge.big", @ScriptDir)
	RunWait("eazip -u initpurge.big", @ScriptDir)
	RunWait("fifafs.exe initpurge.txt", @ScriptDir)
	RunWait("eazip -c initpurge.big", @ScriptDir)
	RunWait("fifafs -ar data\initprgz.big initpurge.big", @ScriptDir)
	FileDelete(@ScriptDir & "\initpurge.big")
	FileDelete(@ScriptDir & "\initpurge.txt")
EndIf

SplashOff()
FileDelete(@ScriptDir & "\installing.bmp")
#endregion init-files
#endregion init-files
If $exeafter = "1" Then
	RunWait(@ScriptDir & "\install\" & IniRead(@ScriptDir & "\install\TiT.ini", "Execute_file", "File_name2", ""), @ScriptDir)
EndIf
FileInstall("cleanup.bmp", @ScriptDir & "\cleanup.bmp")
SplashImageOn("Please Wait", @ScriptDir & "\cleanup.bmp", 500, 200, -1, -1, 18)
DirRemove(@ScriptDir & "\install\UISlogos",1)
DirRemove(@ScriptDir & "\install\UISuniforms",1)
DirRemove(@ScriptDir & "\install\UISfields",1)
DirRemove(@ScriptDir & "\install\UISstadiums",1)
DirRemove(@ScriptDir & "\install\UISportrait",1)
DirRemove(@ScriptDir & "\install\UISmodels",1)
DirRemove(@ScriptDir & "\install\UISbkgnds",1)
DirRemove(@ScriptDir & "\install\UISrawdata",1)
DirRemove(@ScriptDir & "\install\UISuni-portrait",1)
DirRemove(@ScriptDir & "\install\UISpnamedat",1)
DirRemove(@ScriptDir & "\install\UISpnamehdr",1)
DirRemove(@ScriptDir & "\install\UISpbppnamedat",1)
DirRemove(@ScriptDir & "\install\UISpbpnamehdr",1)
DirRemove(@ScriptDir & "\install\UISinitstay",1)
DirRemove(@ScriptDir & "\install\UISinitpurge",1)
FileDelete(@ScriptDir & "\fifafs0.log")
FileDelete(@ScriptDir & "\fifafs_script.txt")
FileDelete(@ScriptDir & "\filelist.txt")
SplashOff()
FileDelete(@ScriptDir & "\cleanup.bmp")
If FileExists(@ProgramFilesDir & "\kraw\TiT.key") Then
	$Keycheckdll = PluginOpen(@ProgramFilesDir & "\kraw\MD5Hash.dll")
	If MD5Hash(@ProgramFilesDir & "\kraw\TiT.key", 1, True) = "e61f3bee28d9d152e4d027c7bfaaf4f3" Then
		MsgBox(4096, "Finished", "Mod has been installed")
		PluginClose($Keycheckdll)
	EndIf
	PluginClose($Keycheckdll)
	Exit
EndIf
_OpenWeb("http://www.eamods.com/Treasury.html")
Exit
EndIf
GUICreate("Total installer Thingy for MVP Baseball 2005 - 2.0", 385, 80, @DesktopWidth/2 - 192, _
@DesktopHeight/2 -235, -1, $WS_EX_ACCEPTFILES)
GUISetIcon ("c:\new.ico")
GUICtrlCreateGroup("Downloaded MOD", 5, 1, 375, 40)
$hFile = GUICtrlCreateEdit($sFilename, 12,  15, 325, 16, $ES_READONLY, $WS_EX_STATICEDGE)
$hFileSel = GUICtrlCreateButton("...", 345,  14, 26, 18)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$makeportrait = GUICtrlCreateButton("&Start", 140, 50, 100)
GUISetState()
While 1
$iMsg = GUIGetMsg()
$sCurFilename = GUICtrlRead($hFile)
If $sCurFilename <> $sFilename Then
$sFilename = $sCurFilename
Endif
Select
Case $iMsg = $hFileSel
$sTmpFile = FileOpenDialog("Select MOD:", @ScriptDir, "Supported files (*.rar;*.zip;*.ace;*.7z;*.TiT)" )
$extension = _PathSplit($sTmpFile, $szDrive, $szDir, $szFName, $szExt)
GUICtrlSetData($hFile, $sTmpFile)
If @error Then ContinueLoop
If $sTmpFile = "" Then GUICtrlSetData ( $hFile, @ScriptDir & "\")
Case $iMsg = $GUI_EVENT_CLOSE
Exit
Case $iMsg = $makeportrait
IF $sFilename = $filecheck Then
MsgBox (0, "HEY", "Please select a file")
GUICtrlSetData ( $hFile, @ScriptDir & "\")
Else
	#region unpack
If $extension[4] = ".zip" Then
	FileInstall ("unpack.bmp",@ScriptDir &"\unpack.bmp")
	SplashImageOn ( "Please Wait", @ScriptDir &"\unpack.bmp" , 500 , 200 , -1 , -1 , 18 )
	DirCreate (@ScriptDir &"\install")
	RunWait ('7zg x "' & $sTmpFile & '" -o"' & @ScriptDir &'\install"')
	$errorfile = FileOpen(@ScriptDir &"\install\1TiT.ini", 9)
	FileClose($errorfile)
	FileDelete (@ScriptDir &"\unpack.bmp")
ElseIf $extension[4] = ".rar" Then
	FileInstall ("unpack.bmp",@ScriptDir &"\unpack.bmp")
	SplashImageOn ( "Please Wait", @ScriptDir &"\unpack.bmp" , 500 , 200 , -1 , -1 , 18 )
	DirCreate (@ScriptDir &"\install")
	RunWait ('7zg x "' & $sTmpFile & '" -o"' & @ScriptDir &'\install"')
	$errorfile = FileOpen(@ScriptDir &"\install\1TiT.ini", 9)
	FileClose($errorfile)
	FileDelete (@ScriptDir &"\unpack.bmp")
ElseIf $extension[4] = ".TiT" Then
	FileInstall ("verify.bmp",@ScriptDir &"\verify.bmp")
	SplashImageOn ( "Please Wait", @ScriptDir &"\verify.bmp" , 500 , 200 , -1 , -1 , 18 )
	;SplashTextOn("File Check", "Verifing File is good, Please Wait.", 500, 100, -1, -1, 4, "", 24)
    #AutoIt3Wrapper_plugin_funcs = MD5Hash
	$md5basename = _PathSplit ( $sTmpFile,  $szDrive,  $szDir,  $szFName,  $szExt )
	InetGet ( "http://www.eamods.com/MD5/"& $md5basename[3]&".md5",@ScriptDir &"\"&$md5basename[3]&".md5")
	$md5checkfile = FileOpen(@ScriptDir &"\"&$md5basename[3]&".md5", 0)
	$md5checkfiletext = FileReadLine ( $md5checkfile ,1 )
	FileClose($md5checkfile)
	FileDelete(@ScriptDir &"\"&$md5basename[3]&".md5")
	$plH = PluginOpen(@ProgramFilesDir & "\kraw\MD5Hash.dll")
If MD5Hash($sTmpFile, 1, True) = $md5checkfiletext Then
	SplashOff()
	FileDelete (@ScriptDir &"\verify.bmp")
	FileInstall ("unpack.bmp",@ScriptDir &"\unpack.bmp")
	SplashImageOn ( "Please Wait", @ScriptDir &"\unpack.bmp" , 500 , 200 , -1 , -1 , 18 )
	DirCreate (@ScriptDir &"\install")
	RunWait ('7zg x "' & $sTmpFile & '" -p9resefrEtahufujEd -o"' & @ScriptDir &'\install"')
	$errorfile = FileOpen(@ScriptDir &"\install\1TiT.ini", 9)
	FileClose($errorfile)
	SplashOff()
	FileDelete (@ScriptDir &"\unpack.bmp")
Else
	SplashOff()
	FileDelete (@ScriptDir &"\verify.bmp")
	MsgBox (4096,"File is corrupt", "Please redownload - Program will now EXIT")
	Exit
EndIf
PluginClose($plH)
ElseIf $extension[4] = ".7z" Then
	FileInstall ("unpack.bmp",@ScriptDir &"\unpack.bmp")
	SplashImageOn ( "Please Wait", @ScriptDir &"\unpack.bmp" , 500 , 200 , -1 , -1 , 18 )
	DirCreate (@ScriptDir &"\install")
	RunWait ('7zg x "' & $sTmpFile & '" -p9resefrEtahufujEd -o"' & @ScriptDir &'\install"')
	$errorfile = FileOpen(@ScriptDir &"\install\1TiT.ini", 9)
	FileClose($errorfile)
	SplashOff()
	FileDelete (@ScriptDir &"\unpack.bmp")	
ElseIf $extension[4] = ".ace" Then
	FileInstall ("unpack.bmp",@ScriptDir &"\unpack.bmp")
	SplashImageOn ( "Please Wait", @ScriptDir &"\unpack.bmp" , 500 , 200 , -1 , -1 , 18 )
	DirCreate (@ScriptDir &"\install")
	RunWait ('unace x "' & $sTmpFile & '" "' & @ScriptDir &'\install\"')
	$errorfile = FileOpen(@ScriptDir &"\install\1TiT.ini", 9)
	FileClose($errorfile)
	SplashOff()
	FileDelete (@ScriptDir &"\unpack.bmp")	
Else
EndIf
#endregion unpack
#region Backupfiles
;~ SplashTextOn("Backing up files", "Please StandBy", 250, 100, -1, -1, 4, "", 24)
FileInstall ("back.bmp",@ScriptDir &"\back.bmp")
SplashImageOn ( "Please Wait", @ScriptDir &"\back.bmp" , 500 , 200 , -1 , -1 , 18 )
$DSPname2 = StringSplit ( "a001day.big;a002day.big;a003day.big;aa01nite.big;aa02nite.big;aa03nite.big;aaa1nite.big;aaa2nite.big;aaa3nite.big;anahday.big;anahnite.big;arliday.big;arlinite.big;astrdome.big;bankday.big;banknite.big;bushday.big;bushnite.big;cineday.big;citiday.big;citinite.big;clevday.big;comeday.big;comenite.big;coorday.big;coornite.big;crosday.big;dodgday.big;dodgnite.big;fencday.big;fenwday.big;fenwnite.big;forbday.big;gabaday.big;gabanite.big;grifday.big;hiranite.big;jacoday.big;jaconite.big;kaufday.big;kaufnite.big;metpnite.big;metrdome.big;millday.big;millnite.big;min1day.big;min2day.big;minuday.big;minunite.big;netwday.big;netwnite.big;olymdome.big;orioday.big;orionite.big;petoday.big;petonite.big;pncpday.big;pncpnite.big;poloday.big;propday.big;propnite.big;qualnite.big;rfksday.big;rfksnite.big;safeday.big;safenite.big;sbcpday.big;sbcpnite.big;sheaday.big;sheanite.big;shibday.big;skydday.big;skydnite.big;spotday.big;tigrnite.big;tropdome.big;turnday.big;turnnite.big;usceday.big;uscenite.big;venuday.big;venunite.big;veteday.big;wrigday.big;wrignite.big;yankday.big;yanknite.big", ";" )
For $zz2 = 1 to 87
If IniRead(@ScriptDir & "\install\TiT.ini", "backup", $DSPname2[$zz2], "0") = "1" Then
_FileCopyEx (@ScriptDir & "\data\stadium\"&$DSPname2[$zz2],@ScriptDir & "\data\stadium\"&$DSPname2[$zz2]&".TiT-bak")
EndIf
Next
$DSPname3 = StringSplit ( "apt.big;awards.big;bkgnds.big;bpattrac.big;bpitems.big;bppromos.big;bpsetup.big;bpticket.big;bpupgrad.big;bpvendor.big;cooplay.big;coopov.big;coopplyr.big;coopstad.big;coopteam.big;coopunis.big;easoart.big;feonly.big;feonlycm.big;feonlyln.big;fields.big;frontend.big;hrsonly.big;igonly.big;ingame.big;logos.big;minibat.big;minigame.big;minipit.big;misc.big;portrait.big;shared.big;splash.big;stadiums.big;suonly.big;sushared.big;title.big;uniforms.big", ";" )
For $zz3 = 1 to 38
If IniRead(@ScriptDir & "\install\TiT.ini", "backup", $DSPname3[$zz3], "0") = "1" Then
_FileCopyEx (@ScriptDir & "\data\frontend\"&$DSPname3[$zz3],@ScriptDir & "\data\frontend\"&$DSPname3[$zz3]&".TiT-bak")
EndIf
Next
$DSPname4 = StringSplit ( "progress.big;resign.csv;rookie.big;schedule.big", ";" )
For $zz4 = 1 to 4
If IniRead(@ScriptDir & "\install\TiT.ini", "backup", $DSPname4[$zz4], "0") = "1" Then
_FileCopyEx(@ScriptDir & "\data\database\"&$DSPname4[$zz4],@ScriptDir & "\data\database\"&$DSPname4[$zz4]&".TiT-bak")
EndIf
Next
$DSPname5 = StringSplit ( "FEENG.LOC;IGENG.LOC;initprgz.big;initstaz.big;models.big", ";" )
For $zz5 = 1 to 5
If IniRead(@ScriptDir & "\install\TiT.ini", "backup", $DSPname5[$zz5], "0") = "1" Then
_FileCopyEx(@ScriptDir & "\data\"&$DSPname5[$zz5] , @ScriptDir & "\data\"&$DSPname5[$zz5]&".TiT-bak")
EndIf
Next
If IniRead(@ScriptDir & "\install\TiT.ini", "backup", "rosters", "0") = "1" Then
FileCopy (@ScriptDir & "\data\database\*.dat" ,@ScriptDir & "\data\database\*.dat.TiT-bak",1)
EndIf
If IniRead(@ScriptDir & "\install\TiT.ini", "backup", "loadfiles", "0") = "1" Then
FileCopy (@ScriptDir & "\data\frontend\load*.big" ,@ScriptDir & "\data\frontend\load*.big.TiT-bak",1)
EndIf
If IniRead(@ScriptDir & "\install\TiT.ini", "backup", "00000000.256", "0") = "1" Then
_FileCopyEx (@ScriptDir & "\00000000.256" ,@ScriptDir & "\00000000.256.TiT-bak")
EndIf
If IniRead(@ScriptDir & "\install\TiT.ini", "backup", "datafile.big", "0") = "1" Then
_FileCopyEx (@ScriptDir & "\data\datafile\datafile.big" ,@ScriptDir & "\data\datafile\datafile.big.TiT-bak")
EndIf
SplashOff()
FileDelete (@ScriptDir & "\back.bmp")
#EndRegion Backupfiles
#region iniLaunch
If IniRead(@ScriptDir & "\install\TiT.ini", "Readme", "launch", "0") = "1" Then
Run ('lister "' & @ScriptDir & '\install\' & IniRead(@ScriptDir & "\install\TiT.ini", "Readme", "File_name", "0"))
$reademecheck="1"
EndIf
If IniRead(@ScriptDir & "\install\TiT.ini", "Modder_Site", "launch", "0") = "1" Then
	_OpenWeb(IniRead(@ScriptDir & "\install\TiT.ini", "Modder_Site", "Site_name", "http://www.eamods.com/Treasury.html"))
EndIf
If IniRead(@ScriptDir & "\install\TiT.ini", "image", "launch", "0") = "1" Then
Run ('pvw32.exe "' & @ScriptDir & '\install\' & IniRead(@ScriptDir & "\install\TiT.ini", "image", "File_name", "0"))
EndIf
If IniRead(@ScriptDir & "\install\TiT.ini", "Execute_file", "launch", "0") = "1" Then
RunWait(@ScriptDir & "\install\" & IniRead(@ScriptDir & "\install\TiT.ini", "Execute_file", "File_name1", ""))
EndIf
If IniRead(@ScriptDir & "\install\TiT.ini", "Execute_file", "launch", "0") = "2" Then $exeafter = "1"
If IniRead(@ScriptDir & "\install\TiT.ini", "Execute_file", "launch", "0") = "3" Then
RunWait(@ScriptDir & "\install\" & IniRead(@ScriptDir & "\install\TiT.ini", "Execute_file", "File_name1", ""))
$exeafter = "1"
EndIf
#endregion iniLaunch
If $reademecheck = "0" Then
If FileExists (@ScriptDir & "\install\readme.txt") Then
Run ('lister "'& @ScriptDir & '\install\readme.txt"')
EndIf
EndIf
#Region reinstall
If IniRead(@ScriptDir & "\install\TiT.ini", "Reinstall", "reinstall", "0") = "1" Then
Global $mvpcd
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoDriveTypeAutoRun","REG_DWORD","0xB1")
FileInstall ("mvperfiles\DBUtils.dll", @ScriptDir & "\DBUtils.dll" )
FileInstall ("mvperfiles\p5.xta", @ScriptDir & "\p5.xta" )
MsgBox(4096,"NOW","INSERT MVP CD1")
_finddrive ("mvp2005_cd1")
If $mvpcd = "" Then
MsgBox (4096,"ERROR","MVP CD1 NOT FOUND")
Exit
EndIf
DirRemove ( @ScriptDir & "\data" , 1 )
FileDelete (@ScriptDir & "\mvp2005.exe")
FileDelete (@ScriptDir & "\mvp2005.ico")
;DirCreate ("data")
_CopyWithProgress ($mvpcd & "\data" , @ScriptDir & "\data",1)
RunWait( '7zg x ' & $mvpcd & '\compressed.zip -o"'& @ScriptDir & '\"')
$mvpcd = ""
MsgBox(4096,"NOW","INSERT MVP CD2")
_finddrive ("mvp2005_cd2")
If $mvpcd = "" Then
MsgBox (4096,"ERROR","MVP CD2 NOT FOUND")
MsgBox(4096,"NOW","INSERT MVP CD2")
_finddrive ("mvp2005_cd2")
EndIf
If $mvpcd = "" Then
MsgBox (4096,"ERROR","MVP CD1 NOT FOUND")
Exit
EndIf
_CopyWithProgress ($mvpcd & "\data" , @ScriptDir & "\data",1)
_FileCopy($mvpcd & "\mvp2005.exe",@ScriptDir)
_FileCopy($mvpcd & "\mvp2005.ico",@ScriptDir)
ProcessWaitClose ("unzip.exe")
ProcessWaitClose ("DBUtils.dll")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoDriveTypeAutoRun","REG_DWORD","0x91")
FileDelete (@ScriptDir & "\DBUtils.dll")
RunWait ("xdelta.exe patch p5.xta mvp2005.exe mvp2005p5.exe",@ScriptDir)
ProcessWaitClose ("xdelta.exe")
FileDelete (@ScriptDir & "\mvp2005.exe")
FileMove (@ScriptDir & "\mvp2005p5.exe" , @ScriptDir & "\mvp2005.exe")
FileDelete (@ScriptDir & "\p5.xta")
EndIf
#EndRegion reinstall

If IniRead(@ScriptDir & "\install\TiT.ini", "xdelta", "enable", "0") = "1" Then
	$xdeltacheck = PluginOpen(@ProgramFilesDir & "\kraw\MD5Hash.dll")
	If MD5Hash(@ScriptDir & IniRead (@ScriptDir & "\install\TiT.ini" , "xdelta", "eafilepath" , "") & IniRead (@ScriptDir & "\install\TiT.ini" , "xdelta", "eafilename",""), 1, True) = IniRead(@ScriptDir & "\install\TiT.ini", "xdelta", "MD5", "0") Then
			FileMove (@ScriptDir & IniRead (@ScriptDir & "\install\TiT.ini" , "xdelta", "eafilepath" , "") & IniRead (@ScriptDir & "\install\TiT.ini" , "xdelta", "eafilename","") , @ScriptDir & IniRead (@ScriptDir & "\install\TiT.ini" , "xdelta", "eafilepath","") & StringTrimRight (IniRead (@ScriptDir & "\install\TiT.ini" , "xdelta", "eafilename",""),3) & "TiT-bak",1)
			RunWait ('xdelta patch "' & @ScriptDir & "\install\" & IniRead (@ScriptDir & "\install\TiT.ini" , "xdelta", "xdeltafile","") & '" "' & @ScriptDir & IniRead (@ScriptDir & "\install\TiT.ini" , "xdelta", "eafilepath","") & StringTrimRight (IniRead (@ScriptDir & "\install\TiT.ini" ,"xdelta",  "eafilename",""),3) & 'TiT-bak" "' & @ScriptDir & IniRead (@ScriptDir & "\install\TiT.ini" , "xdelta", "eafilepath","") & IniRead (@ScriptDir & "\install\TiT.ini" , "xdelta", "eafilename","")&'"')
			
	Else
		PluginClose($xdeltacheck)
		MsgBox (4096,"File has already been modified", "You must have the correct version of files for this mod to install - TiT will now RESTART")
	EndIf
	
EndIf
If IniRead(@ScriptDir & "\install\TiT.ini", "roster", "update", "0") = "1" Then
	$ls = "Do you want to convert this roster to work with 08"&@CRLF&@CRLF&"You have 30 Seconds to choose, or the roster will not be converted"
	$plusornot = _MsgBoxEx(1316, "Please answer", $ls, 30)
	If $plusornot = 6 Then 
		$mvp08ini = FileOpenDialog ( "Select your MVP08.ini, One was installed in the extras folder when you installed 08", @ScriptDir, "ini (mvp08.ini)" ,1, "mvp08.ini")
		If $mvp08ini = "" Then $mvp08ini = FileOpenDialog ( "Select your MVP08.ini, One was installed in the extras folder when you installed 08", @ScriptDir, "ini (mvp08.ini)" ,1, "mvp08.ini")
		If Not $mvp08ini = "" Then 
			FileCopy ($mvp08ini,@ScriptDir & "\install\database\mvp08.ini")
			FileInstall ("yes.txt" , @ScriptDir & "\install\database\yes.txt")
			FileChangeDir ( @ScriptDir & "\install\database" )
			RunWait(@ComSpec & " /c " & 'plusmaker-dat.exe <yes.txt')
			FileChangeDir ( @ScriptDir )
		EndIf
	EndIf
	If $plusornot = 7 or $plusornot = -1 Then 
		$oiuoiuoiuoiu = 1
	EndIf
EndIf

;extra folder
If FileExists (@ScriptDir & "\install\extras") Then
DirMove (@ScriptDir & "\install\extras", @ScriptDir ,1)
EndIf
;2x/1x check
If FileExists (@ScriptDir & "\install\2x") And FileExists (@ScriptDir & "\install\1x") Then
$ls = "Do you want to install the 2x version or the 1x version"&@CRLF&@CRLF&"You have 30 Seconds to choose, or the 2x Version will be installed"&@CRLF&"Yes = 2x & No = 1x"
$plusornot = _MsgBoxEx(36 + 1024, "Please answer", $ls, 30)
If $plusornot = 6 or $plusornot = -1 Then DirRemove (@ScriptDir & "\install\1x",1)
If $plusornot = 7 Then DirRemove (@ScriptDir & "\install\2x",1)
EndIf
;RAW stadiums installer
If FileExists (@ScriptDir & "\install\DoubleSecretProbation") Then
$DSPname = StringSplit ( "a001day;a002day;a003day;aa01nite;aa02nite;aa03nite;aaa1nite;aaa2nite;aaa3nite;anahday;anahnite;arliday;arlinite;astrdome;bankday;banknite;bushday;bushnite;cineday;citiday;citinite;clevday;comeday;comenite;coorday;coornite;crosday;dodgday;dodgnite;fencday;fenwday;fenwnite;forbday;gabaday;gabanite;grifday;hiranite;jacoday;jaconite;kaufday;kaufnite;metpnite;metrdome;millday;millnite;min1day;min2day;minuday;minunite;netwday;netwnite;olymdome;orioday;orionite;petoday;petonite;pncpday;pncpnite;poloday;propday;propnite;qualnite;rfksday;rfksnite;safeday;safenite;sbcpday;sbcpnite;sheaday;sheanite;shibday;skydday;skydnite;spotday;tigrnite;tropdome;turnday;turnnite;usceday;uscenite;venuday;venunite;veteday;wrigday;wrignite;yankday;yanknite", ";" )
For $zz = 1 to 87
If FileExists (@ScriptDir & "\install\DoubleSecretProbation\stadiums\"&$DSPname[$zz]) Then
RunWait ("eazip -c install\DoubleSecretProbation\stadiums\" & $DSPname[$zz] & "\*.*",@ScriptDir)
RunWait ("fifafs -createbig install\" & $DSPname[$zz] & ".big install\DoubleSecretProbation\stadiums\" & $DSPname[$zz] & "\*.* -c",@ScriptDir)
DirRemove (@ScriptDir & "\install\DoubleSecretProbation\stadiums\"&$DSPname[$zz],1)
EndIf
Next
EndIf
#region copyfiles
FileInstall ("completed.bmp",@ScriptDir &"\completed.bmp")
SplashImageOn ( "Please Wait", @ScriptDir &"\completed.bmp" , 500 , 200 , -1 , -1 , 18 )
;Stadium copy
$stadiumsfiles = _RecursiveFileSearch($sPath, '.*day\.big|.*nite\.big|.*dome\.big',".", 1, true)
If $stadiumsfiles[0] >= 1 Then
For $stadiumscount = 1 to $stadiumsfiles[0]
$rawname = _PathSplit($stadiumsfiles[$stadiumscount], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\stadium\*.*", "-R")
_FileCopyEx ($stadiumsfiles[$stadiumscount], @ScriptDir & "\data\stadium\" & $rawname[3]&$rawname[4])
Next
EndIf
$frontendfiles = _RecursiveFileSearch($sPath, 'apt\.big|awards\.big|bkgnds\.big|bpattrac\.big|bpitems\.big|bppromos\.big|bpsetup\.big|bpticket\.big|bpupgrad\.big|bpvendor\.big|cooplay\.big|load.*\.big|coopov\.big|coopplyr\.big|coopstad\.big|coopteam\.big|coopunis\.big|easoart\.big|feonly\.big|feonlycm\.big|feonlyln\.big|fields\.big|frontend\.big|hrsonly\.big|igonly\.big|ingame\.big|logos\.big|minibat\.big|minigame\.big|minipit\.big|misc\.big|portrait\.big|shared\.big|splash\.big|stadiums\.big|suonly\.big|sushared\.big|title\.big|uniforms\.big',".", 1, true)
If $frontendfiles[0] >= 1 Then
For $frondendcount = 1 to $frontendfiles[0]
$rawname = _PathSplit($frontendfiles[$frondendcount], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\frontend\*.*", "-R")
_FileCopyEx ($frontendfiles[$frondendcount], @ScriptDir & "\data\frontend\" & $rawname[3]&$rawname[4])
Next
EndIf
$misctextuesfiles = _RecursiveFileSearch($sPath, 'aple\.fsh|batcod[12]\.fsh|bern\.fsh|bli[12]\.fsh|grad\.fsh|lawn\.fsh|moon\.fsh|obj[1234]\.fsh|pcshdw2\.fsh|pla[12]\.fsh|roof\.fsh|tran\.fsh',".", 1, true)
If $misctextuesfiles[0] >= 1 Then
For $misctextuescount = 1 to $misctextuesfiles[0]
$rawname = _PathSplit($misctextuesfiles[$misctextuescount], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\misc\textures\*.*", "-R")
_FileCopyEx ($misctextuesfiles[$misctextuescount], @ScriptDir & "\data\misc\textures\" & $rawname[3]&$rawname[4])
Next
EndIf
$datafile = _RecursiveFileSearch($sPath, 'datafile\.big',".", 1, true)
If $datafile[0] >= 1  Then
$rawname = _PathSplit($datafile[1], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\datafile\*.*", "-R")
_FileCopyEx ($datafile[1], @ScriptDir & "\data\datafile\" & $rawname[3]&$rawname[4])
EndIf
$datafiles = _RecursiveFileSearch($sPath, 'credits\.tsv|.*\.LOC|init.*z\.big|mat\.o|models\.big|profiles\.big',".", 1, true)
If $datafiles[0] >= 1 Then
For $datacount = 1 to $datafiles[0]
$rawname = _PathSplit($datafiles[$datacount], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\*.*", "-R")
_FileCopyEx ($datafiles[$datacount], @ScriptDir & "\data\" & $rawname[3]&$rawname[4])
Next
EndIf
$moviesfiles = _RecursiveFileSearch($sPath, '.*\.vp6',".", 1, true)
If $moviesfiles[0] >= 1 Then
For $moviescount = 1 to $moviesfiles[0]
$rawname = _PathSplit($moviesfiles[$moviescount], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\frontend\movies\*.*", "-R")
_FileCopyEx ($moviesfiles[$moviescount], @ScriptDir & "\data\frontend\movies\" & $rawname[3]&$rawname[4])
Next
EndIf
$fontfile = _RecursiveFileSearch($sPath, 'fonts\.big',".", 1, true)
If $fontfile[0] >= 1 Then
$rawname = _PathSplit($fontfile[1], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\fonts\*.*", "-R")
_FileCopyEx ($fontfile[1], @ScriptDir & "\data\fonts\" & $rawname[3]&$rawname[4])
EndIf
$igcrsrfile = _RecursiveFileSearch($sPath, 'igcrsr\.fsh',".", 1, true)
If $igcrsrfile[0] >= 1 Then
$rawname = _PathSplit($igcrsrfile[1], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\igshapes\*.*", "-R")
_FileCopyEx ($igcrsrfile[1], @ScriptDir & "\data\igshapes\" & $rawname[3]&$rawname[4])
EndIf
$splashfile = _RecursiveFileSearch($sPath, '00000000\.256',".", 1, true)
If $splashfile[0] >= 1 Then
$rawname = _PathSplit($splashfile[1], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\*.*", "-R")
_FileCopyEx ($splashfile[1], @ScriptDir & "\" & $rawname[3]&$rawname[4])
EndIf
$databasefiles = _RecursiveFileSearch($sPath, 'attrib\.dat|bstats\.dat|career\.dat|careerp\.dat|fbstats\.dat|hist\.dat|lhattrib\.dat|lhbstats\.dat|lhpstats\.dat|manager\.dat|org\.dat|pitcher\.dat|progress\.big|pstats\.dat|resign\.csv|rhattrib\.dat|rhbstats\.dat|rhpstats\.dat|rookie\.big|roster\.dat|schedule\.big|team\.dat|tstat\.dat',".", 1, true)
If $databasefiles[0] >= 1 Then
For $databasecount = 1 to $databasefiles[0]
$rawname = _PathSplit($databasefiles[$databasecount], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\database\*.*", "-R")
_FileCopyEx ($databasefiles[$databasecount], @ScriptDir & "\data\database\" & $rawname[3]&$rawname[4])
Next
EndIf
$aemsfiles = _RecursiveFileSearch($sPath, 'batdit.abk|batmini.abk|crowd4a\.abk|hecklea\.abk|heckleb\.abk|hecklec\.abk|heckled\.abk|hecklee\.abk|ptcmini\.abk|vendor\.abk|vndrcbp\.abk',".", 1, true)
If $aemsfiles[0] >= 1 Then
For $aemscount = 1 to $aemsfiles[0]
$rawname = _PathSplit($aemsfiles[$aemscount], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\audio\aems\*.*", "-R")
_FileCopyEx ($aemsfiles[$aemscount], @ScriptDir & "\data\audio\aems\" & $rawname[3]&$rawname[4])
Next
EndIf
$cdaemsfiles = _RecursiveFileSearch($sPath, 'batdit.ast|batmini.ast|crowd4a\.ast|hecklea\.ast|heckleb\.ast|hecklec\.ast|heckled\.ast|hecklee\.ast|ptcmini\.ast|vendor\.ast|vndrcbp\.ast',".", 1, true)
If $cdaemsfiles[0] >= 1 Then
For $cdaemscount = 1 to $cdaemsfiles[0]
$rawname = _PathSplit($cdaemsfiles[$cdaemscount], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\audio\cd\aems\*.*", "-R")
_FileCopyEx ($cdaemsfiles[$cdaemscount], @ScriptDir & "\data\audio\cd\aems\" & $rawname[3]&$rawname[4])
Next
EndIf
$cdbdcstdatfiles = _RecursiveFileSearch($sPath, 'bdcstdat\.big',".", 1, true)
If $cdbdcstdatfiles[0] >= 1 Then
$rawname = _PathSplit($cdbdcstdatfiles[1], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\audio\cd\bdcst_mx\*.*", "-R")
_FileCopyEx ($cdbdcstdatfiles[1], @ScriptDir & "\data\audio\cd\bdcst_mx\" & $rawname[3]&$rawname[4])
EndIf
$bdcstdatfiles = _RecursiveFileSearch($sPath, 'bdcsthdr\.big',".", 1, true)
If $bdcstdatfiles[0] >= 1 Then
$rawname = _PathSplit($bdcstdatfiles[1], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\audio\bdcst_mx\*.*", "-R")
_FileCopyEx ($bdcstdatfiles[1], @ScriptDir & "\data\audio\bdcst_mx\" & $rawname[3]&$rawname[4])
EndIf
$chantfile = _RecursiveFileSearch($sPath, 'chanthdr\.big',".", 1, true)
If $chantfile[0] >= 1 Then
$rawname = _PathSplit($chantfile[1], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\audio\chants\*.*", "-R")
_FileCopyEx ($chantfile[1], @ScriptDir & "\data\audio\chants\" & $rawname[3]&$rawname[4])
EndIf
$cdchantfile = _RecursiveFileSearch($sPath, 'chantdat\.big',".", 1, true)
If $cdchantfile[0] >= 1 Then
$rawname = _PathSplit($cdchantfile[1], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\audio\cd\chants\*.*", "-R")
_FileCopyEx ($cdchantfile[1], @ScriptDir & "\data\audio\cd\chants\" & $rawname[3]&$rawname[4])
EndIf
$hmrn_sfxfile = _RecursiveFileSearch($sPath, 'hsfxhdr\.big',".", 1, true)
If $hmrn_sfxfile[0] >= 1 Then
$rawname = _PathSplit($hmrn_sfxfile[1], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\audio\hmrn_sfx\*.*", "-R")
_FileCopyEx ($hmrn_sfxfile[1], @ScriptDir & "\data\audio\hmrn_sfx\" & $rawname[3]&$rawname[4])
EndIf
$cdhmrn_sfxfile = _RecursiveFileSearch($sPath, 'hsfxdat\.big',".", 1, true)
If $cdhmrn_sfxfile[0] >= 1 Then
$rawname = _PathSplit($cdhmrn_sfxfile[1], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\audio\cd\hmrn_sfx\*.*", "-R")
_FileCopyEx ($cdhmrn_sfxfile[1], @ScriptDir & "\data\audio\cd\hmrn_sfx\" & $rawname[3]&$rawname[4])
EndIf
$stdmfile = _RecursiveFileSearch($sPath, 'stdmhdr\.big',".", 1, true)
If $stdmfile[0] >= 1 Then
$rawname = _PathSplit($stdmfile[1], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\audio\stadium\*.*", "-R")
_FileCopyEx ($stdmfile[1], @ScriptDir & "\data\audio\stadium\" & $rawname[3]&$rawname[4])
EndIf
$cdstdmfile = _RecursiveFileSearch($sPath, 'stdmdat\.big',".", 1, true)
If $cdstdmfile[0] >= 1 Then
$rawname = _PathSplit($cdstdmfile[1], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\audio\cd\stadium\*.*", "-R")
_FileCopyEx ($cdstdmfile[1], @ScriptDir & "\data\audio\cd\stadium\" & $rawname[3]&$rawname[4])
EndIf
$plyr_chtfile = _RecursiveFileSearch($sPath, 'plchthdr\.big',".", 1, true)
If $plyr_chtfile[0] >= 1 Then
$rawname = _PathSplit($plyr_chtfile[1], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\audio\plyr_cht\*.*", "-R")
_FileCopyEx ($plyr_chtfile[1], @ScriptDir & "\data\audio\plyr_cht\" & $rawname[3]&$rawname[4])
EndIf
$cdplyr_chtfile = _RecursiveFileSearch($sPath, 'plchtdat\.big',".", 1, true)
If $cdplyr_chtfile[0] >= 1 Then
$rawname = _PathSplit($cdplyr_chtfile[1], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\audio\cd\plyr_cht\*.*", "-R")
_FileCopyEx ($cdplyr_chtfile[1], @ScriptDir & "\data\audio\cd\plyr_cht\" & $rawname[3]&$rawname[4])
EndIf
$rallyfile = _RecursiveFileSearch($sPath, 'rallyhdr\.big',".", 1, true)
If $rallyfile[0] >= 1 Then
$rawname = _PathSplit($rallyfile[1], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\audio\rally\*.*", "-R")
_FileCopyEx ($rallyfile[1], @ScriptDir & "\data\audio\rally\" & $rawname[3]&$rawname[4])
EndIf
$cdrallyfile = _RecursiveFileSearch($sPath, 'rallyhdr\.big',".", 1, true)
If $cdrallyfile[0] >= 1 Then
$cdrawname = _PathSplit($cdrallyfile[1], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\audio\cd\rally\*.*", "-R")
_FileCopyEx ($cdrallyfile[1], @ScriptDir & "\data\audio\cd\rally\" & $rawname[3]&$rawname[4])
EndIf
$spch_pbpfiles = _RecursiveFileSearch($sPath, 'pbphdr\.big|stdnmhdr\.big',".", 1, true)
If $spch_pbpfiles[0] >= 1 Then
For $spch_pbpcount = 1 to $spch_pbpfiles[0]
$rawname = _PathSplit($spch_pbpfiles[$spch_pbpcount], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\audio\spch_pbp\*.*", "-R")
_FileCopyEx ($spch_pbpfiles[$spch_pbpcount], @ScriptDir & "\data\audio\spch_pbp\" & $rawname[3]&$rawname[4])
Next
EndIf
$cdspch_pbpfiles = _RecursiveFileSearch($sPath, 'pbpdat\.big|stdnmdat\.big',".", 1, true)
If $cdspch_pbpfiles[0] >= 1 Then
For $cdspch_pbpcount = 1 to $cdspch_pbpfiles[0]
$rawname = _PathSplit($cdspch_pbpfiles[$cdspch_pbpcount], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\audio\cd\spch_pbp\*.*", "-R")
_FileCopyEx ($cdspch_pbpfiles[$cdspch_pbpcount], @ScriptDir & "\data\audio\cd\spch_pbp\" & $rawname[3]&$rawname[4])
Next
EndIf
$musicfiles = _RecursiveFileSearch($sPath, '.*\.asf',".", 1, true)
If $musicfiles[0] >= 1 Then
For $musiccount = 1 to $musicfiles[0]
$rawname = _PathSplit($musicfiles[$musiccount], $szDrive, $szDir, $szFName, $szExt)
FileSetAttrib(@ScriptDir & "\data\audio\cd\music\*.*", "-R")
_FileCopyEx ($musicfiles[$musiccount], @ScriptDir & "\data\audio\cd\music\" & $rawname[3]&$rawname[4])
Next
EndIf
If FileExists (@ScriptDir & "\install\spch_pbp\pnamehdr.big") Then
FileSetAttrib(@ScriptDir & "\data\audio\spch_pbp\pnamehdr.big", "-R")
_FileCopyEx (@ScriptDir & "\install\spch_pbp\pnamehdr.big" , @ScriptDir & "\data\audio\spch_pbp\pnamehdr.big")
EndIf
If FileExists (@ScriptDir & "\install\spch_pbp\tnamehdr.big") Then
FileSetAttrib(@ScriptDir & "\data\audio\spch_pbp\tnamehdr.big", "-R")
_FileCopyEx (@ScriptDir & "\install\spch_pbp\tnamehdr.big" , @ScriptDir & "\data\audio\spch_pbp\tnamehdr.big")
EndIf
If FileExists (@ScriptDir & "\install\spch_pa\pnamehdr.big") Then
FileSetAttrib(@ScriptDir & "\data\audio\spch_pa\pnamehdr.big", "-R")
_FileCopyEx (@ScriptDir & "\install\spch_pa\pnamehdr.big" , @ScriptDir & "\data\audio\spch_pa\pnamehdr.big")
EndIf
If FileExists (@ScriptDir & "\install\spch_pa\tnamehdr.big") Then
FileSetAttrib(@ScriptDir & "\data\audio\spch_pa\tnamehdr.big", "-R")
_FileCopyEx (@ScriptDir & "\install\spch_pa\tnamehdr.big" , @ScriptDir & "\data\audio\spch_pa\tnamehdr.big")
EndIf
If FileExists (@ScriptDir & "\install\spch_pbp\pnamedat.big") Then
FileSetAttrib(@ScriptDir & "\data\audio\cd\spch_pbp\pnamedat.big", "-R")
_FileCopyEx (@ScriptDir & "\install\spch_pbp\pnamedat.big" , @ScriptDir & "\data\audio\cd\spch_pbp\pnamedat.big")
EndIf
If FileExists (@ScriptDir & "\install\spch_pbp\tnamedat.big") Then
FileSetAttrib(@ScriptDir & "\data\audio\cd\spch_pbp\tnamedat.big", "-R")
_FileCopyEx (@ScriptDir & "\install\spch_pbp\tnamedat.big" , @ScriptDir & "\data\audio\cd\spch_pbp\tnamedat.big")
EndIf
If FileExists (@ScriptDir & "\install\spch_pa\pnamedat.big") Then
FileSetAttrib(@ScriptDir & "\data\audio\cd\spch_pa\pnamedat.big", "-R")
_FileCopyEx (@ScriptDir & "\install\spch_pa\pnamedat.big" , @ScriptDir & "\data\audio\cd\spch_pa\pnamedat.big")
EndIf
If FileExists (@ScriptDir & "\install\spch_pa\tnamedat.big") Then
FileSetAttrib(@ScriptDir & "\data\audio\cd\spch_pa\tnamedat.big", "-R")
_FileCopyEx (@ScriptDir & "\install\spch_pa\tnamedat.big" , @ScriptDir & "\data\audio\cd\spch_pa\tnamedat.big")
EndIf
SplashOff()
FileDelete (@ScriptDir &"\completed.bmp")
#endregion copyfiles
#region installfiles
FileInstall ("installing.bmp",@ScriptDir &"\installing.bmp")
SplashImageOn ( "Please Wait", @ScriptDir &"\installing.bmp" , 500 , 200 , -1 , -1 , 18 )

#region uniform_previews
$uniformpreviewfiles = _RecursiveFileSearch($sPath, '^\d{3}\D\.bmp',".", 1, true)
If $uniformpreviewfiles[0] >= 1 Then
For $uniformportraitscount = 1 to $uniformpreviewfiles[0]
$rawname = _PathSplit($uniformpreviewfiles[$uniformportraitscount], $szDrive, $szDir, $szFName, $szExt)
DirCreate (@ScriptDir & "\install\UISuni-portrait\" & StringTrimRight ( $rawname[3], 1 ) & "_")
FileMove ($uniformpreviewfiles[$uniformportraitscount], @ScriptDir & "\install\UISuni-portrait\" & StringTrimRight ( $rawname[3], 1 ) & "_\" & $rawname[3]&$rawname[4],9)
FileInstall ("020a.fsh" , @ScriptDir & "\install\UISuni-portrait\" & $rawname[3] & ".fsh")
RunWait ('dossr ' & $rawname[3] & '.fsh "020a" "'& $rawname[3] & '"',@ScriptDir & "\install\UISuni-portrait")
Next
For $previewteamraw = 0 to 123
$previewteam = StringFormat ( "%.3i" ,$previewteamraw)
If FileExists ( @ScriptDir & "\install\UISuni-portrait\" & $previewteam & "_") Then
	RunWait ('fifafs -e "' & @ScriptDir & '\data\frontend\uniforms.big" ' & $previewteam &'.fsh ' & $previewteam &'.fsh', @ScriptDir &'\install\UISuni-portrait')
	RunWait ("fshline " & $previewteam &".fsh",@ScriptDir &"\install\UISuni-portrait")
	RunWait ("png2bmp *.png",@ScriptDir &"\install\UISuni-portrait\" & $previewteam )
	FileMove (@ScriptDir &"\install\UISuni-portrait\" & $previewteam & "_\*.bmp" , @ScriptDir &"\install\UISuni-portrait\" & $previewteam & "\*.bmp",9)
	$file = FileOpen(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\index.fsh", 2)
FileWriteLine($file, "NFSHTool generated file -- be very careful when editing" & @CRLF)
FileWriteLine($file, $previewteam & ".fsh" & @CRLF)
FileWriteLine($file, "FSH" & @CRLF)
$count = _FileListToArray ( @ScriptDir & "\install\UISuni-portrait\" & $previewteam , "*.bmp" , 1 )
FileWriteLine($file, "SHPI " & $count[0] & " objects, tag G357" & @CRLF)
FileInstall ("alpha.bmp",@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\alpha.bmp", 2)
FileWriteLine($file, "BUFSZ 2287896" & @CRLF)
FileWriteLine($file, "NOGLOBPAL" & @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"a.bmp") Then FileWriteLine($file, $previewteam & "a " & $previewteam & "a.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "a%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"b.bmp") Then FileWriteLine($file, $previewteam & "b " & $previewteam & "b.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "b%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"c.bmp") Then FileWriteLine($file, $previewteam & "c " & $previewteam & "c.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "c%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"d.bmp") Then FileWriteLine($file, $previewteam & "d " & $previewteam & "d.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "d%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"e.bmp") Then FileWriteLine($file, $previewteam & "e " & $previewteam & "e.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "e%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"f.bmp") Then FileWriteLine($file, $previewteam & "f " & $previewteam & "f.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "f%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"g.bmp") Then FileWriteLine($file, $previewteam & "g " & $previewteam & "g.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "g%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"h.bmp") Then FileWriteLine($file, $previewteam & "h " & $previewteam & "h.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "h%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"i.bmp") Then FileWriteLine($file, $previewteam & "i " & $previewteam & "i.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "i%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"j.bmp") Then FileWriteLine($file, $previewteam & "j " & $previewteam & "j.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "j%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"k.bmp") Then FileWriteLine($file, $previewteam & "k " & $previewteam & "k.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "k%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"l.bmp") Then FileWriteLine($file, $previewteam & "l " & $previewteam & "l.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "l%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"m.bmp") Then FileWriteLine($file, $previewteam & "m " & $previewteam & "m.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "m%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"n.bmp") Then FileWriteLine($file, $previewteam & "n " & $previewteam & "n.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "n%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"o.bmp") Then FileWriteLine($file, $previewteam & "o " & $previewteam & "o.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "o%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"p.bmp") Then FileWriteLine($file, $previewteam & "p " & $previewteam & "p.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "p%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"q.bmp") Then FileWriteLine($file, $previewteam & "q " & $previewteam & "q.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "q%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"u.bmp") Then FileWriteLine($file, $previewteam & "u " & $previewteam & "u.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "u%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"r.bmp") Then FileWriteLine($file, $previewteam & "r " & $previewteam & "r.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "r%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"s.bmp") Then FileWriteLine($file, $previewteam & "s " & $previewteam & "s.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "s%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"t.bmp") Then FileWriteLine($file, $previewteam & "t " & $previewteam & "t.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "t%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"u.bmp") Then FileWriteLine($file, $previewteam & "u " & $previewteam & "u.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "u%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"v.bmp") Then FileWriteLine($file, $previewteam & "v " & $previewteam & "v.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "v%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"w.bmp") Then FileWriteLine($file, $previewteam & "w " & $previewteam & "w.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "w%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"x.bmp") Then FileWriteLine($file, $previewteam & "x " & $previewteam & "x.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "x%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"y.bmp") Then FileWriteLine($file, $previewteam & "y " & $previewteam & "y.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "y%00%00%00%00%00%00%00%00"& @CRLF)
If FileExists(@ScriptDir & "\install\UISuni-portrait\" & $previewteam & "\" & $previewteam &"z.bmp") Then FileWriteLine($file, $previewteam & "z " & $previewteam & "z.BMP" & @CRLF & "BMP 7D +2 128 128 {0 0 0 0}" & @CRLF & "alpha alpha.BMP" & @CRLF & "ETXT 69 64 16 {0 0 0 0}" & @CRLF & "EAGL64%20metal%20bin%20attachment%20for%20runtime%20texture%20management%00%00%00%00%00%00" & @CRLF & "ETXT 70 " & $previewteam & "z%00%00%00%00%00%00%00%00"& @CRLF)
FileWriteLine($file, "#END" & @CRLF)	
FileClose($file)
RunWait ("nfshtool -s index.fsh", @ScriptDir & "\install\UISuni-portrait\" & $previewteam)
EndIf
Next
FileMove ( @ScriptDir & "\install\UISuni-portrait\*.fsh" , @ScriptDir & "\install\*.fsh")
DirRemove ( @ScriptDir & "\install\UISuni-portrait" ,1)
EndIf
#endregion uniform_previews


$logosfiles = _RecursiveFileSearch($sPath, 'l\d{3}\.fsh',".", 1, true)
If $logosfiles[0] >= 1 Then
For $logosscount = 1 to $logosfiles[0]
$rawname = _PathSplit($logosfiles[$logosscount], $szDrive, $szDir, $szFName, $szExt)
DirCreate (@ScriptDir & "\install\UISlogos")
FileMove ($logosfiles[$logosscount], @ScriptDir & "\install\UISlogos\" & $rawname[3]&$rawname[4],9)
Next
;~ RunWait ("eazip -c install\UISlogos\*.*",@ScriptDir)
;~ RunWait ("fifafs -ar data\frontend\logos.big install\UISlogos\*.* -c",@ScriptDir)
;~ DirRemove (@ScriptDir & "\install\UISlogos",1)
RunWait ("tyzip data\frontend\logos.big install\UISlogos\*.*",@ScriptDir,@SW_HIDE)
EndIf

$uniformsfiles = _RecursiveFileSearch($sPath, '^\d{3}\.fsh|^\d{3}\D\.fsh',".", 1, true)
If $uniformsfiles[0] >= 1 Then
For $uniformsscount = 1 to $uniformsfiles[0]
$rawname = _PathSplit($uniformsfiles[$uniformsscount], $szDrive, $szDir, $szFName, $szExt)
DirCreate (@ScriptDir & "\install\UISuniforms")
FileMove ($uniformsfiles[$uniformsscount], @ScriptDir & "\install\UISuniforms\" & $rawname[3]&$rawname[4],9)
Next
;~ RunWait ("eazip -c install\UISuniforms\*.*",@ScriptDir)
;~ RunWait ("fifafs -ar data\frontend\uniforms.big install\UISuniforms\*.* -c",@ScriptDir)
RunWait ("tyzip data\frontend\uniforms.big install\UISuniforms\*.*",@ScriptDir,@SW_HIDE)
EndIf


$fieldsfiles = _RecursiveFileSearch($sPath, '1a1f\.fsh|1a2f\.fsh|1a3f\.fsh|2a1f\.fsh|2a2f\.fsh|2a3f\.fsh|3a1f\.fsh|3a2f\.fsh|3a3f\.fsh|anaf\.fsh|arlf\.fsh|astf\.fsh|banf\.fsh|cinf\.fsh|citf\.fsh|clef\.fsh|cmdf\.fsh|comf\.fsh|corf\.fsh|crof\.fsh|dodf\.fsh|edif\.fsh|fecf\.fsh|fenf\.fsh|forf\.fsh|gref\.fsh|grif\.fsh|hirf\.fsh|hubf\.fsh|jacf\.fsh|kauf\.fsh|metf\.fsh|milf\.fsh|minf\.fsh|netf\.fsh|olyf\.fsh|pacf\.fsh|petf\.fsh|pncf\.fsh|polf\.fsh|prof\.fsh|quaf\.fsh|rfkf\.fsh|saff\.fsh|shef\.fsh|shif\.fsh|skyf\.fsh|spof\.fsh|stlf\.fsh|tigf\.fsh|trof\.fsh|turf\.fsh|uscf\.fsh|vetf\.fsh|wrif\.fsh|yanf\.fsh',".", 1, true)
If $fieldsfiles[0] >= 1 Then
For $fieldsscount = 1 to $fieldsfiles[0]
$rawname = _PathSplit($fieldsfiles[$fieldsscount], $szDrive, $szDir, $szFName, $szExt)
DirCreate (@ScriptDir & "\install\UISfields")
FileMove ($fieldsfiles[$fieldsscount], @ScriptDir & "\install\UISfields\" & $rawname[3]&$rawname[4],9)
Next
;~ RunWait ("eazip -c install\UISfields\*.*",@ScriptDir)
;~ RunWait ("fifafs -ar data\frontend\fields.big install\UISfields\*.* -c",@ScriptDir)
RunWait ("tyzip data\frontend\fields.big install\UISfields\*.*",@ScriptDir,@SW_HIDE)
EndIf


$stadiumsfiles = _RecursiveFileSearch($sPath, '1a01\.fsh|1a02\.fsh|1a03\.fsh|a1a01\.fsh|aa01\.fsh|aa02\.fsh|aa03\.fsh|aaa1\.fsh|aaa2\.fsh|aaa3\.fsh|al\.fsh|ana\.fsh|anan\.fsh|ari\.fsh|arin\.fsh|astr\.fsh|atl\.fsh|atln\.fsh|bal\.fsh|baln\.fsh|bos\.fsh|bosn\.fsh|chc\.fsh|chcn\.fsh|cin\.fsh|cine\.fsh|cinn\.fsh|cit\.fsh|citn\.fsh|cle\.fsh|clen\.fsh|clev\.fsh|col\.fsh|coln\.fsh|cros\.fsh|cws\.fsh|cwsn\.fsh|det\.fsh|detn\.fsh|fenw\.fsh|fla\.fsh|flan\.fsh|forb\.fsh|giff\.fsh|hira\.fsh|hou\.fsh|houn\.fsh|kc\.fsh|kcn\.fsh|la\.fsh|lan\.fsh|metr\.fsh|mil\.fsh|miln\.fsh|min\.fsh|mon\.fsh|nl\.fsh|nln\.fsh|nym\.fsh|nymn\.fsh|nyy\.fsh|nyyn\.fsh|oak\.fsh|oakn\.fsh|olym\.fsh|phi\.fsh|phin\.fsh|pit\.fsh|pitn\.fsh|polo\.fsh|qual\.fsh|rfk\.fsh|rfkn\.fsh|sd\.fsh|sdn\.fsh|sea\.fsh|sean\.fsh|sf\.fsh|sfn\.fsh|shib\.fsh|sprt\.fsh|stl\.fsh|stln\.fsh|tb\.fsh|tex\.fsh|texn\.fsh|tigr\.fsh|tor\.fsh|torn\.fsh|ven\.fsh|venn\.fsh|vete\.fsh',".", 1, true)
If $stadiumsfiles[0] >= 1 Then
For $stadiumsscount = 1 to $stadiumsfiles[0]
$rawname = _PathSplit($stadiumsfiles[$stadiumsscount], $szDrive, $szDir, $szFName, $szExt)
DirCreate (@ScriptDir & "\install\UISstadiums")
FileMove ($stadiumsfiles[$stadiumsscount], @ScriptDir & "\install\UISstadiums\" & $rawname[3]&$rawname[4],9)
Next
;~ RunWait ("eazip -c install\UISstadiums\*.*",@ScriptDir)
;~ RunWait ("fifafs -ar data\frontend\stadiums.big install\UISstadiums\*.* -c",@ScriptDir)
RunWait ("tyzip data\frontend\stadiums.big install\UISstadiums\*.*",@ScriptDir,@SW_HIDE)
EndIf

$portraitfiles = _RecursiveFileSearch($sPath, '^\d{4}\.fsh',".", 1, true)
If $portraitfiles[0] >= 1 Then
For $portraitscount = 1 to $portraitfiles[0]
$rawname = _PathSplit($portraitfiles[$portraitscount], $szDrive, $szDir, $szFName, $szExt)
DirCreate (@ScriptDir & "\install\UISportrait")
FileMove ($portraitfiles[$portraitscount], @ScriptDir & "\install\UISportrait\" & $rawname[3]&$rawname[4],9)
Next
;~ RunWait ("eazip -c install\UISportrait\*.*",@ScriptDir)
RunWait ("tyzip data\frontend\portrait.big install\UISportrait\*.*",@ScriptDir,@SW_HIDE)

EndIf
$modelsfiles = _RecursiveFileSearch($sPath, 'a\d{3}\D\.fsh|f\d{3}\D\.fsh|g0[0-4][0-9]\.fsh|g0[0-4][0-9]\.orl|g0[0-4][0-9]\.ord|umpirec\.fsh|umpire\.fsh|c\d{3}\.fsh|c\d{3}\.orl|c\d{3}\.ord|[0-6]gote_[fh]\.fsh|teamfont\.fsh|u[0-1][0-9][0-9]\D\.fsh|uniform\.fsh|[0-6]beard_f\.fsh|[0-8]cornr\.fsh|[0-6]mulet_[l|s]\.fsh|[0-6]musta_[abcd]\.fsh|[0-6]shrt[abc]_[ls]\.fsh|[0-6]soulp\.fsh',".", 1, true)
If $modelsfiles[0] >= 1 Then
For $modelscount = 1 to $modelsfiles[0]
$rawname = _PathSplit($modelsfiles[$modelscount], $szDrive, $szDir, $szFName, $szExt)
DirCreate (@ScriptDir & "\install\UISmodels")
FileMove ($modelsfiles[$modelscount], @ScriptDir & "\install\UISmodels\" & $rawname[3]&$rawname[4],9)
Next
;~ RunWait ("eazip -c install\UISmodels\*.*",@ScriptDir)
FileSetAttrib(@ScriptDir & "\data\models.big", "-R")
RunWait ("tyzip data\models.big install\UISmodels\*.* ",@ScriptDir,@SW_HIDE)


EndIf
$bkgndsfiles = _RecursiveFileSearch($sPath, '^00be\.fsh|^00bp\.fsh|^00br\.fsh|^00bs\.fsh|^00bt\.fsh|^01be\.fsh|^01bg\.fsh|^02bd\.fsh|^03ba\.fsh|^03be\.fsh|^03bf\.fsh|^03bg\.fsh|^03bh\.fsh|^04ba\.fsh|^04be\.fsh|^05bd\.fsh|^05be\.fsh|^06be\.fsh|^07bd\.fsh|^08bd\.fsh|^08be\.fsh|^09bd\.fsh|^09be\.fsh|^10bd\.fsh|^10be\.fsh|^10bf\.fsh|^11bd\.fsh|^11be\.fsh|^12be\.fsh|^13bd\.fsh|^13be\.fsh|^13bf\.fsh|^13bg\.fsh|^13bh\.fsh|^14bd\.fsh|^14be\.fsh|^15be\.fsh|^16be\.fsh|^17be\.fsh|^18be\.fsh|^19be\.fsh|^20be\.fsh|^21bd\.fsh|^21be\.fsh|^22bc\.fsh|^22bd\.fsh|^23bd\.fsh|^24bd\.fsh|^24be\.fsh|^25bd\.fsh|^25be\.fsh|^27bd\.fsh|^28bd\.fsh|^29bd\.fsh|^29be\.fsh|^29bf\.fsh|^29bg\.fsh|^32bd\.fsh|^34bd\.fsh|^37bd\.fsh|^39bd\.fsh|^40bd\.fsh|^44bd\.fsh|^45bd\.fsh|^49bd\.fsh|^50bd\.fsh|^51bd\.fsh|^52bd\.fsh|^55bd\.fsh|^56bd\.fsh|^58bd\.fsh|^59bd\.fsh|^60st\.fsh|^61st\.fsh|^62st\.fsh|^63st\.fsh|^64st\.fsh|^65st\.fsh|^70om\.fsh|^80cy\.fsh|^80mg\.fsh|^81cy\.fsh|^81mg\.fsh|^82cy\.fsh|^82om\.fsh|^83cy\.fsh|^84cy\.fsh|^85cy\.fsh|^86cy\.fsh|^87cy\.fsh|^88cy\.fsh|^89cy\.fsh|^90\.fsh|^90cy\.fsh|^91\.fsh|^91cy\.fsh|^92\.fsh|^92cy\.fsh|^93\.fsh|^93cy\.fsh|^94\.fsh|^94cy\.fsh|^95\.fsh|^95cy\.fsh|^96\.fsh',".", 1, true)
If $bkgndsfiles[0] >= 1 Then
For $bkgndscount = 1 to $bkgndsfiles[0]
$rawname = _PathSplit($bkgndsfiles[$bkgndscount], $szDrive, $szDir, $szFName, $szExt)
DirCreate (@ScriptDir & "\install\UISbkgnds")
FileMove ($bkgndsfiles[$bkgndscount], @ScriptDir & "\install\UISbkgnds\" & $rawname[3]&$rawname[4],9)
Next
;~ RunWait ("eazip -c install\UISbkgnds\*.*",@ScriptDir)
;~ RunWait ("fifafs -ar data\frontend\bkgnds.big install\UISbkgnds\*.* -c",@ScriptDir)
RunWait ("tyzip data\frontend\bkgnds.big install\UISbkgnds\*.*",@ScriptDir,@SW_HIDE)
EndIf


$rawdatafiles = _RecursiveFileSearch($sPath, '.*day.*\.txt|.*nite.*\.txt|.*dusk.*\.txt|.*dome.*\.txt|.*night.*\.txt|script.*\.txt|datafile\.txt|.*flow\.txt',".", 1, true)
If $rawdatafiles[0] >= 1 Then
For $rawdatacount = 1 to $rawdatafiles[0]
$rawname = _PathSplit($rawdatafiles[$rawdatacount], $szDrive, $szDir, $szFName, $szExt)
DirCreate (@ScriptDir & "\install\UISrawdata")
FileMove ($rawdatafiles[$rawdatacount], @ScriptDir & "\install\UISrawdata\" & $rawname[3]&$rawname[4],9)
Next
;~ RunWait ("eazip -c install\UISrawdata\*.*",@ScriptDir)
;~ RunWait ("fifafs -ar data\datafile\datafile.big install\UISrawdata\*.* -c",@ScriptDir)
RunWait ("tyzip data\datafile\datafile.big install\UISrawdata\*.*",@ScriptDir,@SW_HIDE)
EndIf

$pnamedatfiles = _RecursiveFileSearch($sPath, '\d{4}\.dat',".", 1, true)
If $pnamedatfiles[0] >= 1 Then
For $pnamedatcount = 1 to $pnamedatfiles[0]
$rawname = _PathSplit($pnamedatfiles[$pnamedatcount], $szDrive, $szDir, $szFName, $szExt)
DirCreate (@ScriptDir & "\install\UISpnamedat")
FileMove ($pnamedatfiles[$pnamedatcount], @ScriptDir & "\install\UISpnamedat\" & $rawname[3]&$rawname[4],9)
Next
RunWait ("fifafs -ar data\audio\cd\spch_pa\pnamedat.big install\UISpnamedat\*.*",@ScriptDir)
;~ RunWait ("tyzip data\audio\cd\spch_pa\pnamedat.big install\UISpnamedat\*.*",@ScriptDir,@SW_HIDE)
EndIf


$pnamehdrfiles = _RecursiveFileSearch($sPath, '\d{4}\.hdr',".", 1, true)
If $pnamehdrfiles[0] >= 1 Then
For $pnamehdrcount = 1 to $pnamehdrfiles[0]
$rawname = _PathSplit($pnamehdrfiles[$pnamehdrcount], $szDrive, $szDir, $szFName, $szExt)
DirCreate (@ScriptDir & "\install\UISpnamehdr")
FileMove ($pnamehdrfiles[$pnamehdrcount], @ScriptDir & "\install\UISpnamehdr\" & $rawname[3]&$rawname[4],9)
Next
RunWait ("fifafs -ar data\audio\spch_pa\pnamehdr.big install\UISpnamehdr\*.*",@ScriptDir)
;~ RunWait ("tyzip data\audio\spch_pa\pnamehdr.big install\UISpnamehdr\*.*",@ScriptDir,@SW_HIDE)
EndIf


$pbpnamedatfiles = _RecursiveFileSearch($sPath, '\d{4}\D\.dat',".", 1, true)
If $pbpnamedatfiles[0] >= 1 Then
For $pbpnamedatcount = 1 to $pbpnamedatfiles[0]
$rawname = _PathSplit($pbpnamedatfiles[$pbpnamedatcount], $szDrive, $szDir, $szFName, $szExt)
DirCreate (@ScriptDir & "\install\UISpbppnamedat")
FileMove ($pbpnamedatfiles[$pbpnamedatcount], @ScriptDir & "\install\UISpbpnamedat\" & $rawname[3]&$rawname[4],9)
Next
RunWait ("fifafs -ar data\audio\cd\spch_pbp\pnamedat.big install\UISpbpnamedat\*.*",@ScriptDir)
;~ RunWait ("tyzip data\audio\cd\spch_pbp\pnamedat.big install\UISpbpnamedat\*.*",@ScriptDir,@SW_HIDE)
EndIf


$pbpnamehdrfiles = _RecursiveFileSearch($sPath, '\d{4}\D\.hdr',".", 1, true)
If $pbpnamehdrfiles[0] >= 1 Then
For $pbpnamehdrcount = 1 to $pbpnamehdrfiles[0]
$rawname = _PathSplit($pbpnamehdrfiles[$pbpnamehdrcount], $szDrive, $szDir, $szFName, $szExt)
DirCreate (@ScriptDir & "\install\UISpbpnamehdr")
FileMove ($pbpnamehdrfiles[$pbpnamehdrcount], @ScriptDir & "\install\UISpbpnamehdr\" & $rawname[3]&$rawname[4],9)
Next
RunWait ("fifafs -ar data\audio\spch_pbp\pnamehdr.big install\UISpbpnamehdr\*.*",@ScriptDir)
;~ RunWait ("tyzip data\audio\spch_pbp\pnamehdr.big install\UISpbpnamehdr\*.*",@ScriptDir,@SW_HIDE)
EndIf


If FileExists (@ScriptDir & "\fifafs_script.txt") Then RunWait ("fifafs fifafs_script.txt",@ScriptDir)
If FileExists (@ScriptDir & "\install\stdnmhdr") Then RunWait ("fifafs -ar data\audio\spch_pbp\stdnmhdr.big install\stdnmhdr\*.*",@ScriptDir)
If FileExists (@ScriptDir & "\install\stdnmdat") Then RunWait ("fifafs -ar data\audio\cd\spch_pbp\stdnmdat.big install\stdnmdat\*.*",@ScriptDir)
If FileExists (@ScriptDir & "\install\pbp-tnamehdr") Then RunWait ("fifafs -ar data\audio\spch_pbp\tnamehdr.big install\pbp-tnamehdr\*.*",@ScriptDir)
If FileExists (@ScriptDir & "\install\pbp-tnamedat") Then RunWait ("fifafs -ar data\audio\cd\spch_pbp\tnamedat.big install\pbp-tnamedat\*.*",@ScriptDir)
If FileExists (@ScriptDir & "\install\pa-tnamehdr") Then RunWait ("fifafs -ar data\audio\spch_pa\tnamehdr.big install\pa-tnamehdr\*.*",@ScriptDir)
If FileExists (@ScriptDir & "\install\pa-tnamedat") Then RunWait ("fifafs -ar data\audio\cd\spch_pa\tnamedat.big install\pa-tnamedat\*.*",@ScriptDir)


#region init-files
$initstayfiles = _RecursiveFileSearch($sPath, 'ball\.o|bat\.o|batshadw\.o|bgbody\.ord|bghead\.ord|bghead04\.ord|brknbat\.o|collbody\.gld|hibody\.ord|hishadow\.o|lobody\.ord|lohead\.ord|lohead04\.ord|loshadow\.o|mebody\.ord|mehead\.ord|mehead04\.ord|ball\.fsh|ballshdw\.fsh|ballsprt\.fsh|basebody\.fsh|basehead\.fsh|bat\.fsh|cglv\.fsh|fglv\.fsh|flesh\.fsh|gagnegogglesframe\.fsh|gagnegoggleslens\.fsh|helmenvm\.fsh|johndamonhair\.fsh|majt\.fsh|mannyramirezhair\.fsh|white\.fsh',".", 1, true)
If $initstayfiles[0] >= 1 Then
For $initstaycount = 1 to $initstayfiles[0]
$rawname = _PathSplit($initstayfiles[$initstaycount], $szDrive, $szDir, $szFName, $szExt)
DirCreate (@ScriptDir & "\install\UISinitstay")
FileMove ($initstayfiles[$initstaycount], @ScriptDir & "\install\UISinitstay\" & $rawname[3]&$rawname[4],9)
Next
$file = FileOpen(@ScriptDir & "\initstay.txt", 1)
FileWriteLine($file, "mountbig initstay.big , stay" & @CRLF)
If FileExists(@ScriptDir & "\install\UISinitstay\ball.fsh") Then FileWriteLine($file, "-ar models/textures/ball.fsh , install\UISinitstay\ball.fsh , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\ballshdw.fsh") Then FileWriteLine($file, "-ar models/textures/ballshdw.fsh , install\UISinitstay\ballshdw.fsh , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\ballsprt.fsh") Then FileWriteLine($file, "-ar models/textures/ballsprt.fsh , install\UISinitstay\ballsprt.fsh , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\basebody.fsh") Then FileWriteLine($file, "-ar models/textures/basebody.fsh , install\UISinitstay\basebody.fsh , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\basehead.fsh") Then FileWriteLine($file, "-ar models/textures/basehead.fsh , install\UISinitstay\basehead.fsh , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\bat.fsh") Then FileWriteLine($file, "-ar models/textures/bat.fsh , install\UISinitstay\bat.fsh , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\cglv.fsh") Then FileWriteLine($file, "-ar models/textures/cglv.fsh , install\UISinitstay\cglv.fsh , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\fglv.fsh") Then FileWriteLine($file, "-ar models/textures/fglv.fsh , install\UISinitstay\fglv.fsh , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\flesh.fsh") Then FileWriteLine($file, "-ar models/textures/flesh.fsh , itstall\flesh.fsh , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\gagnegogglesframe.fsh") Then FileWriteLine($file, "-ar models/textures/gagnegogglesframe.fsh , install\UISinitstay\gagnegogglesframe.fsh , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\gagnegoggleslens.fsh") Then FileWriteLine($file, "-ar models/textures/gagnegoggleslens.fsh , install\UISinitstay\gagnegoggleslens.fsh , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\helmenvm.fsh") Then FileWriteLine($file, "-ar models/textures/helmenvm.fsh , install\UISinitstay\helmenvm.fsh , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\johndamonhair.fsh") Then FileWriteLine($file, "-ar models/textures/johndamonhair.fsh , instally\johndamonhair.fsh , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\majt.fsh") Then FileWriteLine($file, "-ar models/textures/majt.fsh , install\UISinitstay\majt.fsh , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\mannyramirezhair.fsh") Then FileWriteLine($file, "-ar models/textures/mannyramirezhair.fsh , install\UISinitstay\mannyramirezhair.fsh , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\white.fsh") Then FileWriteLine($file, "-ar models/textures/white.fsh , install\UISinitstay\white.fsh , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\ball.o") Then FileWriteLine($file, "-ar models/ball.o , install\UISinitstay\ball.o , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\bat.o") Then FileWriteLine($file, "-ar models/bat.o , install\UISinitstay\bat.o , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\batshadw.o") Then FileWriteLine($file, "-ar models/batshadw.o , install\UISinitstay\batshadw.o , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\bgbody.ord") Then FileWriteLine($file, "-ar models/bgbody.ord , install\UISinitstay\bgbody.ord , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\bghead.ord") Then FileWriteLine($file, "-ar models/bghead.ord , install\UISinitstay\bghead.ord , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\bghead04.ord") Then FileWriteLine($file, "-ar models/bghead04.ord , install\UISinitstay\bghead04.ord , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\brknbat.o") Then FileWriteLine($file, "-ar models/brknbat.o , install\UISinitstay\brknbat.o , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\collbody.gld") Then FileWriteLine($file, "-ar models/collbody.gld , install\UISinitstay\collbody.gld , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\hibody.ord") Then FileWriteLine($file, "-ar models/hibody.ord , install\UISinitstay\hibody.ord , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\hishadow.o") Then FileWriteLine($file, "-ar models/hishadow.o , install\UISinitstay\hishadow.o , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\lobody.ord") Then FileWriteLine($file, "-ar models/lobody.ord , install\UISinitstay\lobody.ord , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\lohead.ord") Then FileWriteLine($file, "-ar models/lohead.ord , install\UISinitstay\lohead.ord , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\lohead04.ord") Then FileWriteLine($file, "-ar models/lohead04.ord , install\UISinitstay\lohead04.ord , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\loshadow.o") Then FileWriteLine($file, "-ar models/loshadow.o , install\UISinitstay\loshadow.o , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\mebody.ord") Then FileWriteLine($file, "-ar models/mebody.ord , install\UISinitstay\mebody.ord , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\mehead.ord") Then FileWriteLine($file, "-ar models/mehead.ord , install\UISinitstay\mehead.ord , stay")
If FileExists(@ScriptDir & "\install\UISinitstay\mehead04.ord") Then FileWriteLine($file, "-ar models/mehead04.ord , install\UISinitstay\mehead04.ord , stay")
FileClose($file)
RunWait("fifaFS.exe -e data\initstaz.big initstay.big initstay.big" , @ScriptDir )
RunWait("eazip -u initstay.big" , @ScriptDir )
RunWait ("fifafs.exe initstay.txt" , @ScriptDir)
RunWait ("eazip -c initstay.big" , @ScriptDir)
RunWait ("fifafs -ar data\initstaz.big initstay.big" , @ScriptDir)
FileDelete (@ScriptDir & "\initstay.big")
FileDelete (@ScriptDir & "\initstay.txt")
EndIf
$initpurgefiles = _RecursiveFileSearch($sPath, 'bgbody\.orl|bghead\.orl|bghead04\.orl|hibody\.orl|lobody\.orl|lohead\.orl|lohead04\.orl|mebody\.orl|mehead\.orl|mehead04\.orl',".", 1, true)
If $initpurgefiles[0] >= 1 Then
For $initpurgecount = 1 to $initpurgefiles[0]
$rawname = _PathSplit($initpurgefiles[$initpurgecount], $szDrive, $szDir, $szFName, $szExt)
DirCreate (@ScriptDir & "\install\UISinitpurge")
FileMove ($initpurgefiles[$initpurgecount], @ScriptDir & "\install\UISinitpurge\" & $rawname[3]&$rawname[4],9)
Next
$file = FileOpen(@ScriptDir & "\initpurge.txt", 1)
FileWriteLine($file, "mountbig initpurge.big , purge" & @CRLF)
If FileExists(@ScriptDir & "\install\UISinitpurge\bgbody.orl") Then FileWriteLine($file, "-ar models/bgbody.orl , install\UISinitpurge\bgbody.orl , purge")
If FileExists(@ScriptDir & "\install\UISinitpurge\bghead.orl") Then FileWriteLine($file, "-ar models/bghead.orl , install\UISinitpurge\bghead.orl , purge")
If FileExists(@ScriptDir & "\install\UISinitpurge\bghead04.orl") Then FileWriteLine($file, "-ar models/bghead04.orl , install\UISinitpurge\bghead04.orl , purge")
If FileExists(@ScriptDir & "\install\UISinitpurge\hibody.orl") Then FileWriteLine($file, "-ar models/hibody.orl , install\UISinitpurge\hibody.orl , purge")
If FileExists(@ScriptDir & "\install\UISinitpurge\lobody.orl") Then FileWriteLine($file, "-ar models/lobody.orl , install\UISinitpurge\lobody.orl , purge")
If FileExists(@ScriptDir & "\install\UISinitpurge\lohead.orl") Then FileWriteLine($file, "-ar models/lohead.orl , install\UISinitpurge\lohead.orl , purge")
If FileExists(@ScriptDir & "\install\UISinitpurge\lohead04.orl") Then FileWriteLine($file, "-ar models/lohead04.orl , install\UISinitpurge\lohead04.orl , purge")
If FileExists(@ScriptDir & "\install\UISinitpurge\mebody.orl") Then FileWriteLine($file, "-ar models/mebody.orl , install\UISinitpurge\mebody.orl , purge")
If FileExists(@ScriptDir & "\install\UISinitpurge\mehead.orl") Then FileWriteLine($file, "-ar models/mehead.orl , install\UISinitpurge\mehead.orl , purge")
If FileExists(@ScriptDir & "\install\UISinitpurge\mehead04.orl") Then FileWriteLine($file, "-ar models/mehead04.orl , install\UISinitpurge\mehead04.orl , purge")
FileClose($file)
RunWait("fifaFS.exe -e data\initprgz.big initpurge.big initpurge.big" , @ScriptDir )
RunWait("eazip -u initpurge.big" , @ScriptDir )
RunWait ("fifafs.exe initpurge.txt" , @ScriptDir)
RunWait ("eazip -c initpurge.big" , @ScriptDir)
RunWait ("fifafs -ar data\initprgz.big initpurge.big" , @ScriptDir)
FileDelete (@ScriptDir & "\initpurge.big")
FileDelete (@ScriptDir & "\initpurge.txt")
EndIf
EndIf
SplashOff()
FileDelete (@ScriptDir &"\installing.bmp")
#endregion init-files
#endregion installfiles
If $exeafter = "1" Then
RunWait(@ScriptDir & "\install\" & IniRead(@ScriptDir & "\install\TiT.ini", "Execute_file", "File_name2", ""),@ScriptDir)
EndIf
FileInstall ("cleanup.bmp",@ScriptDir &"\cleanup.bmp")
SplashImageOn ( "Please Wait", @ScriptDir &"\cleanup.bmp" , 500 , 200 , -1 , -1 , 18 )
DirRemove (@ScriptDir & "\install",1)
FileDelete (@ScriptDir & "\fifafs0.log")
FileDelete (@ScriptDir & "\fifafs_script.txt")
FileDelete (@ScriptDir & "\filelist.txt")
SplashOff()
FileDelete (@ScriptDir &"\cleanup.bmp")
If FileExists (@ProgramFilesDir & "\kraw\TiT.key") Then
	$Keycheckdll = PluginOpen(@ProgramFilesDir & "\kraw\MD5Hash.dll")
	If MD5Hash(@ProgramFilesDir & "\kraw\TiT.key", 1, True) = "e61f3bee28d9d152e4d027c7bfaaf4f3" Then
		MsgBox (4096, "Finished", "Mod has been installed")
		PluginClose($Keycheckdll)
		_restart()
	EndIf
	PluginClose($Keycheckdll)
EndIf
_OpenWeb("http://www.eamods.com/Treasury.html")
$exeafter = "0"
$reademecheck = "0"
GUICtrlSetData ( $hFile, @ScriptDir & "\")
EndSelect
Wend
Func _CopyWithProgress($SourcePath, $DestPath, $Replace=0)
If Not FileExists($SourcePath) Then Return SetError(1, 0, -1)
If Not StringInStr(FileGetAttrib($DestPath), "D") And Not DirCreate($DestPath) Then Return SetError(2, 0, "")
If $Replace <> 0 And $Replace <> 1 Then SetError(3, 0, "")
Local $PathName = StringRegExpReplace($SourcePath, "^.*\\", "")
Local $Progress=0, $Counter, $ReadySize, $MidlePath, $Ready, $TimeRemained
Local $CurrentFilePath, $CurrentFileName, $CurrentFilePathName, $CurrentParentDirName
ProgressOn("Copy Files...", "Copy: " & $PathName, "Getting dir structure" & @LF & "Please wait...")
Local $TotalDirSize = DirGetSize($SourcePath)
Local $FilesArr = _FileListToArrayEx($SourcePath)
Local $FilesCount = UBound($FilesArr)-1
Local $ProgressStep = 100 / $FilesCount
If IsArray($FilesArr) Then
For $i = 1 To UBound($FilesArr)-1
$CurrentFilePath = $FilesArr[$i]
$CurrentFileName = StringRegExpReplace($CurrentFilePath, "^.*\\", "")
$CurrentFilePathName = StringReplace($CurrentFilePath, $SourcePath & "\", "")
$CurrentParentDirName = _GetParentDirName($CurrentFilePath)
$Progress += $ProgressStep
$Counter += 1
$ReadySize = FileGetSize($CurrentFilePath)
$MidlePath = _GetMidlePath($CurrentFilePath)
$Ready = $Counter & "/" & $FilesCount
$TimeRemained = _GetTimeRemained($TotalDirSize, $ReadySize, $FilesCount, $Counter)
ProgressSet($Progress, 'Copy... from "' & $CurrentParentDirName & '" to "' & $CurrentParentDirName & '"' & @LF & _
				$MidlePath & @LF & "Ready: " & $Ready)
FileCopy($CurrentFilePath, $DestPath & "\" & $CurrentFilePathName, 8+$Replace)
Next
EndIf
ProgressOff()
EndFunc
Func _FileCopy($fromFile,$tofile)
Local $FOF_RESPOND_YES = 16
Local $FOF_SIMPLEPROGRESS = 256
$winShell = ObjCreate("shell.application")
$winShell.namespace($tofile).CopyHere($fromFile,$FOF_RESPOND_YES)
EndFunc
Func _FileListToArrayEx($sPath, $sMask='*')
Local $i, $j, $blist, $rlist[1]=[0], $dlist = _DirListToArray($sPath)
_ArrayAdd ($dlist, $sPath)
For $i=1 To $dlist [0] +1
$blist = _FileListToArray ($dlist [$i], $sMask, 1)
If Not @error Then
For $j=1 To $blist [0]
_ArrayAdd ($rlist, $dlist[$i] & "\" & $blist [$j])
Next
EndIf
Next
$rlist [0] = UBound ($rlist) - 1
Return $rlist
EndFunc
Func _DirListToArray($sPath)
Local $rlist[2]=[1, $sPath], $blist, $alist=_FileListToArray ($sPath, '*', 2)
If IsArray ($alist) Then
For $i=1 To $alist [0]
_ArrayAdd ($rlist, $sPath & "\" & $alist [$i])
$blist = _DirListToArray ($sPath & "\" & $alist [$i])
If $blist[0]>0 Then
For $j=1 To $blist [0]
_ArrayAdd ($rlist, $blist [$j])
Next
EndIf
Next
EndIf
$rlist[0] = UBound($rlist) - 1
Return $rlist
EndFunc
Func _GetMidlePath($sPath)
If StringLen($sPath) <= 50 Then Return $sPath
Local $StartPath = StringLeft($sPath, 25)
Local $EndPath = StringTrimLeft($sPath, StringInStr($sPath, "\", 0, -2)-1)
Return $StartPath & "..." & $EndPath
EndFunc
Func _GetParentDirName($FullName)
Local $LastSlashPos = StringInStr($FullName, "\", 0, -1)
Local $SecondLastSlashPos = StringInStr($FullName, "\", 0, -2)
Return StringMid($FullName, $SecondLastSlashPos+1, $LastSlashPos-$SecondLastSlashPos-1)
EndFunc
Func _GetTimeRemained($TotalSize, $CurrentSize, $FilesCount, $CurrentFilesCount)
Local $NumLevl = 0.5
If $TotalSize <= $CurrentSize Then Return _SecsToTime(0)
Switch $FilesCount - $CurrentFilesCount
Case 0 To 100
$NumLevl = 0.1
Case 100 To 1000
$NumLevl = 0.5
Case 1000 to 2000
$NumLevl = 1
Case Else
$NumLevl = 2
EndSwitch
$Secs = ($TotalSize * $NumLevl) / (3600 * $CurrentFilesCount) - ($CurrentSize * $NumLevl) / (3600 * $CurrentFilesCount)
Return _SecsToTime($Secs)
EndFunc
Func _SecsToTime($iTicks, $Delim=":")
If Number($iTicks) >= 0 Then
$iHours = Int($iTicks / 3600)
$iTicks = Mod($iTicks, 3600)
$iMins = Int($iTicks / 60)
$iSecs = Round(Mod($iTicks, 60))
If StringLen($iHours) = 1 Then $iHours = "0" & $iHours
If StringLen($iMins) = 1 Then $iMins = "0" & $iMins
If StringLen($iSecs) = 1 Then $iSecs = "0" & $iSecs
Return $iHours & $Delim & $iMins & $Delim & $iSecs
EndIf
Return SetError(1, 0, 0)
EndFunc
Func _finddrive($label)
SplashTextOn("Waiting", "Waiting for CD to initialize", 375, 50, -1, -1, 4, "", 24)
Sleep(20000)
SplashOff()
$drvs = DriveGetDrive("CDROM")
If Not @error Then
For $i = 1 To $drvs[0]
If DriveStatus($drvs[$i] & "\") = "READY" Then
If DriveGetLabel ( $drvs[$i] ) = $label Then
$mvpcd = $drvs[$i]
EndIf
EndIf
Next
EndIf
EndFunc
Func _OpenWeb($URL)
    $oWeb = ObjCreate("Shell.Application")
    $oWeb.Open($URL)
EndFunc
Func _FileCopyEx($s_File, $s_newFile)
    Local $SHFILEOPSTRUCT = DllStructCreate("hwnd hwnd;uint wFunc;ptr pFrom;ptr pTo;int fFlags;int fAnyOperationsAborted;hwnd hNameMappings;ptr lpszProgressTitle")
    Local $SHFILEOPSTRUCT_From = DllStructCreate("char pFrom[" & StringLen($s_File)+2 & "]")
    DllStructSetData($SHFILEOPSTRUCT_From, "pFrom", $s_File)
    Local $SHFILEOPSTRUCT_To = DllStructCreate("char pTo[" & StringLen($s_newFile)+2 & "]")
    DllStructSetData($SHFILEOPSTRUCT_To, "pTo", $s_newFile)
    DllStructSetData($SHFILEOPSTRUCT, "wFunc", 2) ; FO_COPY = 2
    DllStructSetData($SHFILEOPSTRUCT, "pFrom", DllStructGetPtr($SHFILEOPSTRUCT_From))
    DllStructSetData($SHFILEOPSTRUCT, "pTo", DllStructGetPtr($SHFILEOPSTRUCT_To))
    DllStructSetData($SHFILEOPSTRUCT, "fFlags", 16)         ; <---- Added
    Local $i_State = DllCall("shell32.dll", "int", "SHFileOperation", "ptr", DllStructGetPtr($SHFILEOPSTRUCT))
    $SHFILEOPSTRUCT = 0
    If Not $i_State[0] Then
        SetError(1)
        Return 0
    EndIf
    SetError(0)
    Return 1
EndFunc
Func _RecursiveFileSearch($RFSstartDir, $RFSFilepattern = ".", $RFSFolderpattern = ".", $RFSFlag = 0, $RFSrecurse = true, $RFSdepth = 0)
   ;Ensure starting folder has a trailing slash
     If StringRight($RFSstartDir, 1) <> "\" Then $RFSstartDir &= "\"
     If $RFSdepth = 0 Then
       ;Get count of all files in subfolders for initial array definition
         $RFSfilecount = DirGetSize($RFSstartDir, 1)
       ;File count + folder count (will be resized when the function returns)
         Global $RFSarray[$RFSfilecount[1] + $RFSfilecount[2] + 1]
     EndIf
     $RFSsearch = FileFindFirstFile($RFSstartDir & "*.*")
     If @error Then Return
   ;Search through all files and folders in directory
     While 1
         $RFSnext = FileFindNextFile($RFSsearch)
         If @error Then ExitLoop
       ;If folder and recurse flag is set and regex matches
         If StringInStr(FileGetAttrib($RFSstartDir & $RFSnext), "D") Then
             If $RFSrecurse AND StringRegExp($RFSnext, $RFSFolderpattern, 0) Then
                 _RecursiveFileSearch($RFSstartDir & $RFSnext, $RFSFilepattern, $RFSFolderpattern, $RFSFlag, $RFSrecurse, $RFSdepth + 1)
                 If $RFSFlag <> 1 Then
                   ;Append folder name to array
                     $RFSarray[$RFSarray[0] + 1] = $RFSstartDir & $RFSnext
                     $RFSarray[0] += 1
                 EndIf
             EndIf
         ElseIf StringRegExp($RFSnext, $RFSFilepattern, 0) AND $RFSFlag <> 2 Then
           ;Append file name to array
             $RFSarray[$RFSarray[0] + 1] = $RFSstartDir & $RFSnext
             $RFSarray[0] += 1
         EndIf
     WEnd
     FileClose($RFSsearch)
     If $RFSdepth = 0 Then
         Redim $RFSarray[$RFSarray[0] + 1]
         Return $RFSarray
     EndIf
 EndFunc ;==>RecursiveFileSearch
 
 Func _EAzipFiles()
$compressfiles = _FileListToArray ( @ScriptDir & "\install\"&$installfolder)

;~ _ArrayDisplay($compressfiles, "_ArrayDisplay() Test")

ProgressOn("Compressing File for MVP", "", "0 percent")
For $i = 1 to $compressfiles[0]
	$compresspercent = Round(($i/$compressfiles[0])*100,0)
	ProgressSet($compresspercent , $compresspercent & " percent")
	RunWait ("eazip -c install\"&$installfolder & "\"& $compressfiles[$i],"",@SW_HIDE)
Next
ProgressSet(100 , "Done", "Complete")
sleep(500)
ProgressOff()
EndFunc
Func _restart()
    If @Compiled = 1 Then
        Run( FileGetShortName(@ScriptFullPath))
    Else
        Run( FileGetShortName(@AutoItExe) & " " & FileGetShortName(@ScriptFullPath))
    EndIf
    Exit
EndFunc

Func pause()
    MsgBox (4096 , "pause","pause")
EndFunc