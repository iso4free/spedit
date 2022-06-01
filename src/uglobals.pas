//In this unit delared all global constants, types, variables etc. for Spedit
unit uglobals;

{$mode objfpc}{$H+}
{$modeswitch advancedrecords}
 {$DEFINE DEBUG}

interface

uses Classes, sysutils, StrUtils, Graphics, IniFiles, fpjson, BGRABitmap, BGRABitmapTypes;

const MAX_FRAMES = 50;          //it will be enought for one animation?
      MAX_PALETTE_COLORS = 255;  //max colors count in palette
      MAX_PIXELS = 512*512;      //max pixels array (sprite size 512x512 pixels)
      MAX_LAYERS = 10;           //max layers count in one frame



type
 // TWorkMode = (wrkProject,wrkSpriteActions,wrkEditor,wrkSourceImage,wrkLibrary,wrkSettings);
  //uses for check which tab now active

  TDrawGridMode = (dgmNone,dgmMove);

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

  PLayer = ^TLayer;
  TLayer = record       //layer record
    Count : Word;       //pixels count
    Pixels : TPixels;   //array of pixels
    Visible : Boolean;  //if false not draw on screen
    procedure Clear;
  end;

  TLayers = array[0..MAX_LAYERS] of PLayer;

  { TFrame }

  PFrame = ^TFrame;
  TFrame = record
    Count : Byte;
    fLayers : TLayers;
    procedure Clear;
    function AddLayer: Integer; //add new layer and return it`s index or -1 if error
  end;

  TCamera = record           //camera view on canvas
    posX, posY : Integer;
    camWidth, camHeight : Word;
  end;

  { TFrameGrid }

  TFrameGrid = class
   private
    fBuffer        : TBgraBitmap; //for in-memory drawig before show on screen
    FCheckersSize: Byte;
    fPreview       : TBGRABitmap; //for draw image preview
    fFrameGridSize : Word;   //current grid size
    fFrameWidth,
    fFrameHeight   : Integer;   //frame size in pixels
    fFrameZoom     : Integer;//zoom coeff for drawing grid (0 for normal size)
    fRect          : TRect;  //grid area on canvas
    fFrame         : PFrame; //pointer to frame record with all layers
    fShowGrid      : Boolean;//if true grid will be draw
    fOffset        : TPoint; //offset to draw frame on canvas
    procedure CalcGridRect;
    procedure SetCheckersSize(AValue: Byte);
    procedure SetFrameZoom(AValue: Integer);
    procedure SetOffset(AValue: TPoint);
   public
    function Coords(x,y : Integer): TPoint; //return pixel coordinates in grid cell
    function PixelPos(x,y : Integer) : Integer; //return pixel index in array
    constructor Create(aW: Integer = 32; aH : Integer = 32; aSize : Word = 10);
    destructor Destroy; override;
    procedure RenderAndDraw(Canvas : TCanvas; Offset : TPoint);
    procedure RenderPicture(Canvas : TCanvas);
    property ShowGrid : Boolean read fShowGrid write fShowGrid;
    property FrameZoom : Integer read fFrameZoom write SetFrameZoom;
    property Offset : TPoint read FOffset write SetOffset;
    property CheckersSize : Byte read FCheckersSize write SetCheckersSize default 16;
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
  for i:=0 to MAX_LAYERS do fLayers[i]^.Clear;
  Count:=0;
end;

function TFrame.AddLayer: Integer;
begin
  Result:=-1;
  if Count<MAX_LAYERS then begin
   Getmem(fLayers[Count],SizeOf(TLayer));
   Inc(Count);
   Result:=Count;
  end;
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

procedure TFrameGrid.SetOffset(AValue: TPoint);
begin
  FOffset.Offset(AValue);
  {$IFDEF DEBUG}
   WriteLN('Offset: x=',fOffset.X,', y=',fOffset.Y);
  {$ENDIF}
  CalcGridRect;
end;

function TFrameGrid.Coords(x, y: Integer): TPoint;
var posx,posy : Integer; //relative grid coordinates
begin
  Result := Point(-1,-1);
  if fRect.Contains(Point(x,y)) then begin
     posx:=x-fOffset.X;
     posy:=y-fOffset.Y;
     Result.X:= posx div (fFrameGridSize+fFrameZoom);
     Result.Y:= posy div (fFrameGridSize+fFrameZoom);
  end;
end;

function TFrameGrid.PixelPos(x, y: Integer): Integer;
begin
    if ((x<0) or (y<0)) then Result:=-1 else
    Result := y*fFrameWidth+x;
end;

procedure TFrameGrid.SetFrameZoom(AValue: Integer);
begin
  if fFrameZoom=AValue then Exit;
  fFrameZoom:=AValue;
  CalcGridRect;
end;

procedure TFrameGrid.SetCheckersSize(AValue: Byte);
begin
  if FCheckersSize=AValue then Exit;
  if (AValue>0) and (AValue<255) then FCheckersSize:=AValue;
end;

procedure TFrameGrid.CalcGridRect;
begin
  fRect.Create(fOffset, fFrameWidth*(fFrameGridSize+fFrameZoom), fFrameHeight*(
    fFrameGridSize+fFrameZoom));
  {$IFDEF DEBUG}
    WriteLN('Grid pos: x=',fRect.Left,', y=',fRect.Top);
  {$ENDIF}
end;

constructor TFrameGrid.Create(aW: Integer; aH: Integer; aSize: Word);
begin
  fFrameGridSize:=aSize;
  fFrameHeight:=aH;
  fFrameWidth:=aW;
  FCheckersSize:=INI.ReadInteger('INTERFACE','CHECKERS SIZE',32);
  fFrameZoom:=0;
  CalcGridRect;
  fPreview:=TBGRABitmap.Create(aW,aH,ColorToBGRA(clWhite));
  Getmem(fFrame,SizeOf(PFrame));
end;

destructor TFrameGrid.Destroy;
begin
  INI.WriteInteger('INTERFACE','CHECKERS SIZE',FCheckersSize);
  FreeMemAndNil(fFrame);
  FreeAndNil(fBuffer);
  FreeAndNil(fPreview);
  inherited Destroy;
end;

procedure TFrameGrid.RenderAndDraw(Canvas: TCanvas; Offset: TPoint);

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
  fBuffer:=TBGRABitmap.Create(fFrameWidth*(fFrameGridSize+fFrameZoom),fFrameHeight*(fFrameGridSize+fFrameZoom));
  ShowGrid:=(fFrameGridSize+fFrameZoom)>3;
  fBuffer.DrawCheckers(Rect(0,0,fBuffer.Width,fBuffer.Height),ColorToBGRA($BFBFBF),ColorToBGRA($FFFFFF),FCheckersSize,FCheckersSize);
  if ShowGrid then DrawGrid(0,0,fBuffer.Width,fBuffer.Height,fFrameGridSize+fFrameZoom);
  //todo : draw all layers per pixels

  fBuffer.Draw(Canvas,fOffset.X,fOffset.Y);
end;

procedure TFrameGrid.RenderPicture(Canvas: TCanvas);
begin
  //todo: draw pixels from all layers to canvas
  fPreview.Draw(Canvas,0,0);
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

