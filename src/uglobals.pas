//**********************************************************************
//*    Sprite Editor 4.0                                               *
//*    Copyright (c) 2000-2019 by ViruZ                                *
//*                                                                    *
//*    See the file COPYING.FPC, included in this distribution,        *
//*    for details about the copyright.                                *
//*                                                                    *
//*    This program is distributed in the hope that it will be useful, *
//*    but WITHOUT ANY WARRANTY; without even the implied warranty of  *
//*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.            *
//*                                                                    *
//**********************************************************************
//In this unit delared all global constants, variables etc. for Spedit4
unit uglobals;

{$mode objfpc}{$H+}

interface

uses Classes, sysutils, Graphics, IniFiles, BGRABitmap, BGRABitmapTypes;

var

  UserSettingsPath : UTF8String;
  SpriteLibPath    : UTF8String;
  AppSettingsFile  : UTF8String;
  INI              : TIniFile;
  SpriteLibNames   : TStringList;
  CurrentLibName   : UTF8String;
  LibraryChanged   : Boolean;

  //Drawing colors
  spclForeColor : TColor;  //foreground color - left mouse button drawing
  spclBackColor : TColor; //background color - right mouse button drawing

implementation

procedure LoadSpriteLibDirs;
//try recursive check nested directories
begin
  //todo: fix get dir list!!! works wrong!
end;

initialization

 // get app settings path and file
 UserSettingsPath:=GetAppConfigDir(false);
 AppSettingsFile:=GetAppConfigFile(false);
 SpriteLibPath:=UserSettingsPath+DirectorySeparator+'spritelib';

 INI:= TIniFile.Create(AppSettingsFile,[]);

 //load sprite library names from spedit usersettings path
 //Every library stored in own directory
 SpriteLibNames:=TStringList.Create;
 ForceDirectories(SpriteLibPath);
 LoadSpriteLibDirs;
 //get last spritelib name
 CurrentLibName:=INI.ReadString('INTERFACE','SPRITELIB','');
 LibraryChanged:=False;
 spclBackColor:=clBlack;
 spclForeColor:=clWhite;



 finalization
  INI.WriteString('INTERFACE','SPRITELIB',CurrentLibName);
  FreeAndNil(SpriteLibNames);
  FreeAndNil(INI);
end.

