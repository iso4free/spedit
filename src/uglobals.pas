//In this unit delared all global constants, variables etc. for Spedit4
unit uglobals;

{$mode objfpc}{$H+}
{$modeswitch advancedrecords}

interface

uses Classes, sysutils, Graphics, IniFiles, fpjson, BGRABitmap, BGRABitmapTypes;

const MAX_FRAMES = 5000;

type
  TWorkMode = (wrkProject,wrkSpriteActions,wrkEditor,wrkSourceImage,wrkLibrary,wrkSettings);
  //uses for check which tab now active

  TSrcFrameInfo = record
    fX,fY, fWidth, fHeight : Word;
  end;

  PSrcFrameInfo = ^TSrcFrameInfo;

  TColors = array[0..255] of TColor;

  { TPalette }

  TPalette = record
    private
     Count : Byte;   //colors in palette
     Colors : TColors; //colors array
     function GetColor(Index : Byte): TColor;
    public
     function isEmpty : Boolean; //check if palette is empty
     procedure Clear;
     property Color[Index : Byte] : TColor read GetColor; //get color by index
     function AddColor(aColor : TColor) : Integer;   //add new color to palette. Return index for new color or if color exists. If palette full returns -1
    private
     function ColorExists(aColor : TColor) : Integer;
  end;

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
  FrameGridSize : Word;   //current grid size
  FrameWidth,
  FrameHeight   : Word;   //frame size in pixels
  FrameZoom     : Integer;//zoom coeff for drawing grid

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

{ TPalette }

function TPalette.GetColor(Index : Byte): TColor;
begin
  if Index>Count then Result:=clNone
   else Result:=Colors[Index];
end;

function TPalette.isEmpty: Boolean;
begin
  Result:=Count=0;
end;


procedure TPalette.Clear;
var
  i: Integer;
begin
  Count :=  0;
  for i :=  0 to 255 do Colors[i]:=clNone;
end;

function TPalette.AddColor(aColor: TColor): Integer;
begin
  if Count=0 then begin
    Colors[count]:=aColor;
    Inc(Count);
    Result:=Count;
    Exit;
  end;
  //todo: check if color exists
  if Count=255 then Result:=-1;
end;

function TPalette.ColorExists(aColor: TColor): Integer;
begin

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
 //frame editor params
 spclBackColor:=INI.ReadInteger('FRAME EDITOR','BACKGROUND COLOR',clNone);
 spclForeColor:=INI.ReadInteger('FRAME EDITOR','FOREGROUND COLOR',clBlack);
 FrameGridSize:=INI.ReadInteger('FRAME EDITOR','GRID SIZE',10);
 FrameWidth := INI.ReadInteger('FRAME EDITOR','FRAME WIDTH',32);
 FrameHeight := INI.ReadInteger('FRAME EDITOR','FRAME HEIGHT',32);
 FrameZoom := 1;
 UsedSrcFrames:=0;




 finalization
  INI.WriteString('INTERFACE','SPRITELIB',CurrentLibName);
  FreeAndNil(SpriteLibNames);
  FreeAndNil(INI);
end.

