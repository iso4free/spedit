{***************************************************************************}
{*     This file is a part of                                              *}
{*                                                                         *}
{* @@@@@@  @@@@@@@  @@@@@@@@ @@@@@@@  @@@ @@@@@@@   @@@  @@@         @@@   *}
{*@@@@@@@  @@@@@@@@ @@@@@@@@ @@@@@@@@ @@@ @@@@@@@   @@@  @@@        @@@@   *}
{*!@@      @@!  @@@ @@!      @@!  @@@ @@!   @@!     @@!  @@@       @@!@!   *}
{*!@!      !@!  @!@ !@!      !@!  @!@ !@!   !@!     !@!  @!@      !@!!@!   *}
{*!!@@!!   @!@@!@!  @!!!:!   @!@  !@! !!@   @!!     @!@  !@!     @!! @!!   *}
{* !!@!!!  !!@!!!   !!!!!:   !@!  !!! !!!   !!!     !@!  !!!    !!!  !@!   *}
{*     !:! !!:      !!:      !!:  !!! !!:   !!:     :!:  !!:    :!!:!:!!:  *}
{*    !:!  :!:      :!:      :!:  !:! :!:   :!:      ::!!:! :!: !:::!!:::  *}
{*:::: ::   ::       :: ::::  :::: ::  ::    ::       ::::  :::      :::   *}
{*:: : :    :       : :: ::  :: :  :  :      :         :    :::      :::   *}
{*                                                                         *}
{***************************************************************************}
{*    Sprite Editor 4.0                                                    *}
{*    Copyright (c) 2000-2022 by Vadim Vitomsky                            *}
{*                                                                         *}
{*    See the file LICENSE, included in this distribution, for details.    *}
{*                                                                         *}
{*    This program is distributed in the hope that it will be useful,      *}
{*    but WITHOUT ANY WARRANTY; without even the implied warranty of       *}
{*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                 *}
{***************************************************************************}
unit uglobals;

{$mode objfpc}{$H+}
{$modeswitch advancedrecords}


interface

uses
  {$IFDEF DEBUG}LazLoggerBase,{$ENDIF} LCLTranslator,
  Classes, sysutils, StrUtils, Graphics, IniFiles, fpjson,
  BGRABitmap, BGRABitmapTypes, fgl, base64, Dialogs;

resourcestring
  rsColors = 'Colors: ';
  rsFG = 'FG: ';
  rsBG = ' / BG: ';
  rsWarning = 'Warning!';
  rsPaletteWillB = 'Palette will be resetted to default colors! Are You shure?';
  rsImageHasTooM = 'Image has too many colors!';
  rsPleaseInputN = 'Please input new library name';
  rsHasNonIntege = ' has non-integer value!';
  rsLayerName = 'Layer name';
  rsInputNewLaye = 'Input new layer name:';
  rsYouMustOverr = 'You must override MouseUp() method! Class name: ';
  rsYouMustOverr2 = 'You must override MouseMove() method! Class name: ';
  rsCopyOf = 'Copy of ';
  rsActiveTool = 'Active tool: ';
  rsThisToolWill = 'This tool will be realised soon, sorry';
  rsFilledRectan = 'Filled rectangle';
  rsRectangle = 'Rectangle';
  rsPipette = 'Pipette';
  rsEraser = 'Eraser';
  rsLine = 'Line';
  rsPen = 'Pen';
  rsGenericTool = 'Generic tool';
  rsCircle = 'Circle';
  rsThisLayerCan = 'This layer can''t be renamed!';
  rsThisLayerCan2 = 'This layer can''t be deleted!';
  rsLayerSIsLock = 'Layer %s is locked for changes!!';
  rsSorry = 'Sorry, will be implemented soon!';
  rsFloodFill = 'Flood fill';


const
      //MAX_FRAMES = 50;           //it will be enought for one animation?
      MAX_PALETTE_COLORS = 255;  //max colors count in palette
      MAX_PIXELS = 512*512;      //max pixels array (sprite size 512x512 pixels)
      //MAX_LAYERS = 10;           //max layers count in one frame

      cINTERNALLAYERANDFRAME = 'spedit v.4'; //default frame name and background layer name
      //background layer needed for merged image from all layers
      csDRAWLAYER = 'Draw layer';  //layer name for drawing buffer


type
 // TWorkMode = (wrkProject,wrkSpriteActions,wrkEditor,wrkSourceImage,wrkLibrary,wrkSettings);
  //uses for check which tab now active

  TDrawGridMode = (dgmNone,dgmMove,dgmDraw);

  TColors = array[0..MAX_PALETTE_COLORS] of TBGRAPixel;  //palette - array of colors
  TPixels = array[0..MAX_PIXELS] of TBGRAPixel;      //array of pixels
  TColorsArray = array of TColor;

  { TPalette }

  //PPalette = ^TPalette;

  TPalette = record
    private
     fCount : Byte;   //colors in palette
     fColors : TPixels; //colors array
     fSelected : Byte;
     FSelectedColor: TBGRAPixel;
     function GetColor(Index : Byte): TBGRAPixel;
    public
     property Count : Byte read fCount;
     property SelectedColor : TBGRAPixel read FSelectedColor;
     function isEmpty : Boolean; //check if palette is empty
     procedure Clear;
     procedure CopyFrom(src : TPalette); //copy palette from another palette
     procedure Reset; //reset palette to default 16 colors
     procedure SelectColor(Index : Byte);//Select active color
     procedure SaveToFile(aName : TFileName);//save palette to HEX file (with colors hex codes)
     function LoadFromFile(aName : TFileName) : Boolean;//load from HEX file
     function LoadFromImage(aName : TFilename) : Boolean; //load from image file
     property Color[Index : Byte] : TBGRAPixel read GetColor; //get color by index
     function ArrayOfColors() : TColorsArray; //return current palette as array of colors
     function AddColor(aColor : TBGRAPixel) : Integer;   //add new color to palette. Return index for new color or if color exists. If palette full returns -1
    private
     procedure Sort; //sort colors in palette
     function ColorExists(aColor : TBGRAPixel) : Integer; //check if color in palette before adding
  end;

  //palette presets - create palette from PNG file
  //and create preview for show colors in any control

  { TPalettePreset }

  TPalettePreset = class
   private
    fPaletteName : String; //palette file name (PNG file only)
    fPalette     : TPalette;
    fBmp         : TBGRABitmap;
   public
    constructor Create(aFilename: TFilename);
    {In Constructor open PNG file and create palette from it}
    destructor Destroy; override;

    property Palette : TPalette read fPalette;
    property PaletteName : String read fPaletteName;
    property PaletteView : TBGRABitmap read fBmp;
  end;

  //presets list
  TPresetsList = specialize TFPGMapObject<String,TPalettePreset>;

  {class for undo/redo posibilities}

  PSPUndoRec = ^TSPUndoRec;

  { TSPUndoRec }

  TSPUndoRec = class
    fLayerName : String;
    fLayerData : String;   //BASE64 encoded image
    fLayerFrames : String; //frames list contained layer
    procedure Assign(aSrc : TSPUndoRec);
  end;

   TUndoRedoList = specialize TFPGObjectList<TSPUndoRec>;
  { TUndoRedoManager }

  TUndoRedoManager = class
   private
     fUndoList : TUndoRedoList;
     fRedoList : TUndoRedoList;
     function InternalCanUndo: boolean; inline;
     function InternalCanRedo : Boolean; inline;
     function InternalGetStatesCount : Integer; inline;
     procedure InternalRestoreData(aData : PSPUndoRec);
     {$IFDEF DEBUG}
     procedure DumpDataToLog(aData : PSPUndoRec);
     {$ENDIF}
     procedure InternalClearStack(aStack : TUndoRedoList);
   public
    constructor Create;
    destructor Destroy;override;
    procedure SaveState;
    procedure Undo;
    procedure Redo;

    property CanUndo : boolean read InternalCanUndo;
    property CanRedo : Boolean read InternalCanRedo;
    property SavedStatesCount : Integer read InternalGetStatesCount;
  end;


  { TSPLayer }
  {Uses for layers in every frame.}


  TSPLayer = class
   private
    FHeight: Integer;
    FLocked: Boolean;
    fName: String;
    fTemporary: Boolean;
    fVisible : Boolean;
    fLayerImg : TBGRABitmap; //layer image
    FWidth: Integer;
    FFrames : TStringList;
   public
    property LayerName : String read fName write fName; //text to layers list identify
    property Visible : Boolean read fVisible write fVisible default True; //is drawable
    property Locked : Boolean read FLocked write FLocked default False; //can be changed
    property Temporary : Boolean read fTemporary write fTemporary default False; //temporary created - not visible in layers form
    property Height : Integer read FHeight;
    property Width : Integer read FWidth;
    property Drawable : TBGRABitmap read fLayerImg write fLayerImg;  //BGRABitmap for drawing
    //property FramesList : TStringList read FFrames; //frame names list containing current layer
    procedure Resize(newWidth, NewHeight: Integer; Stretched: Boolean=False); //resize layer
    procedure AddToFrame(FrameName : String); //add layer to frame
    function DeleteFromFrame(aFrameName : String) : Boolean; //remove frame name from internal list of frames where layer belongs
    procedure RestoreFromString(aBASE64 : String); //restore layer data from BASE64 encoded string
    procedure ClearDrawable; //clear BGRABitmap for new drawing
    function ToBASE64String : String; //encode layer image to BASE64

    constructor Create(aName : String; aWidth : Integer = 32; aHeight : Integer = 32);
    constructor Create(aName, aData : String); //create layer image from BASE64 encoded string
    destructor Destroy; override;

    procedure Clear;
  end;


  { TSPFrame }

  TSPFrame = class
   private
    FCount : Byte;
    fFrameName: String;
    FHeight: Integer;
    FIndex: Integer;
    fLayers : TStringList;
    FWidth: Integer;
    procedure SetIndex(AValue: Integer);
   public
    constructor Create(aName : String; w : Integer = 32; h : integer = 32);
    destructor Destroy; override;

    procedure Resize(w,h : Integer; Stretched : Boolean = false); //resize all layers belongs to frame
    property FrameName : String read fFrameName;//unique frame name for correct managing in mapped list
    property LayersList : TStringList read fLayers;  //layers mapped list
    property Index : Integer read FIndex write SetIndex;
    property Width : Integer read FWidth;
    property Height : Integer read FHeight;
    function AddLayer(LayerName : String): Boolean; //add new layer and return it`s index or -1 if error
    function DeleteLayer(aLayerName : String): Boolean;      //remove layer from frame
  end;

  { TCellCursor - for drawing red rectangle followed by mouse cursor or moved by arrow keys}

  TCellCursor = class
   private
     FCells: Byte;
     FPrevX: Integer;
     FPrevY: Integer;
     FX: Integer;
     FY: Integer;
     function GetPrevCoords: TPoint;
     procedure SetCells(AValue: Byte);
     procedure SetCoords(AValue: TPoint);
     function GetCoords : TPoint;
   public
    property X : Integer read FX write FX default 0;
    property Y : Integer read FY write FY default 0;
    property Coords : TPoint read GetCoords write SetCoords; //cell coords
    property PrevCoords : TPoint read GetPrevCoords; //prevoius coords for correct moving
    property PrevX : Integer read FPrevX default 0;
    property PrevY : Integer read FPrevY default 0;
    property CursorSize : Byte read FCells write SetCells default 1; //cursor size in cells i.e. 2x2, 4x4 etc.
  end;

  { TFrameGrid }

  TFrameGrid = class
   private
    fActiveFrame: String;
    FActiveLayer: String;
    FCellCursor: TCellCursor;
    FBackground: Boolean;
    FCheckersSize  : Byte;
    fPreview       : TBGRABitmap; //for draw image preview
    fBuffer        : TBGRABitmap; //for zoomed draw
    fFrameGridSize : Word;   //current grid size
    fFrameWidth,
    fFrameHeight   : Integer;   //frame size in pixels
    fFrameZoom     : Integer;//zoom coeff for drawing grid (0 for normal size)
    fRect          : TRect;  //grid area on canvas
    fShowGrid      : Boolean;//if true grid will be draw
    fOffset        : TPoint; //offset to draw frame on canvas
    fBounds        : TRect; //actual canvas size for zoomed draw with offset
    procedure CalcGridRect;
    procedure SetCheckersSize(AValue: Byte);
    procedure SetFrameZoom(AValue: Integer);
    procedure SetOffset(AValue: TPoint);
    procedure GetBounds;
   public
    function Coords(x,y : Integer): TPoint; //return pixel coordinates in grid cell
    function PixelPos(x,y : Integer) : Integer; //return pixel index in array

    constructor Create(aW: Integer = 32; aH : Integer = 32; aSize : Word = 4);
    constructor Create(aImg : TFileName; aSize : Word = 4); //create frame from image file
    procedure Resize(newWidth, newHeight : Integer; Stretched : Boolean = false);//resize all layers in current frame

    destructor Destroy; override;

    function HasCoords(aPoint : TPoint) : Boolean; //check if frame has point
    procedure RenderAndDraw(Canvas : TCanvas);  //draw background and all layers data to canvas
    procedure RenderPicture(Canvas : TCanvas);
    procedure ExpotPng(aFilename : TFileName);  //export frame to file
    property ShowGrid : Boolean read fShowGrid write fShowGrid;      //draw grid
    property FrameZoom : Integer read fFrameZoom write SetFrameZoom; //scale index
    property Offset : TPoint read FOffset write SetOffset;
    property CheckersSize : Byte read FCheckersSize write SetCheckersSize default 16;
    property FrameWidth : Integer read fFrameWidth;
    property FrameHeight : Integer read fFrameHeight;
    property ActiveFrame : String read fActiveFrame write fActiveFrame; //work frame name to access through mapped list
    property ActiveLayer : String read FActiveLayer write FActiveLayer; //current layer to draw
    property CellCursor : TCellCursor read FCellCursor; //just red frame to show where draw in grid
    property Bounds : TRect read fBounds; //actual canvas size for drawing
    property GridSize : Word read fFrameGridSize; //current grid size - read only
  end;


  TLayers = specialize TFPGMapObject<String,TSPLayer>;  //mapped layers list
  TFrames = specialize TFPGMapObject<String,TSPFrame>;  //mapped frames list

var

  UserSettingsPath : UTF8String;
  SpriteLibPath    : UTF8String;
  AppSettingsFile  : UTF8String;
  INI              : TIniFile;
  SpriteLibNames   : TStringList;
  CurrentLibName   : UTF8String;//selected library name
  libpath          : UTF8String;//selected library full path
  BufferLayer      : TSPLayer;    //for temporary drawing

  //Drawing colors
  spclForeColor : TBGRAPixel;  //foreground color - left mouse button drawing
  spclBackColor : TBGRAPixel; //background color - right mouse button drawing
  //Work palette
  Palette       : TPalette;
  Presets       : TPresetsList; //palettes presets list

  FrameGrid     : TFrameGrid;
  Layers        : TLayers;
  Frames        : TFrames;
  UndoRedoManager : TUndoRedoManager;

  //**********************************************************************
  function IsDigits(s : String) : Boolean;
  //check string for digits only

  function ConvertHtmlHexToTColor(HexColor: String):TColor;
  function CheckHexForHash(col: string):string;
  function ConvertTColorToHTML(aColor: TColor) : String;
  function CalcColorDist(const Color1, Color2: TBGRAPixel): Integer;
  function FindClosestColor(const aColor: TBGRAPixel; const aPalette : TPalette): TBGRAPixel;
  function ClipByte(const Value: Integer): Byte;
  procedure FloydSteinbergDithering(const aImage: TBGRABitmap; const Palette: TPalette; const Power: Byte);
  procedure DitherImage(aImg : TBGRABitmap; aPalette : TPalette; aPower : Byte);
  function CheckLayerName(aName : String) : String; //check layer name if exists return aName+'1' on aName if not
  function DetectPOLanguage(pofile : TFileName) : String;  //return language code for localization
  function LayerExists(aKey : String) : Boolean; inline; //check if layer key exists
  procedure ClearBitmap(const aBmp : TBGRABitmap);//replase all pixels to BGRAPixelTransparent
  procedure ResizeLayers(aW,aH : Integer; Stretched : Boolean = false); //resize al layers when change frame size
  function StreamToBase64(const AStream: TMemoryStream; out Base64: String): Boolean;
  function Base64ToStream(const ABase64: String; var AStream: TMemoryStream): Boolean;
  procedure ReloadPresets(aDirectory: String);  //loads palette presets from selected dir


implementation

//for image encode/decode BASE64
function Base64ToStream(const ABase64: String; var AStream: TMemoryStream): Boolean;
var
  Str: TStringStream;
begin
  Result := False;
  if Length(Trim(ABase64)) = 0 then
    Exit;
  try
    Str := TStringStream.Create(DecodeStringBase64(ABase64));
    try
      AStream.CopyFrom(Str, Str.Size);
      AStream.Position := 0;
    finally
      Str.Free;
    end;
    Result := True;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;


function StreamToBase64(const AStream: TMemoryStream; out Base64: String): Boolean;
var
  Str: String = '';
begin
  Result := False;
  if AStream.Size = 0 then
    Exit;
  AStream.Position := 0;
  try
    SetLength(Str, AStream.Size div SizeOf(Char));
    AStream.ReadBuffer(Pointer(Str)^, AStream.Size div SizeOf(Char));
    Base64 := EncodeStringBase64(Str);
    Result := True;
  except
    {on E: Exception do
      ShowMessage(E.Message);}
  end;
end;


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

function ConvertHtmlHexToTColor(HexColor: String): TColor;
var
    rColor : TColor;
begin
     HexColor := CheckHexForHash(HexColor);

     if (length(Hexcolor) = 6) then
     begin
           {remember that TColor is bgr not rgb: so you need to switch then around}
           hexcolor := '$00' + copy(hexcolor,5,2) + copy(hexcolor,3,2) + copy(hexcolor,1,2);
           rColor := StrToInt(hexcolor);
     end;

     result := rColor;
end;

function CheckHexForHash(col: string): string;
begin
     if col[1] = '#' then
           col := StringReplace(col,'#','',[rfReplaceAll]);
     result := col;
end;

function ConvertTColorToHTML(aColor: TColor): String;
begin
   Result := '#'+IntToHex(Blue(aColor))+IntToHex(Green(aColor))+IntToHex(Red(aColor));
end;

function CalcColorDist(const Color1, Color2: TBGRAPixel): Integer;
var
  DistR, DistG, DistB: Integer;
begin
  DistR := Abs(Color1.red - Color2.red);
  DistG := Abs(Color1.green - Color2.green);
  DistB := Abs(Color1.blue - Color2.blue);

  Result := DistR * DistR+DistG * DistG+DistB * DistB;
end;

function FindClosestColor(const aColor: TBGRAPixel; const aPalette: TPalette
  ): TBGRAPixel;
var
  MinDist,currDist, i: Integer;
  PaletteColor: TBGRAPixel;
begin
  if aPalette.Count = 0 then
    Exit(BGRAPixelTransparent);

  MinDist := High(Integer);
  for i:= 0 to aPalette.Count-1 do begin
    PaletteColor:=aPalette.Color[i];
    currDist:=CalcColorDist(aColor, PaletteColor);
    if MinDist >  currDist then
    begin
      Result := PaletteColor;
      MinDist := currDist;
      if MinDist=0 then Exit(PaletteColor);
    end;
  end;
end;

function ClipByte(const Value: Integer): Byte;
begin
  if Value > 255 then
    Exit(255)
  else if Value < 0 then
    Exit(0);

  Result := Value;
end;

procedure FloydSteinbergDithering(const aImage: TBGRABitmap;
  const Palette: TPalette; const Power: Byte);
var
  X, Y, I: Integer;
  aOldColor,
  aNewColor: TBGRAPixel;
  anError: TBGRAPixel;
  CurrLineError: array of TBGRAPixel;
  NextLineError: array of TBGRAPixel;
  p : PBGRAPixel;
begin
  SetLength(CurrLineError, aImage.Width + 2);
  SetLength(NextLineError, aImage.Width + 2);

  for Y := 0 to aImage.Height - 1 do begin
    p:=aImage.ScanLine[y];
    for X := 0 to aImage.Width - 1 do begin
      aOldColor:=p^;
      aOldColor.red :=ClipByte(aOldColor.red + (CurrLineError[X + 1].red * Power div 16) div 255);
      aOldColor.green := ClipByte(aOldColor.green + (CurrLineError[X + 1].green * Power div 16) div 255);
      aOldColor.blue := ClipByte(aOldColor.blue + (CurrLineError[X + 1].blue * Power div 16) div 255);

      aNewColor := FindClosestColor(aOldColor, Palette);

      p^.red := aNewColor.red;
      p^.green := aNewColor.green;
      p^.blue := aNewColor.blue;


      anError.red := aOldColor.red - aNewColor.red;
      anError.green := aOldColor.green - aNewColor.green;
      anError.green := aOldColor.blue - aNewColor.blue;

      // [             *     7/16(0) ]
      // [ 3/16(1)  5/16(2)  1/16(3) ]
      // 0
      CurrLineError[X + 2].red := CurrLineError[X + 2].red + 7 * anError.red;
      CurrLineError[X + 2].green := CurrLineError[X + 2].green + 7 * anError.green;
      CurrLineError[X + 2].blue := CurrLineError[X + 2].blue + 7 * anError.blue;
      // 1
      NextLineError[X + 0].red := NextLineError[X + 0].red + 3 * anError.red;
      NextLineError[X + 0].green := NextLineError[X + 0].green + 3 * anError.green;
      NextLineError[X + 0].blue := NextLineError[X + 0].blue + 3 * anError.blue;
      // 2
      NextLineError[X + 1].red := NextLineError[X + 1].red + 5 * anError.red;
      NextLineError[X + 1].green := NextLineError[X + 1].green + 5 * anError.green;
      NextLineError[X + 1].blue := NextLineError[X + 1].blue + 5 * anError.blue;
      // 3
      NextLineError[X + 2].red := NextLineError[X + 2].red + 1 * anError.red;
      NextLineError[X + 2].green := NextLineError[X + 2].green + 1 * anError.green;
      NextLineError[X + 2].blue := NextLineError[X + 2].blue + 1 * anError.blue;
      Inc(p);
    end;

    for I := 0 to High(CurrLineError) do
    begin
      CurrLineError[I] := NextLineError[I];
      NextLineError[I] := BGRAPixelTransparent;
    end;
  end;
  aImage.InvalidateBitmap;
end;

procedure DitherImage(aImg: TBGRABitmap; aPalette: TPalette; aPower: Byte);
var
  aTmp: TBGRABitmap;
  X, Y: Integer;
  aColor: TBGRAPixel;
begin
  aTmp := TBGRABitmap.Create(aImg.Width, aImg.Height);
  try
    // load form origin image
    aTmp.PutImage(0,0,aImg,dmSetExceptTransparent);
    //creare palette from preset


    // dither
    //todo: check dither power from settings
    FloydSteinbergDithering(aTmp, aPalette, 200);
    // load to dither image
    ClearBitmap(aImg);
    aImg.PutImage(0,0,aTmp,dmSetExceptTransparent);
  finally
    aTmp.Free;
  end;
end;

function CheckLayerName(aName: String): String;
var i : Integer;
begin
  Result:=aName;
  for i:=0 to Layers.Count-1 do begin
    if Layers.Keys[i]=aName then begin
       Result:=aName+'1';
       Break;
    end;
  end;
end;

function NumCountChars(const Char: char; const S: String): Integer;
var
  I : Integer;
begin
  Result := 0;
  if Length(S) > 0 then
    for I := 1 to Length(S) do
      if S[I] = Char then Inc(Result);
end;


procedure CreateInternalFrameAndLayer;
begin
 Frames[cINTERNALLAYERANDFRAME]:=TSPFrame.Create(cINTERNALLAYERANDFRAME);
 Layers[cINTERNALLAYERANDFRAME]:=TSPLayer.Create(cINTERNALLAYERANDFRAME);
 Layers[csDRAWLAYER]:=TSPLayer.Create(csDRAWLAYER);
 Layers[cINTERNALLAYERANDFRAME].AddToFrame(cINTERNALLAYERANDFRAME);
 Frames[cINTERNALLAYERANDFRAME].AddLayer(cINTERNALLAYERANDFRAME);
end;

procedure ClearFramesAndLayers;
var
    f , l : Integer;
    aKey  : String;
begin
  while l>0 do begin
    aKey:=Layers.Keys[l];
    Layers.Remove(aKey);
  end;
  f:=Frames.Count-1;
  while f>0 do begin
    aKey:=Frames.Keys[f];
    Frames.Remove(aKey);
  end;
end;

procedure ReloadPresets(aDirectory: String);
var Fi : TSearchRec;
    R : Integer;
begin
 Presets.Clear;
 R:=FindFirst(aDirectory+DirectorySeparator+'*.*',faAnyFile-faVolumeId,fi);
 if R=0 then begin
   while R=0 do begin
     if (LowerCase(ExtractFileExt(Fi.Name))='.png') then begin
       Presets[copy(Fi.Name,1,Pos('.',Fi.Name)-1)]:=TPalettePreset.Create(aDirectory+DirectorySeparator+Fi.Name);
     end;
     r:=FindNext(Fi);
   end;
   FindClose(Fi);
 end;
end;

{ TPalettePreset }

constructor TPalettePreset.Create(aFilename: TFilename);
begin
  fPaletteName:=ExtractFileName(aFilename);
  fPaletteName:=copy(PaletteName,1,Pos('.',PaletteName)-1);
  fBmp:= TBGRABitmap.Create(aFilename);
  fPalette.LoadFromImage(aFilename);
end;

destructor TPalettePreset.Destroy;
begin
 FreeAndNil(fBmp);
 inherited Destroy;
end;

{ TSPUndoRec }

procedure TSPUndoRec.Assign(aSrc: TSPUndoRec);
begin
  fLayerName:=aSrc.fLayerName;
  fLayerData:=aSrc.fLayerData;
  fLayerFrames:=aSrc.fLayerFrames;
end;

{ TUndoRedoManager }
function TUndoRedoManager.InternalCanUndo: boolean;
begin
  result := fUndoList.Count<>0;
end;


function TUndoRedoManager.InternalGetStatesCount: Integer;
begin
  result := fUndoList.Count;
end;

procedure TUndoRedoManager.InternalRestoreData(aData: PSPUndoRec);
begin
  {$IFDEF DEBUG}
   DumpDataToLog(aData);
  {$ENDIF}
  if not LayerExists(aData^.fLayerName) then begin
   //restore deleted layer
   Layers[aData^.fLayerName]:=TSPLayer.Create(aData^.fLayerName,aData^.fLayerData);
   Layers[aData^.fLayerName].FFrames.Text:=aData^.fLayerFrames;
  end else begin
    Layers[aData^.fLayerName].RestoreFromString(aData^.fLayerData);
  end;
end;

procedure TUndoRedoManager.Redo;
var
  aData: TSPUndoRec;
  aUndo: TSPUndoRec;
begin
    if CanRedo then begin
     aData:=fRedoList.Last;
     aUndo:=TSPUndoRec.Create;
     aUndo.Assign(aData);
     InternalRestoreData(@aData);
     fRedoList.Remove(aData);
     fUndoList.Add(aData);
  end;
end;

{$IFDEF DEBUG}
procedure TUndoRedoManager.DumpDataToLog(aData: PSPUndoRec);
begin
 //Assert(aData=nil,'No data to dump!');
 DebugLn(DateTimeToStr(Now()),' In: TUndoRedoManager.DumpDataToLog()');
 DebugLn(#9,'Layer name: ',aData^.fLayerName);
 DebugLn(#9,'Layer data: ',aData^.fLayerData);
 DebugLn(#9,'Layer frames: ',aData^.fLayerFrames);
end;
{$ENDIF}

function TUndoRedoManager.InternalCanRedo: Boolean;
begin
  Result:=fRedoList.Count>0;
end;



procedure TUndoRedoManager.InternalClearStack(aStack: TUndoRedoList);
begin
   if aStack.Count=0 then Exit;
   aStack.Clear;
end;

constructor TUndoRedoManager.Create;
begin
  fUndoList:=TUndoRedoList.Create;
  fRedoList:=TUndoRedoList.Create;
end;

destructor TUndoRedoManager.Destroy;
begin
 InternalClearStack(fRedoList);
 FreeAndNil(fRedoList);
 InternalClearStack(fUndoList);
 FreeAndNil(fUndoList);
end;

procedure TUndoRedoManager.SaveState;
 var
   aData : TSPUndoRec;
begin
  aData:=TSPUndoRec.Create;
  aData.fLayerName:=FrameGrid.ActiveLayer;
  aData.fLayerData:=PChar(Layers[FrameGrid.ActiveLayer].ToBASE64String);
  aData.fLayerFrames:=Layers[FrameGrid.ActiveLayer].FFrames.Text;
  {$IFDEF DEBUG}
  DumpDataToLog(@aData);
  {$ENDIF}
  fUndoList.Add(aData);
  //clear all redo records if new undo record pushed
  InternalClearStack(fRedoList);
end;

procedure TUndoRedoManager.Undo;
var
  aData : TSPUndoRec;
  aRedo : TSPUndoRec;
begin
  if CanUndo then begin
     aData:=fUndoList.Last;
     aRedo:=TSPUndoRec.Create;
     aRedo.Assign(aData);
     InternalRestoreData(@aData);
     fRedoList.Add(aRedo);
     fUndoList.Remove(aData);
  end;
end;


{ TCellCursor }

procedure TCellCursor.SetCoords(AValue: TPoint);
begin
  if ((AValue.X<0) or (AValue.Y<0) or(AValue.X>FrameGrid.FrameWidth-1) or (AValue.Y>FrameGrid.FrameHeight-1)) then Exit;
  X:=AValue.X;
  Y:=AValue.Y;
end;

function TCellCursor.GetPrevCoords: TPoint;
begin
  Result := Point(PrevX,PrevY);
end;

procedure TCellCursor.SetCells(AValue: Byte);
begin
  //if (AValue<1) or (AValue>3) then Exit;
  FCells:=AValue;
end;

function TCellCursor.GetCoords: TPoint;
begin
  Result := Point(X,Y);
end;

{ TSPFrame }

procedure TSPFrame.SetIndex(AValue: Integer);
begin
  if (FIndex=AValue) or (AValue>FCount) then Exit;
  FIndex:=AValue;
end;

constructor TSPFrame.Create(aName: String; w: Integer; h: integer);
begin
 //create an empty frame without layers
 fFrameName:=aName;
 FWidth:=w;
 FHeight:=h;
 fLayers:=TStringList.Create;
end;

destructor TSPFrame.Destroy;
begin
  fLayers.Clear;
  FreeAndNil(fLayers);
  inherited Destroy;
end;

procedure TSPFrame.Resize(w, h: Integer; Stretched: Boolean);
var
  i: Integer;
begin
  FWidth:=w;
  FHeight:=h;
  ResizeLayers(w,h,Stretched);
end;

function TSPFrame.AddLayer(LayerName: String): Boolean;
begin
  result := False;
  if fLayers.IndexOf(LayerName)<>-1 then Exit;
  fLayers.Add(LayerName);
  Result:=True;
end;

function TSPFrame.DeleteLayer(aLayerName: String): Boolean;
 var i : Integer;
begin
  Result:=False;
  i:=fLayers.IndexOf(aLayerName);
  if i>0 then begin
    fLayers.Delete(i);
    Result:=True;
  end;
end;

{ TSPLayer }

procedure TSPLayer.Resize(newWidth, NewHeight: Integer; Stretched: Boolean);
var
  tmpbmp : TBGRABitmap;
begin
  FWidth:=newWidth;
  FHeight:=NewHeight;
  if Stretched then begin
     fLayerImg.ResampleFilter:=rfBicubic;
     tmpbmp:=fLayerImg.Resample(newWidth,NewHeight,rmSimpleStretch) as TBGRABitmap;
     BGRAReplace(fLayerImg,tmpbmp);
  end else begin
    tmpbmp:=fLayerImg.Resample(fLayerImg.Width,fLayerImg.Height) as TBGRABitmap;
    fLayerImg.SetSize(newWidth,NewHeight);
    ClearBitmap(fLayerImg);
    fLayerImg.PutImage(0,0,tmpbmp,dmSetExceptTransparent);
    FreeAndNil(tmpbmp);
  end;
end;

function TSPLayer.ToBASE64String: String;
var
    aStream : TMemoryStream;
begin
  aStream:=TMemoryStream.Create;
  Drawable.SaveToStreamAsPng(aStream);
  if not StreamToBase64(aStream,Result) then Result:='';
  {$IFDEF DEBUG}
  DebugLn(DateTimeToStr(Now()),' In: TSPLayer.ToBASE64String() data: ', Result);
  {$ENDIF}
  FreeAndNil(aStream);
end;

procedure TSPLayer.AddToFrame(FrameName: String);
begin
  FFrames.Add(FrameName);
end;

function TSPLayer.DeleteFromFrame(aFrameName: String): Boolean;
var i : Integer;
begin
 Result:=False;
 i:=FFrames.IndexOf(aFrameName);
 if i>0 then begin
   FFrames.Delete(i);
   Result:=True;
 end;
end;

procedure TSPLayer.RestoreFromString(aBASE64: String);
var
    aStream : TMemoryStream;
begin
  aStream:=TMemoryStream.Create;
  if Base64ToStream(aBASE64,aStream) then begin
    fLayerImg.LoadFromStream(aStream);
  end;
  FreeAndNil(aStream);
end;

constructor TSPLayer.Create(aName, aData: String);
begin
  Create(aName);
  RestoreFromString(aData);
end;

constructor TSPLayer.Create(aName: String; aWidth: Integer; aHeight: Integer);
begin
  fLayerImg := TBGRABitmap.Create(aWidth,aHeight);
  fVisible:=True;
  FLocked:=False;
  FFrames := TStringList.Create;
  FFrames.CaseSensitive:=false;
end;

destructor TSPLayer.Destroy;
begin
  FFrames.Clear;
  FreeAndNil(FFrames);
  FreeAndNil(fLayerImg);
  inherited Destroy;
end;

procedure TSPLayer.Clear;
begin
 fLayerImg.EraseRect(0,0,fLayerImg.Width,fLayerImg.Height,255);
end;

procedure TSPLayer.ClearDrawable;
begin
  ClearBitmap(fLayerImg);
end;

{ TFrameGrid }

procedure TFrameGrid.SetOffset(AValue: TPoint);
begin
  FOffset.Offset(AValue);
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
  fRect.Create(fOffset, fFrameWidth*(fFrameGridSize+fFrameZoom)+1,
                        fFrameHeight*(fFrameGridSize+fFrameZoom)+1);
  if Assigned(fBuffer) then
     BGRAReplace(fBuffer,fBuffer.Resample(fRect.Width,fRect.Height,rmSimpleStretch));
  GetBounds;
end;

constructor TFrameGrid.Create(aW: Integer; aH: Integer; aSize: Word);
begin
  fFrameGridSize:=aSize;
  fFrameHeight:=aH;
  fFrameWidth:=aW;
  FCheckersSize:=INI.ReadInteger('INTERFACE','CHECKERS SIZE',32);
  fFrameZoom:=0;
  CalcGridRect;
  fPreview:=TBGRABitmap.Create(aW,aH);
  FCellCursor := TCellCursor.Create;
  FCellCursor.CursorSize:=1;
  {$IFDEF DEBUG}
  DebugLn(DateTimeToStr(Now), ': In  TFrameGrid.Create() Layers count ',IntToStr(Layers.Count));
  {$ENDIF}
  FActiveLayer:=cINTERNALLAYERANDFRAME;
  fActiveFrame:=cINTERNALLAYERANDFRAME;
  fBuffer:=TBGRABitmap.Create(fFrameWidth*(fFrameGridSize+fFrameZoom),
                              fFrameHeight*(fFrameGridSize+fFrameZoom));
  ResizeLayers(FrameWidth,FrameHeight);
end;

constructor TFrameGrid.Create(aImg: TFileName; aSize: Word);
var aBmp : TBGRABitmap;
    aFrameName , aLayerName: String;
    i: Integer;
begin
    aBmp:=TBGRABitmap.Create(aImg);
    Create(aBmp.Width,aBmp.Height,aSize);
    aFrameName:=ExtractFileName(aImg);
    aLayerName:=aFrameName;
    Frames[aFrameName]:=TSPFrame.Create(aFrameName, FrameWidth, FrameHeight);
    Layers[aFrameName]:=TSPLayer.Create(aLayerName,FrameWidth,FrameHeight);
    ActiveFrame:=aFrameName;

    Frames[aFrameName].AddLayer(aLayerName);
    Layers[aLayerName].AddToFrame(aFrameName);
    ClearBitmap(Layers[aFrameName].Drawable);
    ResizeLayers(FrameWidth,FrameHeight);
    Layers[aLayerName].Drawable.PutImage(0,0,aBmp,dmSetExceptTransparent);
    FreeAndNil(aBmp);
end;

destructor TFrameGrid.Destroy;
begin
  INI.WriteInteger('INTERFACE','CHECKERS SIZE',FCheckersSize);
  FreeAndNil(fPreview);
  FreeAndNil(fBuffer);
  FreeAndNil(FCellCursor);
  inherited Destroy;
end;

function TFrameGrid.HasCoords(aPoint: TPoint): Boolean;
begin
  result := fRect.Contains(aPoint);
end;

procedure TFrameGrid.RenderAndDraw(Canvas: TCanvas);
var
  i, _i: Integer;
  tmpbmp: TBGRABitmap;

  procedure DrawGrid(x1,y1,x2,y2 : Integer; size : Integer);
   var i, xsize, ysize : Integer;
  begin
    xsize := (x2-x1) div size;
    ysize := (y2-y1) div size;
    For i := 1 to ysize do fBuffer.DrawLine(x1,y1+i*size,x2,y1+i*size,ColorToBGRA(clNavy),False);
    For i := 1 to xsize do fBuffer.DrawLine(x1+i*size,y1,x1+i*size,y2,ColorToBGRA(clNavy),False);
    fBuffer.Rectangle(x1,y1,x2,y2,ColorToBGRA(clNavy));
  end;

  procedure InternalDrawLayer(const aLayer : TSPLayer);
  var
    x,y: Integer;
    tmpPix : TBGRAPixel;
  begin
    {$IFDEF DEBUG}
    Assert(Assigned(aLayer),'Layer not assigned!');
    {$ENDIF}

     for x := 0 to aLayer.Drawable.Width-1 do
    for y:= 0 to aLayer.Drawable.Height-1 do begin
      tmpPix := aLayer.Drawable.GetPixel(x,y);
      if tmpPix.alpha>0 then begin
        //draw filled rectangle
         fBuffer.Rectangle(X*(fFrameGridSize+fFrameZoom)+1,
                    Y*(fFrameGridSize+fFrameZoom)+1,
                    X*(fFrameGridSize+fFrameZoom)+(fFrameGridSize+fFrameZoom),
                    Y*(fFrameGridSize+fFrameZoom)+(fFrameGridSize+fFrameZoom),
                    tmpPix,tmpPix);
      end;
    end;
  end;

begin
  ShowGrid:=(fFrameGridSize+fFrameZoom)>5;
  fBuffer.DrawCheckers(Rect(0,0,fBuffer.Width,fBuffer.Height),
                       ColorToBGRA($BFBFBF),
                       ColorToBGRA($FFFFFF),
                       FCheckersSize,
                       FCheckersSize);;
  //draw preview picture and just zoom it up to grid size
  RenderPicture(nil);
  tmpbmp:=fPreview.Resample(fBuffer.Width,fBuffer.Height,rmSimpleStretch);
  fBuffer.PutImage(0,0,tmpbmp,dmSetExceptTransparent);
  FreeAndNil(tmpbmp);
  if ShowGrid then DrawGrid(0,0,fBuffer.Width-1,fBuffer.Height-1,fFrameGridSize+fFrameZoom);

  //draw highlited cell cursor over the grid
  fBuffer.Rectangle(CellCursor.X*(fFrameGridSize+fFrameZoom),
                    CellCursor.Y*(fFrameGridSize+fFrameZoom),
                    CellCursor.X*(fFrameGridSize+fFrameZoom)+(fFrameGridSize+fFrameZoom)*CellCursor.CursorSize,
                    CellCursor.Y*(fFrameGridSize+fFrameZoom)+(fFrameGridSize+fFrameZoom)*CellCursor.CursorSize,clRed);
  Canvas.Clear;
  fBuffer.Draw(Canvas,fOffset.X,fOffset.Y);
end;

procedure TFrameGrid.RenderPicture(Canvas: TCanvas);
 var
   i : Integer;
   aTmp: TBGRABitmap;

begin
  ClearBitmap(fPreview);
  if Canvas<>nil then begin
    fPreview.DrawCheckers(Rect(0,0,fPreview.Width,fPreview.Height),
                        ColorToBGRA($BFBFBF),
                        ColorToBGRA($FFFFFF),
                        4,
                        4);
  end;
  //draw all layers to canvas
  if LayerExists(cINTERNALLAYERANDFRAME) then fPreview.PutImage(0,0,Layers[cINTERNALLAYERANDFRAME].Drawable,dmDrawWithTransparency);
  for i:=0 to Frames[ActiveFrame].fLayers.Count-1 do
    if LayerExists(Frames[ActiveFrame].fLayers.Strings[i]) then
      fPreview.PutImage(0,0,Layers[Frames[ActiveFrame].fLayers.Strings[i]].Drawable,dmDrawWithTransparency);
  if LayerExists(csDRAWLAYER) then fPreview.PutImage(0,0,Layers[csDRAWLAYER].Drawable,dmDrawWithTransparency);
  if Assigned(Canvas) then begin
  //  aTmp := fPreview.Resample(Canvas.Width,Canvas.Height,rmSimpleStretch);
    fPreview.Draw(Canvas,0,0,true);
   // FreeAndNil(aTmp);
  end;
end;

procedure TFrameGrid.Resize(newWidth, newHeight: Integer; Stretched: Boolean);
var
  tmp : TBGRABitmap;
begin
  Frames[fActiveFrame].Resize(newWidth, newHeight, Stretched);
  fFrameHeight:=newHeight;
  fFrameWidth:=newWidth;

  tmp:=fPreview.Resample(newWidth,newHeight,rmSimpleStretch) as TBGRABitmap;
  BGRAReplace(fPreview,tmp);

  tmp:=fBuffer.Resample(fFrameWidth*(fFrameGridSize+fFrameZoom),
                              fFrameHeight*(fFrameGridSize+fFrameZoom)) as TBGRABitmap;
  BGRAReplace(fBuffer,tmp);
  CalcGridRect;
end;

procedure TFrameGrid.ExpotPng(aFilename: TFileName);
begin
  if aFilename<>'' then begin
   RenderPicture(nil);
   fPreview.SaveToFileUTF8(aFilename);
  end;
end;

procedure TFrameGrid.GetBounds;
begin
  fBounds.Left:=0;
  fBounds.Top:=0;
  fBounds.Width:=fFrameWidth*(fFrameGridSize+fFrameZoom)+1+fOffset.X;
  fBounds.Height:=fFrameHeight*(fFrameGridSize+fFrameZoom)+1+fOffset.Y;
end;

{ TPalette }

function TPalette.GetColor(Index: Byte): TBGRAPixel;
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
  AddColor(clBlackOpaque);
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
  for i := 0 to fCount-1 do l.Add(ConvertTColorToHTML(fColors[i]));
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
  for i:=0 to l.Count-1 do begin
    if l.Strings[i]<>'' then begin
      AddColor(ConvertHtmlHexToTColor(l.Strings[i]));
    end;
  end;
  FreeAndNil(l);
end;

function TPalette.LoadFromImage(aName: TFilename): Boolean;
label stop;
var
  j,i, h, w: Integer;
  img: TBGRABitmap;
begin
     img:=TBGRABitmap.Create(aName);
     w:=img.Width-1;
     h:=img.Height-1;
     Clear;
     for i :=0 to w do
       for j:=0 to h do begin
         if AddColor(FPColorToBGRA(img.Colors[i,j]))=-1 then begin
          ShowMessage(rsImageHasTooM);
          //Palette.Reset;
          goto stop;
         end;
       end;
  stop:
     FreeAndNil(img);
end;

function TPalette.AddColor(aColor: TBGRAPixel): Integer;
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

function TPalette.ArrayOfColors: TColorsArray;
var
  i: Integer;
  //aTmp : TColorsArray;
begin
  SetLength(Result,fCount);
  for i:=0 to fCount-1 do Result[i]:=fColors[i].ToColor;
end;

procedure TPalette.Sort;
var  Temp: Integer;
  i: Integer;
  Changed: Boolean;
begin
  //todo: change sort algorithm
  repeat
    Changed:= False;
    for i:= 1 to fCount - 1 do
      if (fColors[i].ToColor > fColors[i + 1].ToColor) then
      begin
        Temp:= fColors[i];
        fColors[i]:= fColors[i + 1];
        fColors[i + 1]:= Temp;
        Changed:= True;
      end;
  until not Changed;
end;

function TPalette.ColorExists(aColor: TBGRAPixel): Integer;
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

procedure TPalette.CopyFrom(src: TPalette);
var
  i: Integer;
begin
  Clear;
  for i:=0 to src.Count-1 do AddColor(src.Color[i]);
end;


function GetAppName : String;
begin
  Result := 'spedit';
end;

function DetectPOLanguage(pofile : TFileName) : String;
var s : String;
  strl : TStringList;
begin
   result := '';
   if pofile='' then Exit;
   strl:=TStringList.Create;
   strl.LoadFromFile(pofile);
   s:=strl.Text;
   Delete(s,1,Pos('Language:',s)+Length('Language:'));
   Delete(s,Pos('\n"',s),Length(s));
   s:=Trim(s);
   FreeAndNil(strl);
   SetDefaultLang(s,ExtractFileDir(pofile));
   Result:=s;
 end;

function LayerExists(aKey: String): Boolean;
begin
  result := (Layers.IndexOf(aKey)<>-1);
end;

procedure ClearBitmap(const aBmp: TBGRABitmap);
var
  p: PBGRAPixel;
  n: integer;
begin
  p := aBmp.Data;
  for n := aBmp.NbPixels - 1 downto 0 do
  begin
      p^ := BGRAPixelTransparent;
    Inc(p);
  end;
  aBmp.InvalidateBitmap;
end;

procedure ResizeLayers(aW, aH: Integer; Stretched : Boolean = false);
var
  i : Integer;
  aKey : String;
begin
 for i:=0 to Layers.Count-1 do begin
  aKey:=Layers.Keys[i];
  Layers[aKey].Resize(aW,aH,Stretched);
 // ClearBitmap(Layers[aKey].Drawable);
 end;
end;

initialization

 OnGetApplicationName := @GetAppName;
 // get app settings path and file
 UserSettingsPath:=GetAppConfigDir(false);
 AppSettingsFile:=GetAppConfigFile(false);
 SpriteLibPath:=GetUserDir+DirectorySeparator+'spedit 4 spritelib';
 ForceDirectories(UserSettingsPath);
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
 spclForeColor:=INI.ReadInteger('FRAME EDITOR','FOREGROUND COLOR',clBlackOpaque);
 //palette with default colors
 Palette.Reset;
 Presets:=TPresetsList.Create(true);

 //mapped lists of frames and layers
 Frames:=TFrames.Create;
 Layers :=TLayers.Create;
 CreateInternalFrameAndLayer;
 UndoRedoManager:=TUndoRedoManager.Create;


 finalization
  INI.WriteString('INTERFACE','SPRITELIB',CurrentLibName);
  //ClearFramesAndLayers;
  FreeAndNil(Presets);
  FreeAndNil(UndoRedoManager);
  FreeAndNil(Layers);
  FreeAndNil(Frames);
  FreeAndNil(FrameGrid);
  FreeAndNil(SpriteLibNames);
  FreeAndNil(INI);
end.

