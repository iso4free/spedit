//In this unit delared all global constants, variables etc. for Spedit4
unit uglobals;

{$mode objfpc}{$H+}

interface

uses Classes, sysutils, Graphics, IniFiles, fpjson;

const MAX_FRAMES = 5000;

type
  TWorkMode = (wrkProject,wrkSpriteActions,wrkEditor,wrkSourceImage,wrkLibrary,wrkSettings);
  //uses for check which tab now active

  TSrcFrameInfo = record
    fX,fY, fWidth, fHeight : Word;
  end;

  PSrcFrameInfo = ^TSrcFrameInfo;

var

  UserSettingsPath : UTF8String;
  SpriteLibPath    : UTF8String;
  AppSettingsFile  : UTF8String;
  INI              : TIniFile;
  SpriteLibNames   : TStringList;
  CurrentLibName   : UTF8String;//selected library name
  libpath          : UTF8String;//selected library full path

  SrcFramesArray : array [0..MAX_FRAMES] of PSrcFrameInfo;
  //Drawing colors
  spclForeColor : TColor;  //foreground color - left mouse button drawing
  spclBackColor : TColor; //background color - right mouse button drawing
  FrameGridSize : Word;

  function IsDigits(s : String) : Boolean;
  //check string for digits only
  procedure ClearSrcFramesArray;
  //clear used items an free memory for source image frames
  function AddSrcFrame(x,y,w,h : Word) : Integer;
  //add new item to array and return it`s index
  function SaveSrcFramesToFile(aFile : String) : Boolean;
  //save all frames to JSON file

implementation

var
  UsedSrcFrames : Word;

procedure LoadSpriteLibDirs;
var
  sr: TSearchRec;
begin
  If SpriteLibPath[Length(SpriteLibPath)] <> PathDelim then
    SpriteLibPath := SpriteLibPath + PathDelim;
  If FindFirst(SpriteLibPath + '*', faDirectory, sr) = 0 then
    repeat
      If (sr.Name = '') or (sr.Name = '.') or (sr.Name = '..') then
       Continue;
       SpriteLibNames.Add(sr.Name);
    until (FindNext(sr) <> 0);
  FindClose(sr);
end;

function IsDigits(s: String): Boolean;
var
  C: Char;
  B: Boolean;
begin
  for C in S do
  begin
    B := C in ['0'..'9'];
    if not B then Break;
  end;
  result := B;
end;

procedure ClearSrcFramesArray;
var
  i: Integer;
begin
  if UsedSrcFrames<>0 then
  for i:= 0 to UsedSrcFrames -1 do begin
    FreeMemAndNil(SrcFramesArray[i]);
  end;
end;

function AddSrcFrame(x, y, w, h: Word): Integer;
begin
  Result:=-1;
  if UsedSrcFrames<MAX_FRAMES then begin
    Getmem(SrcFramesArray[UsedSrcFrames],SizeOf(TSrcFrameInfo));
    SrcFramesArray[UsedSrcFrames]^.fX:=x;
    SrcFramesArray[UsedSrcFrames]^.fY:=y;
    SrcFramesArray[UsedSrcFrames]^.fWidth:=w;
    SrcFramesArray[UsedSrcFrames]^.fHeight:=h;
    Inc(UsedSrcFrames);
    Result:=UsedSrcFrames;
  end;
end;

function SaveSrcFramesToFile(aFile: String): Boolean;
begin
  result := false;
  if UsedSrcFrames<>0 then begin
  //todo: create JSON file and write array
  end;
end;

initialization

 // get app settings path and file
 UserSettingsPath:=GetAppConfigDir(false);
 AppSettingsFile:=GetAppConfigFile(false);
 SpriteLibPath:=UserSettingsPath+'spritelib';

 INI:= TIniFile.Create(AppSettingsFile,[]);

 //load sprite library names from spedit usersettings path
 //Every library stored in own directory
 SpriteLibNames:=TStringList.Create;
 ForceDirectories(SpriteLibPath);
 LoadSpriteLibDirs;
 //get last spritelib name
 CurrentLibName:=INI.ReadString('INTERFACE','SPRITELIB','default');
 libpath:=SpriteLibPath+DirectorySeparator+CurrentLibName;
 spclBackColor:=clBlack;
 spclForeColor:=clWhite;
 FrameGridSize:=10;
 UsedSrcFrames:=0;


 finalization
  INI.WriteString('INTERFACE','SPRITELIB',CurrentLibName);
  FreeAndNil(SpriteLibNames);
  FreeAndNil(INI);
end.

