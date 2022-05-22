//In this unit delared all global constants, types, variables etc. for Spedit
unit uglobals;

{$mode objfpc}{$H+}
{$modeswitch advancedrecords}

interface

uses Classes, sysutils, StrUtils, Graphics, IniFiles, fpjson, BGRABitmap, BGRABitmapTypes;

const MAX_FRAMES = 5000;
      MAX_PALETTE_COLORS = 255;



type
 // TWorkMode = (wrkProject,wrkSpriteActions,wrkEditor,wrkSourceImage,wrkLibrary,wrkSettings);
  //uses for check which tab now active

  TSrcFrameInfo = record
    fX,fY, fWidth, fHeight : Word;
  end;

  PSrcFrameInfo = ^TSrcFrameInfo;

  TColors = array[0..MAX_PALETTE_COLORS] of TColor;

  { TPalette }

  TPalette = record
    private
     fCount : Byte;   //colors in palette
     fColors : TColors; //colors array
     fSelected : Byte;
     FSelectedColor: TColor;
     function GetColor(Index : Byte): TColor;
    public
     property Count : Byte read fCount;
     property SelectedColor : TColor read FSelectedColor;
     function isEmpty : Boolean; //check if palette is empty
     procedure Clear;
     procedure Reset; //reset palette to default 16 colors
     procedure SelectColor(Index : Byte);
     procedure SaveToFile(aName : TFileName);
     function LoadFromFile(aName : TFileName) : Boolean;
     property Color[Index : Byte] : TColor read GetColor; //get color by index
     function AddColor(aColor : TColor) : Integer;   //add new color to palette. Return index for new color or if color exists. If palette full returns -1
    private
     procedure Sort; //sort colors in palette
     function ColorExists(aColor : TColor) : Integer;
  end;

  { TFrameGrid }

  TFrameGrid = record
   fFrameGridSize : Word;   //current grid size
   fFrameWidth,
   fFrameHeight   : Word;   //frame size in pixels
   fFrameZoom     : Integer;//zoom coeff for drawing grid
   fRect          : TRect;  //grid area on canvas
   fBitmap        : TBGRABitmap; //where grid will be draw
   constructor Init(aW,aH,aSize : Word);

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
  //Work palette
  Palette       : TPalette;

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

{ TFrameGrid }

constructor TFrameGrid.Init(aW, aH, aSize: Word);
begin
  fFrameGridSize:=aSize;
  fFrameHeight:=aH;
  fFrameWidth:=aW;
  fFrameZoom:=0;
  fBitmap:=TBGRABitmap.Create(fFrameWidth*(aSize+fFrameZoom),fFrameHeight*(aSize+fFrameZoom));


end;

{ TPalette }

function TPalette.GetColor(Index : Byte): TColor;
begin
  if Index>fCount then Result:=clNone
   else Result:=fColors[Index];
end;

function TPalette.isEmpty: Boolean;
begin
  Result:=fCount=0;
end;


procedure TPalette.Clear;
var
  i: Integer;
begin
  fCount :=  0;
  fSelected:=0;
  for i :=  0 to MAX_PALETTE_COLORS do fColors[i]:=clNone;
end;

procedure TPalette.Reset;
begin
  Clear;
  AddColor(clBlack);
  AddColor(clMaroon);
  AddColor(clGreen);
  AddColor(clOlive);
  AddColor(clNavy);
  AddColor(clPurple);
  AddColor(clTeal);
  AddColor(clGray);
  AddColor(clSilver);
  AddColor(clRed);
  AddColor(clLime);
  AddColor(clYellow);
  AddColor(clBlue);
  AddColor(clFuchsia);
  AddColor(clAqua);
  AddColor(clWhite);
  AddColor(clCream);
  AddColor(clMedGray);
  AddColor(clMoneyGreen);
  AddColor(clSkyBlue);
end;

procedure TPalette.SelectColor(Index: Byte);
begin
  FSelectedColor:=Color[Index];
end;

procedure TPalette.SaveToFile(aName: TFileName);
var l : TStringList;
  i: Integer;
begin
  l:=TStringList.Create;
  for i := 1 to fCount-1 do l.Add(IntToHex(fColors[i]));
  l.SaveToFile(aName);
  FreeAndNil(l);
end;

function TPalette.LoadFromFile(aName: TFileName): Boolean;
var l : TStringList;
  i: Integer;
begin
  result := False;
  Clear;
  l:=TStringList.Create;
  l.LoadFromFile(aName);
  AddColor(clNone);
  for i:=0 to l.Count-1 do begin
    if l.Strings[i]<>'' then begin
      AddColor(Hex2Dec(l.Strings[i]));
    end;
  end;
  FreeAndNil(l);
end;

function TPalette.AddColor(aColor: TColor): Integer;
begin
  if fCount=0 then begin
    fColors[fCount]:=aColor;
    Inc(fCount);
    Result:=fCount;
    Exit;
  end;
  //todo: check if color exists
  Result:= ColorExists(aColor);
  if (Result=-1) and (fCount<MAX_PALETTE_COLORS) then begin
    fColors[fCount]:=aColor;
    Inc(fCount);
    Result:=fCount;
  end;
end;

procedure TPalette.Sort;
begin
  //todo: sort array
end;

function TPalette.ColorExists(aColor: TColor): Integer;
var
  i: Integer;
begin
  result := -1; //color NOT exists in palette
  if fCount=0 then Exit;
  for i:=0 to fCount-1 do begin
    if fColors[i]=aColor then begin
      Result:=i;
      Break;
    end;
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
 //frame editor params
 spclBackColor:=INI.ReadInteger('FRAME EDITOR','BACKGROUND COLOR',clNone);
 spclForeColor:=INI.ReadInteger('FRAME EDITOR','FOREGROUND COLOR',clBlack);
 Palette.Reset;

 UsedSrcFrames:=0;




 finalization
  INI.WriteString('INTERFACE','SPRITELIB',CurrentLibName);
  FreeAndNil(SpriteLibNames);
  FreeAndNil(INI);
end.

