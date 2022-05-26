//In this unit delared all global constants, types, variables etc. for Spedit
unit uglobals;

{$mode objfpc}{$H+}
{$modeswitch advancedrecords}

interface

uses Classes, sysutils, StrUtils, Graphics, IniFiles, fpjson, BGRABitmap, BGRABitmapTypes;

const MAX_FRAMES = 50;          //it will be enought for one animation?
      MAX_PALETTE_COLORS = 255;  //max colors count in palette
      MAX_PIXELS = 512*512;      //max pixels array (sprite size 512x512 pixels)
      MAX_LAYERS = 10;           //max layers count in one frame



type
 // TWorkMode = (wrkProject,wrkSpriteActions,wrkEditor,wrkSourceImage,wrkLibrary,wrkSettings);
  //uses for check which tab now active

  TColors = array[0..MAX_PALETTE_COLORS] of TColor;  //palette - array of colors
  TPixels = array[0..MAX_PIXELS] of Byte;            //array of indexes to palette

  { TPalette }

  PPalette = ^TPalette;

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
     procedure SelectColor(Index : Byte);//Select active color
     procedure SaveToFile(aName : TFileName);//save palette to HEX file (with colors hex codes)
     function LoadFromFile(aName : TFileName) : Boolean;//load from HEX file
     property Color[Index : Byte] : TColor read GetColor; //get color by index
     function AddColor(aColor : TColor) : Integer;   //add new color to palette. Return index for new color or if color exists. If palette full returns -1
    private
     procedure Sort; //sort colors in palette
     function ColorExists(aColor : TColor) : Integer; //check if color in palette before adding
  end;

  { TLayer }

  TLayer = record       //layer record
    Count : Word;       //pixels count
    Pixels : TPixels;   //array of pixels
    Visible : Boolean;  //if false not draw on screen
    procedure Clear;
  end;

  TLayers = array[0..MAX_LAYERS] of TLayer;

  { TFrame }

  PFrame = ^TFrame;
  TFrame = record
    Count : Byte;
    fLayers : TLayers;
    procedure Clear;
  end;

  TCamera = record           //camera view on canvas
    posX, posY : Integer;
    camWidth, camHeight : Word;
  end;

  { TFrameGrid }

  TFrameGrid = class
   private
    fBuffer        : TBgraBitmap; //for in-memory drawig before show on screen
    fFrameGridSize : Word;   //current grid size
    fFrameWidth,
    fFrameHeight   : Word;   //frame size in pixels
    fFrameZoom     : Integer;//zoom coeff for drawing grid (0 for normal size)
    fRect          : TRect;  //grid area on canvas
    fFrame         : PFrame; //pointer to frame record with all layers
    fCamera        : TCamera;//visible on screen part of frame
    fShowGrid      : Boolean;
   public
    constructor Create(aBmp : TBGRABitmap; aW: Integer = 32; aH : Integer = 32; aSize : Word = 10);
     //aBmp here is for drawing
    destructor Destroy; override;
    procedure RenderAndDraw(Canvas : TCanvas);
    property ShowGrid : Boolean read fShowGrid write fShowGrid;
  end;

var

  UserSettingsPath : UTF8String;
  SpriteLibPath    : UTF8String;
  AppSettingsFile  : UTF8String;
  INI              : TIniFile;
  SpriteLibNames   : TStringList;
  CurrentLibName   : UTF8String;//selected library name
  libpath          : UTF8String;//selected library full path


  //Drawing colors
  spclForeColor : TColor;  //foreground color - left mouse button drawing
  spclBackColor : TColor; //background color - right mouse button drawing
  //Work palette
  Palette       : TPalette;

  FrameGrid     : TFrameGrid;

  //**********************************************************************
  function IsDigits(s : String) : Boolean;
  //check string for digits only


implementation

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

{ TFrame }

procedure TFrame.Clear;
var
  i: Integer;
begin
  for i:=0 to MAX_LAYERS do fLayers[i].Clear;
  Count:=0;
end;

{ TLayer }

procedure TLayer.Clear;
var
  i: Integer;
begin
  for i:=0 to MAX_PIXELS do Pixels[i]:=0; //in palette first color always means transparent - clNone
  Count:=0;
end;

{ TFrameGrid }

constructor TFrameGrid.Create(aBmp: TBGRABitmap; aW: Integer; aH: Integer;
  aSize: Word);
begin
  fFrameGridSize:=aSize;
  fFrameHeight:=aH;
  fFrameWidth:=aW;
  fFrameZoom:=0;
  fCamera.posX:=0;
  fCamera.posY:=0;
  fCamera.camWidth:=aBmp.Width;
  fCamera.camHeight:=aBmp.Height;
 // Getmem(fFrame);
end;

destructor TFrameGrid.Destroy;
begin
  FreeMemAndNil(fFrame);
  FreeAndNil(fBuffer);
  inherited Destroy;
end;

procedure TFrameGrid.RenderAndDraw(Canvas: TCanvas);

  procedure DrawGrid(x1,y1,x2,y2 : Integer; size : Integer);
   var i, xsize, ysize : Integer;
  begin
    xsize := (x2-x1) div size;
    ysize := (y2-y1) div size;
    For i := 1 to xsize do fBuffer.DrawLine(x1,y1+i*size,x2,y1+i*size,ColorToBGRA(clNavy),False);
    For i := 1 to ysize do fBuffer.DrawLine(x1+i*size,y1,x1+i*size,y2,ColorToBGRA(clNavy),False);
    fBuffer.Rectangle(x1,y1,x2,y2,ColorToBGRA(clNavy));
  end;


begin
  FreeAndNil(fBuffer);
  fBuffer:=TBGRABitmap.Create(fFrameWidth*(fFrameGridSize*fFrameZoom+1),fFrameHeight*(fFrameGridSize*fFrameZoom+1));
  ShowGrid:=not (fFrameZoom<3);
  fBuffer.DrawCheckers(Rect(0,0,fBuffer.Width,fBuffer.Height),ColorToBGRA($BFBFBF),ColorToBGRA($FFFFFF));
  if ShowGrid then DrawGrid(0,0,fBuffer.Width-1,fBuffer.Height-1,fFrameGridSize*fFrameZoom+1);
  //todo : draw all layers per pixels
  fBuffer.Draw(Canvas,0,0);
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
  //check if color exists
  Result:= ColorExists(aColor);
  if (Result=-1) and (fCount<MAX_PALETTE_COLORS) then begin
    fColors[fCount]:=aColor;
    Inc(fCount);
    Result:=fCount;
  end;
  Sort;
end;

procedure TPalette.Sort;
var  Temp: Integer;
  i: Integer;
  Changed: Boolean;
begin
  repeat
    Changed:= False;
    for i:= 1 to fCount - 1 do
      if fColors[i] > fColors[i + 1] then
      begin
        Temp:= fColors[i];
        fColors[i]:= fColors[i + 1];
        fColors[i + 1]:= Temp;
        Changed:= True;
      end;
  until not Changed;
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
 //palette with default colors
 Palette.Reset;

 finalization
  INI.WriteString('INTERFACE','SPRITELIB',CurrentLibName);
  FreeAndNil(SpriteLibNames);
  FreeAndNil(INI);
end.

