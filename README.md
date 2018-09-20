Supported archive formats are: 7z, zip, rar, TiT, & ace

TiT 2.0.5
Installer Change

TiT 2.0.4
Added checks to make sure supports files exist

TiT 2.0.3
Added xDelta INI support

TiT 2.0.2
Fixed backup issues with Load*.big files
Fixed backup issues with roster files
added backup of 00000000.256 files

TiT 2.0.1
Forces you to run as admin
installer no longer downloads/installs runtimes, YOU have to do that on your own

If you get a side-by-side error when using TiT, you have to uninstall and reinstall Microsoft Visual C++ 2008 Redistributable Package (it is a known MS error)

TiT RC20 or TiT 2.0
completely rewritten to be more user friendly

New features
Checks file integrity VS a database on the EAmods server, so TiT will have to have internet access when installing files with the extension .TiT. The bigger the file the longer it takes to check. If it fails it will inform you to redownload the file and exit TiT

Now has a 90% graphically display, only console windows are as follows:
A brief one when reinstalling MVP
2 brief console windows when adding files to initprgz.big
2 brief console windows when adding files to initstaz.big
Multiple console screens when adding uniform preview screens
1 console screens to unpack ACE files
I think that is it

Splash screens explaining what is happening


TiT_expert has also been reworked but is now slower because of it, it now copies instead of moving files where needed to install. So when finished your files will remain exactly the same. You will only notice the slow down when install large numbers of files, a normal mod of say 10 files will not be too slow but when installing over 4000 files like with the Final models.big file it can be painfully slow


TiT should be much faster now if larger mods, and the same speed if not better on smaller mods


RC14
Added 1x/2x choice. If you have 2 folders one named 1x and one named 2x TiT will ask which one you want to install

RC13
Bug fix - Unpacks CD 1 with 7zip instead of unzip
Bug fix - TiT_expert would error out if no install folder existed, now it just makes one

RC12
Fixed:
Issues where site loaded before the 2nd EXE was run from INI file.
-Now when you are taken to EAmods everything is 100% installed.
-Do not exit TiT before the web page loads because it is not DONE installing whatever
Issue where some archive files had to be in the same folder as TiT to install correctly (07-reboot for one)
Various initstaz.big & initprgz.big install issues
array error (I hope)

Added:
ability to install uniform select screens
-must be named after the uniform, if it is a select screen for uniform u020a.fsh file but be named 020a.bmp
-It automatically creates the little fsh place holders example 020a.fsh that goes in the uniforms.big file
Ability to handle new extension
-*.TiT

Additions for RC11
Added image (PNG, JPG, BMP) viewer (TiT.ini to select file)
Killed Installer Thingy


Additions for RC10
added TiT.ini support
R10 or higher will be required for all future 07/08 releases
fixed it so it should still install mods (mainly a roster issue) even if files a write protected

See sample TiT.ini, all options listed but turned off. Include an INI file in the root of you archive for your mod.
For people like KC and others who make there own installers all they would have to do to make their release TiT compatible would be to include a INI like this:


[Execute_file]
Launch=2
File_name2=install.exe


here is one with options explained, please see included INI file for one with all backup files listed (options not explained in sample INI file)

[Readme]
launch=1 ;0=no 1=yes
File_name=whatever.txt

[Modder_Site]
launch=1 ;0=no 1=yes
Site_name=http://www.whatever.com

[Execute_file]
Launch=1 ; 0/1/2/3 0= none, 1=before, 2=after , 3=both
File_name1=file1.exe
File_name2=file2.exe

[Reinstall]
reinstall=1 ;0=no 1=yes This option reinstalls MVP 2005 via users CDs

[backup]
portrait.big=1 ;0=no 1=yes
Models.big=1 ;0=no 1=yes
etc=1 ;0=no 1=yes



BACK to old readme file

TiT will install most any file into your game, they are a couple drawbacks:

If the archive you have downloaded contains multiple files with the same file names inside you have no idea which one is going to be installed (in reality all are installed, one on top of the over so it really overwrites it). Very few mods on either EAmo

Trues' ESPN 07 1.3 Overlay

The main files are:
igonly.big
ingame.big
logos.big
readme.txt

But is also contains a folder "no infobar" which has another ingame.big file. A way for modders to avoid this conflict would be to put duplicate files (in this case most will want the info bar anyway) in a archive of its own inside in the main archive. D

One other note for mods to be installed they have to be the correct file name very few mods rename the files but it has been known to happen.

This program supports the following files

`Complete files`
`credits.tsv`
`FEENG.LOC`
`IGENG.LOC`
`initprgz.big`
`initstaz.big`
`mat.o`
`models.big`
`profiles.big`
`anims\anims.big`
`audio\aems\batdit.abk`
`audio\aems\batmini.abk`
`audio\aems\crowd4a.abk`
`audio\aems\crowd4b.abk`
`audio\aems\hecklea.abk`
`audio\aems\heckleb.abk`
`audio\aems\hecklec.abk`
`audio\aems\heckled.abk`
`audio\aems\hecklee.abk`
`audio\aems\minicom.abk`
`audio\aems\ptcmini.abk`
`audio\aems\sfxa.abk`
`audio\aems\sfxb.abk`
`audio\aems\tpevents.a1c`
`audio\aems\tpevents.csi`
`audio\aems\umpa.abk`
`audio\aems\umpb.abk`
`audio\aems\umpc.abk`
`audio\aems\vendor.abk`
`audio\aems\vndrcbp.abk`
`audio\bdcst_mx\bdcstdat.off`
`audio\bdcst_mx\bdcsthdr.big`
`audio\bdcst_mx\bdcsthdr.off`
`audio\bdcst_mx\bdcst_mx.nam`
`audio\bdcst_mx\bdcst_mx.txt`
`audio\bdcst_mx\events.evt`
`audio\cd\aems\batdit.ast`
`audio\cd\aems\batmini.ast`
`audio\cd\aems\crowd4a.ast`
`audio\cd\aems\hecklea.ast`
`audio\cd\aems\heckleb.ast`
`audio\cd\aems\hecklec.ast`
`audio\cd\aems\heckled.ast`
`audio\cd\aems\hecklee.ast`
`audio\cd\aems\ptcmini.ast`
`audio\cd\aems\vendor.ast`
`audio\cd\aems\vndrcbp.ast`
`audio\cd\bdcst_mx\bdcstdat.big`
`audio\cd\chants\chantdat.big`
`audio\cd\hmrn_sfx\hsfxdat.big`
`audio\cd\music\menu1.asf`
`audio\cd\music\menu2.asf`
`audio\cd\music\menu3.asf`
`audio\cd\music\menu4.asf`
`audio\cd\music\menu5.asf`
`audio\cd\music\menu6.asf`
`audio\cd\music\menu7.asf`
`audio\cd\music\menu8.asf`
`audio\cd\music\menu9.asf`
`audio\cd\plyr_cht\plchtdat.big`
`audio\cd\rally\rallydat.big`
`audio\cd\spch_pa\padat.big`
`*audio\cd\spch_pa\pnamedat.big*`
`*audio\cd\spch_pa\tnamedat.big*`
`audio\cd\spch_pbp\pbpdat.big`
`*audio\cd\spch_pbp\pnamedat.big*`
`audio\cd\spch_pbp\stdnmdat.big`
`*audio\cd\spch_pbp\tnamedat.big*`
`audio\cd\stadium\stdmdat.big`
`audio\chants\chantdat.off`
`audio\chants\chanthdr.big`
`audio\chants\chanthdr.off`
`audio\chants\events.evt`
`audio\chants\spch_cht.nam`
`audio\chants\spch_cht.txt`
`audio\crowddb\audiocsv.big`
`audio\hmrn_sfx\events.evt`
`audio\hmrn_sfx\hrnsfx.nam`
`audio\hmrn_sfx\hrnsfx.txt`
`audio\hmrn_sfx\hsfxdat.off`
`audio\hmrn_sfx\hsfxhdr.big`
`audio\hmrn_sfx\hsfxhdr.off`
`audio\orca\pausesfx.bnk`
`audio\orca\zsndfrnt.gen`
`audio\plyr_cht\events.evt`
`audio\plyr_cht\plchtdat.off`
`audio\plyr_cht\plchthdr.big`
`audio\plyr_cht\plchthdr.off`
`audio\plyr_cht\plyr_cht.nam`
`audio\plyr_cht\plyr_cht.txt`
`audio\rally\dtty_org.nam`
`audio\rally\dtty_org.txt`
`audio\rally\events.evt`
`audio\rally\rallydat.off`
`audio\rally\rallyhdr.big`
`audio\rally\rallyhdr.off`
`audio\spch_pa\events.evt`
`audio\spch_pa\padat.off`
`audio\spch_pa\pahdr.big`
`audio\spch_pa\pahdr.off`
`*audio\spch_pa\pnamehdr.big*`
`audio\spch_pa\spch_pa.nam`
`audio\spch_pa\spch_pa.txt`
`*audio\spch_pa\tnamehdr.big*`
`audio\spch_pbp\events.evt`
`audio\spch_pbp\pbpdat.off`
`audio\spch_pbp\pbphdr.big`
`audio\spch_pbp\pbphdr.off`
`*audio\spch_pbp\pnamehdr.big*`
`audio\spch_pbp\spch_pbp.nam`
`audio\spch_pbp\spch_pbp.txt`
`audio\spch_pbp\stdnmhdr.big`
`*audio\spch_pbp\tnamehdr.big*`
`audio\speechdb\speechdb.big`
`audio\stadium\events.evt`
`audio\stadium\stdmdat.off`
`audio\stadium\stdmhdr.big`
`audio\stadium\stdmhdr.off`
`audio\stadium\std_spec.nam`
`audio\stadium\std_spec.txt`
`database\attrib.dat`
`database\bstats.dat`
`database\career.dat`
`database\careerp.dat`
`database\fbstats.dat`
`database\hist.dat`
`database\lhattrib.dat`
`database\lhbstats.dat`
`database\lhpstats.dat`
`database\manager.dat`
`database\org.dat`
`database\pitcher.dat`
`database\progress.big`
`database\pstats.dat`
`database\resign.csv`
`database\rhattrib.dat`
`database\rhbstats.dat`
`database\rhpstats.dat`
`database\rookie.big`
`database\roster.dat`
`database\schedule.big`
`database\team.dat`
`database\tstat.dat`
`datafile\datafile.big`
`fonts\fonts.big`
`frontend\apt.big`
`frontend\awards.big`
`frontend\bkgnds.big`
`frontend\bpattrac.big`
`frontend\bpitems.big`
`frontend\bppromos.big`
`frontend\bpsetup.big`
`frontend\bpticket.big`
`frontend\bpupgrad.big`
`frontend\bpvendor.big`
`frontend\cooplay.big`
`frontend\coopov.big`
`frontend\coopplyr.big`
`frontend\coopstad.big`
`frontend\coopteam.big`
`frontend\coopunis.big`
`frontend\easoart.big`
`frontend\feonly.big`
`frontend\feonlycm.big`
`frontend\feonlyln.big`
`frontend\fields.big`
`frontend\frontend.big`
`frontend\hrsonly.big`
`frontend\igonly.big`
`frontend\ingame.big`
`frontend\load0.big`
`frontend\load1.big`
`frontend\load10.big`
`frontend\load11.big`
`frontend\load12.big`
`frontend\load13.big`
`frontend\load14.big`
`frontend\load15.big`
`frontend\load16.big`
`frontend\load17.big`
`frontend\load18.big`
`frontend\load19.big`
`frontend\load2.big`
`frontend\load20.big`
`frontend\load21.big`
`frontend\load22.big`
`frontend\load23.big`
`frontend\load24.big`
`frontend\load25.big`
`frontend\load26.big`
`frontend\load27.big`
`frontend\load28.big`
`frontend\load29.big`
`frontend\load3.big`
`frontend\load30.big`
`frontend\load31.big`
`frontend\load32.big`
`frontend\load33.big`
`frontend\load34.big`
`frontend\load35.big`
`frontend\load36.big`
`frontend\load37.big`
`frontend\load38.big`
`frontend\load39.big`
`frontend\load4.big`
`frontend\load40.big`
`frontend\load41.big`
`frontend\load42.big`
`frontend\load43.big`
`frontend\load44.big`
`frontend\load45.big`
`frontend\load46.big`
`frontend\load47.big`
`frontend\load48.big`
`frontend\load49.big`
`frontend\load5.big`
`frontend\load50.big`
`frontend\load51.big`
`frontend\load52.big`
`frontend\load53.big`
`frontend\load54.big`
`frontend\load55.big`
`frontend\load56.big`
`frontend\load57.big`
`frontend\load58.big`
`frontend\load6.big`
`frontend\load7.big`
`frontend\load8.big`
`frontend\load9.big`
`frontend\load99.big`
`frontend\logos.big`
`frontend\minibat.big`
`frontend\minigame.big`
`frontend\minipit.big`
`frontend\misc.big`
`frontend\portrait.big`
`frontend\shared.big`
`frontend\splash.big`
`frontend\stadiums.big`
`frontend\suonly.big`
`frontend\sushared.big`
`frontend\title.big`
`frontend\uniforms.big`
`frontend\movies\cameo14.vp6`
`frontend\movies\cameo15.vp6`
`frontend\movies\cameo18.vp6`
`frontend\movies\cameo19.vp6`
`frontend\movies\cameo20.vp6`
`frontend\movies\cameo21.vp6`
`frontend\movies\cameo28.vp6`
`frontend\movies\cameo31.vp6`
`frontend\movies\cameo32.vp6`
`frontend\movies\cameo33.vp6`
`frontend\movies\cameo35.vp6`
`frontend\movies\cameo37.vp6`
`frontend\movies\cameo40.vp6`
`frontend\movies\creditm.vp6`
`frontend\movies\easports.vp6`
`frontend\movies\mvpintro.vp6`
`igshapes\igcrsr.fsh`
`igshapes\igcrsr.fsh.bak`
`igshapes\igcrsr1.fsh`
`igshapes\igcrsr9.fsh`
`misc\aple.o`
`misc\bern.o`
`misc\bli1.o`
`misc\bli2.o`
`misc\lawn.o`
`misc\miscmod.big`
`misc\moon.o`
`misc\obj1.o`
`misc\obj2.o`
`misc\obj3.o`
`misc\obj4.o`
`misc\pla1.o`
`misc\pla2.o`
`misc\roof.o`
`misc\tran.o`
`misc\textures\aple.fsh`
`misc\textures\batcod1.fsh`
`misc\textures\batcod2.fsh`
`misc\textures\bern.fsh`
`misc\textures\bli1.fsh`
`misc\textures\bli2.fsh`
`misc\textures\grad.fsh`
`misc\textures\lawn.fsh`
`misc\textures\moon.fsh`
`misc\textures\obj1.fsh`
`misc\textures\obj2.fsh`
`misc\textures\obj3.fsh`
`misc\textures\obj4.fsh`
`misc\textures\pcshdw2.fsh`
`misc\textures\pla1.fsh`
`misc\textures\pla2.fsh`
`misc\textures\roof.fsh`
`misc\textures\tran.fsh`
`stadium\a001day.big`
`stadium\a002day.big`
`stadium\a003day.big`
`stadium\aa01nite.big`
`stadium\aa02nite.big`
`stadium\aa03nite.big`
`stadium\aaa1nite.big`
`stadium\aaa2nite.big`
`stadium\aaa3nite.big`
`stadium\anahday.big`
`stadium\anahnite.big`
`stadium\arliday.big`
`stadium\arlinite.big`
`stadium\astrdome.big`
`stadium\bankday.big`
`stadium\banknite.big`
`stadium\bushday.big`
`stadium\bushnite.big`
`stadium\cineday.big`
`stadium\citiday.big`
`stadium\citinite.big`
`stadium\clevday.big`
`stadium\comeday.big`
`stadium\comenite.big`
`stadium\coorday.big`
`stadium\coornite.big`
`stadium\crosday.big`
`stadium\dodgday.big`
`stadium\dodgnite.big`
`stadium\fencday.big`
`stadium\fenwday.big`
`stadium\fenwnite.big`
`stadium\forbday.big`
`stadium\gabaday.big`
`stadium\gabanite.big`
`stadium\grifday.big`
`stadium\hiranite.big`
`stadium\jacoday.big`
`stadium\jaconite.big`
`stadium\kaufday.big`
`stadium\kaufnite.big`
`stadium\lighting.csv`
`stadium\metpnite.big`
`stadium\metrdome.big`
`stadium\millday.big`
`stadium\millnite.big`
`stadium\min1day.big`
`stadium\min2day.big`
`stadium\minuday.big`
`stadium\minunite.big`
`stadium\netwday.big`
`stadium\netwnite.big`
`stadium\olymdome.big`
`stadium\orioday.big`
`stadium\orionite.big`
`stadium\petoday.big`
`stadium\petonite.big`
`stadium\pncpday.big`
`stadium\pncpnite.big`
`stadium\poloday.big`
`stadium\propday.big`
`stadium\propnite.big`
`stadium\qualnite.big`
`stadium\rfksday.big`
`stadium\rfksnite.big`
`stadium\safeday.big`
`stadium\safenite.big`
`stadium\sbcpday.big`
`stadium\sbcpnite.big`
`stadium\sheaday.big`
`stadium\sheanite.big`
`stadium\shibday.big`
`stadium\skydday.big`
`stadium\skydnite.big`
`stadium\spotday.big`
`stadium\tigrnite.big`
`stadium\tropdome.big`
`stadium\turnday.big`
`stadium\turnnite.big`
`stadium\usceday.big`
`stadium\uscenite.big`
`stadium\venuday.big`
`stadium\venunite.big`
`stadium\veteday.big`
`stadium\wrigday.big`
`stadium\wrignite.big`
`stadium\yankday.big`
`stadium\yanknite.big`

`Files that can be installed`
`any files that go inside logos.big`
`any files that go inside uniforms.big`
`any files that go inside fields.big`
`any files that go inside stadiums.big`
`Player portraits inside portrait.big (\d{4}\.fsh)`
`any files that go inside models.big`
`any files that go inside bkgnds.big`
`any files that go inside database.big`
`any files that go inside cd\spch_pa\pnamedat.big`
`any files that go inside spch_pa\pnamehdr.big`
`any files that go inside cd\spch_pbp\pnamedat.big`
`any files that go inside spch_pbp\pnamehdr.big`
`any files that go inside initstaz.big\initstay.big`
`any files that go inside initprgz.big\initpurge.big`

`*any files that go inside spch_pbp\stdnmdhdr.big*`
`*any files that go inside cd\spch_pbp\stdnmddat.big*`
`*any files that go inside spch_pbp\tnamehdr.big*`
`*any files that go inside cd\spch_pbp\tnamedat.big*`
`*any files that go inside spch_pbp\stdnmdhdr.big*`
`*any files that go inside cd\spch_pbp\stdnmddat.big*`


`The files with a * next to them need to be in a certain folder inside the archive files`

`for complete files`
`spch_pbp\pnamehdr.big`
`spch_pbp\tnamehdr.big`
`spch_pbp\pnamedat.big`
`spch_pbp\tnamedat.big`

`spch_pa\pnamehdr.big`
`spch_pa\tnamehdr.big`
`spch_pa\pnamedat.big`
`spch_pa\tnamedat.big`

Installed files

spch_pbp\stdnmhdr.big files needs to be in \stdnmhdr
cd\spch_pbp\stdnmdat.big files needs to be in \stdnmdat

spch_pbp\tnamehdr.big files needs to be in \pbp-tnamehdr
cd\spch_pbp\tnamedat.big files needs to be in \pbp-tnamedat

spch_pa\tnamehdr.big files needs to be in \pa-tnamehdr
cd\spch_pa\tnamedat.big files needs to be in \pa-tnamedat
