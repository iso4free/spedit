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
  {$IFDEF DEBUG}LazLoggerBase,{$ENDIF} LCLTranslator, FileUtil, LazFileUtils,
  Classes, sysutils, StrUtils, Graphics, IniFiles, JsonTools,
  BGRABitmap, BGRABitmapTypes, BGRAPalette,
  fgl, base64, Dialogs;

resourcestring
  rsColors = 'Colors: ';
  rsFG = 'FG: ';
  rsBG = ' / BG: ';
  rsWarning = 'Warning!';
  rsPaletteWillB = 'Palette will be resetted to default colors! Are You shure?';
  rsImageHasTooM = 'Image has too many colors!';
  rsPleaseInputN = 'Please input new library name';
  rsHasNonInt = ' has non-integer value!';
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
  rsUnsupportedFmt = 'There is no supported format in Clipboard!';
  rsRectangleSel = 'Rectangle selection';
  rsCantMerge = 'Can''t merge layers!';
  rsMoveTool = 'Move tool';
  rsFrame = 'Frame';
  rsErrorProject = 'Error: project file name not set!!!';
  rsLayer = 'Layer';
  rsUntitled = 'Untitled';
  rsProjInfo = 'Project info: ';



const
      APP_NAME = 'SPEdit v.4';
      APP_VER_MAJOR = '4';
      APP_VER_MINOR = '0';
      APP_VER_SUFFIX = 'pre-alpha';
      //todo: change it every build date change!!!
      APP_VER_BUILDDATE = '2023-01-21';

      //MAX_FRAMES = 50;           //it will be enought for one animation?
      MAX_PALETTE_COLORS = 255;  //max colors count in palette
      MAX_PIXELS = 512*512;      //max pixels array (sprite size 512x512 pixels)
      //MAX_LAYERS = 10;           //max layers count in one frame

      //cINTERNALLAYERANDFRAME = 'spedit v.4'; //default frame name and background layer name
      //background layer needed for merged image from all layers
      csDRAWLAYER = 'Draw layer';  //layer name for drawing buffer


type
 // TWorkMode = (wrkProject,wrkSpriteActions,wrkEditor,wrkSourceImage,wrkLibrary,wrkSettings);
  //uses for check which tab now active

  TDrawGridMode = (dgmNone,dgmMove,dgmDraw);

  TColors = array[0..MAX_PALETTE_COLORS] of TBGRAPixel;  //palette - array of colors
  TPixels = array[0..MAX_PIXELS] of TBGRAPixel;      //array of pixels
  TColorsArray = array of TColor;

  type
  TDitherColorError = record
    Red: Integer;
    Green: Integer;
    Blue: Integer;
    Alpha: Integer
  end;

  { TPalette }

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

  { TSPUndoRedoManager }

  TSPUndoRedoManager = class
   private
     fUndoList : TStringList;
     fRedoList : TStringList;
   public
    constructor Create;
    destructor Destroy;override;

    //add any data string to undo list
    procedure SaveState(const aData : String);
    //return data string for restopre state or empy string if nohing to restore
    function Undo : String;
    //return data string for cancel last Undo or empty string if nothing to Redo
    function Redo : String;
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
   public
    property LayerName : String read fName write fName; //text to layers list identify
    property Visible : Boolean read fVisible write fVisible default True; //is drawable
    property Locked : Boolean read FLocked write FLocked default False; //can be changed
    property Temporary : Boolean read fTemporary write fTemporary default False; //temporary created - not visible in layers form
    property Height : Integer read FHeight;
    property Width : Integer read FWidth;
    procedure Resize(w,h : Integer; Stretched : Boolean = false); //set new size and stretch if need
    property Drawable : TBGRABitmap read fLayerImg write fLayerImg;  //BGRABitmap for drawing
    procedure RestoreFromString(aBASE64 : String); //restore layer data from BASE64 encoded string
    function ToBASE64String : String; //encode layer image to BASE64
    function ToJSON : String; //serialize layer to JSON data

    constructor Create(aName : String; aWidth : Integer; aHeight : Integer);
    constructor Create(aName, aData : String); //create layer image from BASE64 encoded string
    destructor Destroy; override;

  end;

  TLayers = specialize TFPGMapObject<String,TSPLayer>;  //simple mapped layers list

  { TSPFrame }

  TSPFrame = class
   private
    fActiveLayerName: String;
    FCount : Byte;
    fFrameName: String;
    FHeight: Integer;
    FIndex: Integer;
    FIsMainLayerActive: Boolean;
    fLayersList : TStringList;
    fLayers : TLayers;
    fModifiead: Boolean;
    fModified: Boolean;
    FWidth: Integer;
    FPreview : TBGRABitmap;
    fUndo : TSPUndoRedoManager;
    procedure SetIndex(AValue: Integer);
    procedure SetActiveLayer(aLayer : TSPLayer);
    procedure RestoreLayerFromJSON(aJSONData : String);
    function  GetActiveLayer : TSPLayer;
   public
    constructor Create(aName : String; w : Integer; h : integer);
    procedure RestoreFromJSON(aJSONData : String);
    destructor Destroy; override;
    function ToJSON : String; //serialize Frame data with layers to JSON
    procedure Resize(w,h : Integer; Stretched : Boolean = false); //resize all layers belongs to frame
    property FrameName : String read fFrameName;//unique frame name for correct managing in mapped list
    property LayersList : TStringList read fLayersList;  //layers mapped list
    property Index : Integer read FIndex write SetIndex;
    property Width : Integer read FWidth;
    property Height : Integer read FHeight;
    property Preview : TBGRABitmap read FPreview; //for draw in frame list item
    property Layers : TLayers read FLayers;
    function AddLayer(LayerName : String): Boolean; //add new layer and return it`s index or -1 if error
    function DeleteLayer(aLayerName : String): Boolean;      //remove layer from frame
    procedure DeleteAllLayers; //delete layers belongs to current frame only
    property Modified : Boolean read fModified write fModifiead default False; //if was editing
    property ActiveLayer : TSPLayer read GetActiveLayer write SetActiveLayer;  //active layer in frame
    procedure SaveState; //save current state for Undo
    function RestoreState : Boolean; //restore last saved state if possible. Return True if success
    function RedoState : Boolean; //redo last restored state if possible. Return True if
    property IsMainLayerActive : Boolean read FIsMainLayerActive;
    procedure RenderPicture; //create preview with all layers
    procedure ExportPNG(aFile : TFileName); //export frame to PNG file
  end;

  //used in TAction for set mirror kind if mirrored
  TSPMirrorKind = (mkNone,mkHorizontal,mkVertical,mkBoth);
  //mirror kind strings for use in impoert/export
  const TMirrorKindToString : array[TSPMirrorKind] of String =
   ('mkNone','mkHorizonal','mkVertical','mkBoth');

  function StrToMirrorKind(aName: String) : TSPMirrorKind;

  { TAction }

 type
  TAction = record
  private
    FActionName: String;
    FFrames: Integer;
    FMirroredAction: String;
    FMirrorKind: TSPMirrorKind;
    procedure SetActionName(AValue: String);
    procedure SetFrames(AValue: Integer);
    procedure SetMirroredAction(AValue: String);
    procedure SetMirrorKind(AValue: TSPMirrorKind);
  public
   //unique action name
   property ActionName : String read FActionName write SetActionName;
   //frames count in action
   property Frames : Integer read FFrames write SetFrames;
   //Name action used as basic for mirror, if emty no mirrored action set
   property MirroredAction : String read FMirroredAction write SetMirroredAction;
   //used only if MirrorAction set, by default mkNoone
   property MirrorKind : TSPMirrorKind read FMirrorKind write SetMirrorKind;
  end;

  TSPActions = specialize TFPGMap <String, TAction>;

  { TCellCursor - for drawing red rectangle followed by mouse cursor or moved by arrow keys}

  TCellCursor = class
   private
     FCells: Byte;
     FPrevX: Integer;
     FPrevY: Integer;
     fVisible: Boolean;
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
    property Visible : Boolean read fVisible write fVisible default True;
  end;

  { TFrameGrid }

  TFrameGrid = class
   private
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
    fShowGrid      : Boolean;//if true grid will be draw if possible
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
    destructor Destroy; override;

    function HasCoords(aPoint : TPoint) : Boolean; //check if frame has point
    procedure RenderAndDraw(Canvas : TCanvas);  //draw background and all layers data to canvas
    property ShowGrid : Boolean read fShowGrid write fShowGrid;      //draw grid
    property FrameZoom : Integer read fFrameZoom write SetFrameZoom; //scale index
    property Offset : TPoint read FOffset write SetOffset;
    property CheckersSize : Byte read FCheckersSize write SetCheckersSize default 16;
    property FrameWidth : Integer read fFrameWidth;
    property FrameHeight : Integer read fFrameHeight;
    property CellCursor : TCellCursor read FCellCursor; //just red frame to show where draw in grid
    property Bounds : TRect read fBounds; //actual canvas size for drawing
    property GridSize : Word read fFrameGridSize; //current grid size - read only
  end;


  TCustomFrames = specialize TFPGMapObject<String,TSPFrame>;  //mapped frames list

  { TFrames }

  TFrames = class(TCustomFrames)
  private
    FNames: TStringList;
    function GetCount : Integer;
  public
   constructor Create;
   destructor Destroy; override;

   //add new frame to mappped array
   procedure Add(const aFrame : TSPFrame);

   //create new frame from image file
   procedure CreateFromImage(aFile : TFileName);

   //return all frames in JSON array
   function ToJSON : String;
   //create frames from JSON data
   procedure FromJSON(aData : String);
   //list of all frame names
   property Names : TStringList read FNames;
   property Count : Integer read GetCount;
  end;

  //Main class for whole project
  //Contains all information about sprites, animations, frames, layers

  { TSPProjectInfo }

  TSPProjectInfo = class
  private
    FActions: TSPActions;
    FActionsCount: Integer;
    FActiveFrame: TSPFrame;
    FActiveFrameName : String;
    FAppName: String;
    FAuthor: String;
    FChanged: Boolean;
    FCreditsInfo: String;
    FDescription: String;
    FFilename: TFilename;
    FFrames: TFrames;
    FFramesCount: Integer;
    FLicense: String;
    FTitle: String;
    procedure SetActiveFrame(AValue: TSPFrame);
    procedure SetAuthor(AValue: String);
    procedure SetCreditsInfo(AValue: String);
    procedure SetDescription(AValue: String);
    procedure SetFilename(AValue: TFilename);
    procedure SetLicense(AValue: String);
    procedure SetTitle(AValue: String);
    function  GetActiveFrame : TSPFrame;

  public

   constructor Create;
   destructor Destroy; override;

   //path and file to save project
   property Filename : TFilename read FFilename write SetFilename;
   //project title
   property Title : String read FTitle write SetTitle;
   //project description
   property Description : String read FDescription write SetDescription;
   //Info about author
   property Author : String read FAuthor write SetAuthor;
   //Ifo that can be used in 'Credits' if used in other apps/games etc.
   property CreditsInfo : String read FCreditsInfo write SetCreditsInfo;
   //License type - can be used from predefined list or set manually
   property License : String read FLicense write SetLicense;
   //AppName used only for information about app created this file.
   //Cannot be modified directly
   property AppName : String read FAppName;
   //True if poroject has some unsaved changes
   property Changed : Boolean read FChanged write FChanged;

   //All project frames in one generic list
   property Frames : TFrames read FFrames;
   //total frames count, in empty project can be 0
   property FramesCount : Integer read FFramesCount;
   //link to current frame (can be nil in empty project)
   property ActiveFrame : TSPFrame read GetActiveFrame write SetActiveFrame;

   //Actions for some animations
   property Actions : TSPActions read FActions;
   //total actions count, can be 0 by default
   property ActionsCount : Integer read FActionsCount;

   //save project to JSON-based file
   procedure Save;
   //load project from JSON-based file
   procedure Load;
  end;

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
  Palette       : TBGRAPalette;
  Presets       : TPresetsList; //palettes presets list

  FrameGrid     : TFrameGrid;
  DrawLayer     : TSPLayer;


  ProjectInfo : TSPProjectInfo;

  //**********************************************************************
  function IsDigits(s : String) : Boolean;
  //check string for digits only

  function ConvertHtmlHexToTColor(HexColor: String):TColor;
  function CheckHexForHash(col: string):string;
  function ConvertTColorToHTML(aColor: TColor) : String;
  function CalcColorDist(const Color1, Color2: TBGRAPixel): Integer;
  function FindClosestColor(const aColor: TBGRAPixel; const aPalette : TPalette): TBGRAPixel;
  function ClipByte(const Value: Integer): Byte;
  procedure FloydSteinbergDithering(const aImage: TBGRABitmap; const aPalette: TPalette; const Power: Byte);
  procedure DitherImage(aImg : TBGRABitmap; aPalette : TPalette; aPower : Byte);
  function CheckLayerName(aName : String) : String; //check layer name if exists return aName+'1' or aName if not
  function CheckFrameName(aName : String) : String; //check frame name if exists return aName+'1' or aName if not
  function DetectPOLanguage(pofile : TFileName) : String;  //return language code for localization
  procedure ClearBitmap(const aBmp : TBGRABitmap);//replase all pixels to BGRAPixelTransparent
  function StreamToBase64(const AStream: TMemoryStream; out Base64: String): Boolean;
  function Base64ToStream(const ABase64: String; var AStream: TMemoryStream): Boolean;
  procedure ReloadPresets(aDirectory: String);  //loads palette presets from selected dir


implementation

uses udraw, upiskelformat;


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

function StrToMirrorKind(aName: String): TSPMirrorKind;
begin
  if LowerCase(aName)='mknone' then Result := mkNone
     else if LowerCase(aName)='mkhorizonal' then Result:=mkHorizontal
     else if LowerCase(aName)='mkvertical' then Result:=mkVertical
     else if LowerCase(aName)='mkboth' then Result:=mkBoth
     else result := mkNone;
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
  DistR, DistG, DistB, DistA: Integer;
begin
  DistR := Abs(Color1.red - Color2.red);
  DistG := Abs(Color1.green - Color2.green);
  DistB := Abs(Color1.blue - Color2.blue);
  DistA := Abs(Color1.alpha - Color2.alpha);

  Result := DistR * DistR+DistG * DistG+DistB * DistB+DistA * DistA;
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
  const aPalette: TPalette; const Power: Byte);
var
  X, Y, I: Integer;
  aOldColor,
  aNewColor: TBGRAPixel;
  anError: TDitherColorError;
  CurrLineError: array of TDitherColorError;
  NextLineError: array of TDitherColorError;
  p : PBGRAPixel;
begin
  SetLength(CurrLineError, aImage.Width + 2);
  SetLength(NextLineError, aImage.Width + 2);
 // FillByte(CurrLineError,SizeOf(CurrLineError),0);
 // FillByte(NextLineError,SizeOf(NextLineError),0);
  for Y := 0 to aImage.Height - 1 do begin
    p:=aImage.ScanLine[y];
    for X := 0 to aImage.Width - 1 do begin
      aOldColor:=p^;
      aOldColor.red :=ClipByte(aOldColor.red + (CurrLineError[X + 1].red * Power div 16) div 255);
      aOldColor.green := ClipByte(aOldColor.green + (CurrLineError[X + 1].green * Power div 16) div 255);
      aOldColor.blue := ClipByte(aOldColor.blue + (CurrLineError[X + 1].blue * Power div 16) div 255);

      aNewColor := FindClosestColor(aOldColor, aPalette);
      aNewColor.alpha:=aOldColor.alpha;
      Palette.AddColor(aNewColor);
      p^.red := aNewColor.red;
      p^.green := aNewColor.green;
      p^.blue := aNewColor.blue;
      p^.alpha:= aOldColor.alpha;


      anError.red := aOldColor.red - aNewColor.red;
      anError.green := aOldColor.green - aNewColor.green;
      anError.blue := aOldColor.blue - aNewColor.blue;
      //anError.Alpha:=aOldColor.alpha;

      // [             *     7/16(0) ]
      // [ 3/16(1)  5/16(2)  1/16(3) ]
      // 0
      CurrLineError[X + 2].red := CurrLineError[X + 2].red + 7 * anError.red;
      CurrLineError[X + 2].green := CurrLineError[X + 2].green + 7 * anError.green;
      CurrLineError[X + 2].blue := CurrLineError[X + 2].blue + 7 * anError.blue;
      //CurrLineError[X + 2].Alpha := CurrLineError[X + 2].Alpha + 7 * anError.Alpha;
      // 1
      NextLineError[X + 0].red := NextLineError[X + 0].red + 3 * anError.red;
      NextLineError[X + 0].green := NextLineError[X + 0].green + 3 * anError.green;
      NextLineError[X + 0].blue := NextLineError[X + 0].blue + 3 * anError.blue;
      //NextLineError[X + 0].Alpha := NextLineError[X + 0].Alpha + 3 * anError.Alpha;
      // 2
      NextLineError[X + 1].red := NextLineError[X + 1].red + 5 * anError.red;
      NextLineError[X + 1].green := NextLineError[X + 1].green + 5 * anError.green;
      NextLineError[X + 1].blue := NextLineError[X + 1].blue + 5 * anError.blue;
      //NextLineError[X + 1].Alpha := NextLineError[X + 1].Alpha + 5 * anError.Alpha;
      // 3
      NextLineError[X + 2].red := NextLineError[X + 2].red + 1 * anError.red;
      NextLineError[X + 2].green := NextLineError[X + 2].green + 1 * anError.green;
      NextLineError[X + 2].blue := NextLineError[X + 2].blue + 1 * anError.blue;
      //NextLineError[X + 2].Alpha := NextLineError[X + 2].Alpha + 1 * anError.Alpha;
      Inc(p);
    end;

    for I := 0 to High(CurrLineError) do
    begin
      CurrLineError[I] := NextLineError[I];
      NextLineError[I] := Default(TDitherColorError);
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

    Palette.Clear;
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
  for i:=0 to ProjectInfo.ActiveFrame.Layers.Count-1 do begin
    if ProjectInfo.ActiveFrame.Layers.Keys[i]=aName then begin
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


procedure ReloadPresets(aDirectory: String);
var
    aList : TStringList;
    tmp : TBGRAPalette;
    i   : Integer;
    aName : String;
begin
 Presets.Clear;
 aList:=TStringList.Create;
 tmp:= TBGRAPalette.Create;
 //todo: check if palette in image file or hex use TPalette class
 //else use TBGRAPatlette
 FindAllFiles(aList,aDirectory,'*.png,;*.PNG;*.hex;*.HEX');
 if aList.Count>0 then begin
   for i:= 0 to aList.Count-1 do begin
     aName:=LazFileUtils.ExtractFileNameWithoutExt(aList.Strings[i]);
      Delete(aName,1,Length(aDirectory)+1);
      Presets[aName]:=TPalettePreset.Create(aList.Strings[i]);
   end;
 end;
  FreeAndNil(aList);
  FreeAndNil(tmp);
end;

{ TAction }

procedure TAction.SetActionName(AValue: String);
begin
  if FActionName=AValue then Exit;
  FActionName:=AValue;
end;

procedure TAction.SetFrames(AValue: Integer);
begin
  if FFrames=AValue then Exit;
  FFrames:=AValue;
end;

procedure TAction.SetMirroredAction(AValue: String);
begin
  if FMirroredAction=AValue then Exit;
  FMirroredAction:=AValue;
end;

procedure TAction.SetMirrorKind(AValue: TSPMirrorKind);
begin
  if FMirrorKind=AValue then Exit;
  FMirrorKind:=AValue;
end;

{ TFrames }

constructor TFrames.Create;
begin
 inherited Create;
 FNames:=TStringList.Create;
end;

procedure TFrames.Add(const aFrame: TSPFrame);
begin
   {$IFDEF DEBUG}
   DebugLn('In: TFrames.Add() Frame JSON:'+LineEnding+aFrame.ToJSON);
   {$ENDIF}
   Self.AddOrSetData(aFrame.FrameName,aFrame);
   FNames.Add(aFrame.FrameName);
   aFrame.RenderPicture;
   ProjectInfo.ActiveFrame:=aFrame;
   ProjectInfo.FFramesCount:=FNames.Count;
end;

procedure TFrames.CreateFromImage(aFile: TFileName);
var
    aImg : TBGRABitmap;
    aName : String;
begin
 aName:=CheckFrameName(ChangeFileExt(ExtractFileName(aFile),''));
 try
   aImg:=TBGRABitmap.Create(aFile);
   Self.Add(TSPFrame.Create(aName,aImg.Width,aImg.Height));
   ProjectInfo.ActiveFrame.ActiveLayer.Drawable.LoadFromFile(aFile);
   ProjectInfo.FFramesCount:=FNames.Count;
   Self[aName].RenderPicture;
 finally
 FreeAndNil(aImg);
 end;
end;

destructor TFrames.Destroy;
var
  i: Integer;
begin
  if FNames.Count>0 then for i:=FNames.Count-1 downto 0 do Self.Remove(FNames.Strings[i]);
  FreeAndNil(FNames);
  inherited Destroy;
end;

procedure TFrames.FromJSON(aData: String);
var
    aJson : TJsonNode;
    e : TJsonNode;
    i: Integer;
    aname : String;
begin
 aJson:=TJsonNode.Create;
 aJson.Parse('{'+aData+'}');

 Self.Clear;
   for e in aJson do begin
     {$IFDEF DEBUG}
      DebugLn('In: TFrames.FromJSON() node: '+e.Name);
      DebugLn('In: TFrames.FromJSON() data: '+e.Value);
     {$ENDIF}
    //todo: create frames from data
     aname:=e.Force(IntToStr(i)+'/frame name').AsString;

     if (aname='') then Continue;
     if (FNames.IndexOf(aname)=-1) then Self[aname]:=TSPFrame.Create(aname,0,0);
     Self[aname].RestoreFromJSON(aJson.Force(IntToStr(i)).Value);
   end;

 FreeAndNil(aJson);
end;

function TFrames.GetCount: Integer;
begin
  Result:=FNames.Count;
end;

function TFrames.ToJSON: String;
var
    aJson : TJsonNode;
    i: Integer;
begin
 aJson:=TJsonNode.Create;
 aJson.Add;
 if Count> 0 then begin
   for i:=0 to Count-1 do begin
     if FNames[i]<>'' then
        aJson.Force(IntToStr(i)).Value:=Self[FNames.Strings[i]].ToJSON;
     {$IFDEF DEBUG}
      DebugLn('In: TFrames.ToJSON(): '+Self[FNames.Strings[i]].ToJSON);
     {$ENDIF}
   end;
 end;

 Result:=aJson.Value;
      {$IFDEF DEBUG}
      DebugLn('In: TFrames.ToJSON() all frames:'+Result);
     {$ENDIF}
 FreeAndNil(aJson);
end;

{ TSPProjectInfo }

constructor TSPProjectInfo.Create;
begin
  FFilename:='';
  FTitle:=rsUntitled+'*';
  FDescription:='';
  {$IFDEF UNIX}
  FAuthor:=sysutils.GetEnvironmentVariable('USER');
  {$ELSE}   //check in windows
  FAuthor:=sysutils.GetEnvironmentVariable('USERNAME');
  {$ENDIF}
  //frames
  FFrames:=TFrames.Create;
  FActiveFrame:=nil;
  FFramesCount:=0;
  //actions
  FActions:=TSPActions.Create;
  FActionsCount:=0;

end;

destructor TSPProjectInfo.Destroy;
begin
  FreeAndNil(FActions);
  FreeAndNil(FFrames);
  inherited Destroy;
end;

procedure TSPProjectInfo.Load;
var
    aJSON : TJsonNode;
    aVer  , i: Integer;
    fname : String;
    fw, fh: Int64;
begin
 if Filename='' then begin
   Assert(Filename<>'','Error: project file name not set!!!');
 end;
 aJSON:=TJsonNode.Create;
 aJSON.LoadFromFile(Filename);
 if aJSON.Force('type').AsString<>'SPEDit file' then begin
   ShowMessage(Format('% is not valid SPEdit file!',[Filename]));
   Exit;
 end;
 aVer:=aJSON.Force('version').AsInteger;
 FAppName:=aJSON.Force('app').AsString;
 FTitle:=aJSON.Force('project/title').AsString;
 FAuthor:=aJSON.Force('project/author').AsString;
 Description := aJSON.Force('project/description').AsString;
 License:=aJSON.Force('project/license').AsString;
 CreditsInfo := aJSON.Force('project/credits').AsString;
 FFramesCount:=aJSON.Force('project/frames count').AsInteger;
 if FramesCount>0 then begin
  for i:=0 to FramesCount-1 do begin
   fname := aJSON.Force('frames/'+IntToStr(i)+'/frame name').AsString;
   fw:=aJSON.Force('frames/'+IntToStr(i)+'/width').AsInteger;
   fh:=aJSON.Force('frames/'+IntToStr(i)+'/height').AsInteger;
   Frames.Add(TSPFrame.Create(fname,fw,fh));
   Frames[fname].RestoreFromJSON(aJSON.Force('frames/'+IntToStr(i)).AsJson);
  end;
  ActiveFrame:=Frames[aJSON.Force('project/active frame').AsString];
 end;
 {$IFDEF DEBUG}
 DebugLn('In: TSPProjectInfo.Load() after load frames: '+Frames.Names.Text);
 {$ENDIF}
 FChanged:=False;
 FreeAndNil(aJSON);
end;

procedure TSPProjectInfo.Save;
var
    aJSON : TJsonNode;
begin
 if Filename='' then begin
   Assert(Filename<>'', rsErrorProject);
 end;
 aJSON:=TJsonNode.Create;
 aJSON.Force('type').AsString:='SPEDit file';
 aJSON.Force('version').AsInteger:=1;
 aJSON.Force('app').AsString:=APP_NAME;
 aJSON.Force('project/title').AsString:=Title;
 aJSON.Force('project/author').AsString:=Author;
 aJSON.Force('project/description').AsString:=Description;
 aJSON.Force('project/license').AsString:=License;
 aJSON.Force('project/credits').AsString:=CreditsInfo;
 aJSON.Force('project/frames count').AsInteger:=FramesCount;
 if FramesCount=0 then aJSON.Force('project/active frame').AsString:=''
    else aJSON.Force('project/active frame').AsString:=ActiveFrame.FrameName;
 aJSON.Force('frames').Value:=Frames.ToJSON;
 aJSON.SaveToFile(Filename);
 FChanged:=False;
 FreeAndNil(aJSON);
end;

procedure TSPProjectInfo.SetActiveFrame(AValue: TSPFrame);
begin
  FActiveFrameName:=AValue.FrameName;
end;

procedure TSPProjectInfo.SetAuthor(AValue: String);
begin
  if FAuthor=AValue then Exit;
  FAuthor:=AValue;
  FChanged:=True;
end;

procedure TSPProjectInfo.SetCreditsInfo(AValue: String);
begin
  if FCreditsInfo=AValue then Exit;
  FCreditsInfo:=AValue;
  FChanged:=True;
end;

procedure TSPProjectInfo.SetDescription(AValue: String);
begin
  if FDescription=AValue then Exit;
  FDescription:=AValue;
  FChanged:=True;
end;

procedure TSPProjectInfo.SetFilename(AValue: TFilename);
begin
  if FFilename=AValue then Exit;
  FFilename:=AValue;
  FChanged:=True;
end;

procedure TSPProjectInfo.SetLicense(AValue: String);
begin
  if FLicense=AValue then Exit;
  FLicense:=AValue;
  FChanged:=True;
end;

procedure TSPProjectInfo.SetTitle(AValue: String);
begin
  if FTitle=AValue then Exit;
  FTitle:=AValue;
  FChanged:=True;
end;

function TSPProjectInfo.GetActiveFrame: TSPFrame;
begin
 Result:=Frames[FActiveFrameName];
end;

{ TPalettePreset }

constructor TPalettePreset.Create(aFilename: TFilename);
var
    fExt : String;
    aPal : TBGRAPalette;
    i: Integer;
    aBmp : TBGRABitmap;
begin
  fPaletteName:=ExtractFileName(aFilename);
  fPaletteName:=copy(PaletteName,1,Pos('.',PaletteName)-1);
  fExt:=LowerCase(ExtractFileExt(aFilename));
  {$IFDEF DEBUG}
  // DebugLn('In: TPalettePreset.Create() ext=',fExt);
  {$ENDIF}
  if fExt='.png' then begin
    fBmp:= TBGRABitmap.Create(aFilename);
    fPalette.LoadFromImage(aFilename);
  end else if fExt='.hex' then begin
    fPalette.LoadFromFile(aFilename);
  end else if fExt='.gpl' then begin
   aBmp:=TBGRABitmap.Create;
   aPal:=TBGRAPalette.Create(aBmp);
   aPal.LoadFromFile(aFilename);
   for i:= 0to aPal.Count-1 do begin
    fPalette.AddColor(aPal.Color[i]);
   end;
   FreeAndNil(aBmp);
   FreeAndNil(aPal);
  end;
end;

destructor TPalettePreset.Destroy;
begin
 FreeAndNil(fBmp);
 inherited Destroy;
end;

function TSPUndoRedoManager.Redo: String;
var
  s: String;
begin
  s:='';
  if (fRedoList.Count>0) then begin
     s:=fRedoList.Pop;
     fUndoList.Add(s);
  end;
  Result:=s;
end;


constructor TSPUndoRedoManager.Create;
begin
  fUndoList:=TStringList.Create;
  fRedoList:=TStringList.Create;
end;

destructor TSPUndoRedoManager.Destroy;
begin
 FreeAndNil(fRedoList);
 FreeAndNil(fUndoList);
end;

procedure TSPUndoRedoManager.SaveState(const aData: String);
begin
  fUndoList.Add(aData);
end;

function TSPUndoRedoManager.Undo: String;
var
  s : String;
begin
  s:='';
  if (fUndoList.Count>0) then begin
   s:=fUndoList.Pop;
   fRedoList.Add(s);
   Result:=s;
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
 fLayersList:=TStringList.Create;
 fUndo:=TSPUndoRedoManager.Create;
 fLayers:=TLayers.Create(true);
 AddLayer(aName);
 DrawLayer.Drawable.SetSize(w,h);
 ClearBitmap(DrawLayer.Drawable);
 FPreview:=TBGRABitmap.Create(w,h);
end;

procedure TSPFrame.RestoreFromJSON(aJSONData: String);
var
 aJSON : TJsonNode;
 i : Integer;
 begin
  //empty JSON mean nothing to restore so leave as is
  if aJSONData='' then Exit;
  aJSON:=TJsonNode.Create;
  aJSON.Parse(aJSONData);

  FIndex:=aJSON.Find('index').AsInteger;
  fFrameName:=aJSON.Find('frame name').AsString;
  FWidth:=aJSON.Find('width').AsInteger;
  FHeight:=aJSON.Find('height').AsInteger;
  FPreview.SetSize(FWidth,FHeight);
  FCount:=aJSON.Find('layers count').AsInteger;
  for i:=0 to FCount-1 do begin
      RestoreLayerFromJSON(aJSON.Force('layers/'+IntToStr(i)).Value);
  end;
  FreeAndNil(aJSON);
end;

function TSPFrame.RestoreState: Boolean;
var
 s : String;
begin
  s :=fUndo.Undo;
  RestoreFromJSON(s);
  Result:=s<>'';
end;

procedure TSPFrame.SaveState;
begin
  fUndo.SaveState(ToJSON);
end;

procedure TSPFrame.SetActiveLayer(aLayer: TSPLayer);
begin
 fActiveLayerName:=aLayer.LayerName;
 FIsMainLayerActive:=aLayer.LayerName=fFrameName;
end;

destructor TSPFrame.Destroy;
begin
  FreeAndNil(FPreview);
  FreeAndNil(fUndo);
  FreeAndNil(FPreview);
  //just nil the link to drawlayer without freeing instance:
  //- it will deleted when app closed
  Layers[csDRAWLAYER]:=nil;

  FreeAndNil(fLayers);
  FreeAndNil(fLayersList);
  inherited Destroy;
end;

procedure TSPFrame.ExportPNG(aFile: TFileName);
begin
   if aFile<>'' then begin
   fPreview.SaveToFileUTF8(aFile);
  end;
end;

function TSPFrame.RedoState: Boolean;
var
 s : String;
begin
  s :=fUndo.Redo;
  RestoreFromJSON(s);
  Result:=s<>'';
end;

procedure TSPFrame.RenderPicture;
var
  i : Integer;
  _ln : String;
begin
 if not Assigned(FPreview) then Exit;
 ClearBitmap(FPreview);
 //draw all layers to canvas
 for i:=0 to LayersList.Count-1 do begin
  _ln:=LayersList.Strings[i];
   if ((Layers.IndexOf(_ln)<>-1) and (Layers[_ln].Visible)) then
     fPreview.PutImage(0,0,Layers[_ln].Drawable,dmDrawWithTransparency);
 end;
  fPreview.PutImage(0,0,DrawLayer.Drawable,dmDrawWithTransparency);
end;

function TSPFrame.ToJSON: String;
var
    aJSON : TJsonNode;
    aLayers : TJsonNode;
    i: Integer;
begin
 result := '';
 aJSON:=TJsonNode.Create;
 aJSON.Force('index').AsInteger:=FIndex;
 aJSON.Force('frame name').AsString:=fFrameName;
 aJSON.Force('width').AsInteger:=FWidth;
 aJSON.Force('height').AsInteger:=FHeight;
 FCount:=fLayers.Count;
 aJSON.Force('layers count').AsInteger:=FCount;
 //add all layers to JSON array
 aLayers:=aJSON.Force('layers').Add;

 for i := 0 to FCount-1 do begin
  aJSON.Force('layers/'+IntToStr(i)).Value:=Layers[fLayersList.Strings[i]].ToJSON;
 end;

 Result:=aJSON.Value;
 {$IFDEF DEBUG}
 DebugLn('In: TSPFrame.ToJSON() JSON data:',Result);
 {$ENDIF}
 FreeAndNil(aJSON);
end;

procedure TSPFrame.RestoreLayerFromJSON(aJSONData: String);
var
      aJSON : TJsonNode;
      aName : String;
begin
 aJSON:=TJsonNode.Create;
 aJSON.Value:=aJSONData;
 try
  {$IFDEF DEBUG}
  DebugLn('In: TSPFrame.RestoreLayerFromJSON(JSON) parsed data: ', aJSON.AsJSON);
  {$ENDIF}
     aName:=aJSON.Force('layer name').AsString;
     ProjectInfo.ActiveFrame.AddLayer(aName);

     Layers[aName].RestoreFromString(aJSON.Force('image (BASE64)').AsString);
     Layers[aName].Visible:=aJSON.Force('visible').AsBoolean;
     Layers[aName].Locked:=aJSON.Force('locked').AsBoolean;
 finally
  FreeAndNil(aJSON);
 end;
end;

function TSPFrame.GetActiveLayer: TSPLayer;
begin
  Result:=Layers[fActiveLayerName];
end;

procedure TSPFrame.Resize(w, h: Integer; Stretched: Boolean);
var
  i: Integer;
  tmpbmp : TBGRABitmap;
begin
 FWidth:=w;
 FHeight:=h;
 FPreview.SetSize(w,h);
 DrawLayer.Drawable.SetSize(w,h);
 if LayersList.Count=0 then Exit;
 for i:=0 to LayersList.Count-1 do begin
  Layers[LayersList.Strings[i]].Resize(w,h,Stretched);
 end;
end;

function TSPFrame.AddLayer(LayerName: String): Boolean;
begin
  result := False;
  //layer with LayerName already exist - just set it as active
  if fLayersList.IndexOf(LayerName)=-1 then begin
    LayersList.Add(LayerName);
    Layers[LayerName]:=TSPLayer.Create(LayerName,FWidth,FHeight);
  end;
  {$IFDEF DEBUG}
  DebugLn('In: AddLayer() LayersList: '+LayersList.Text);
  {$ENDIF}
  ActiveLayer:=Layers[LayerName];

  Result:=True;
end;

procedure TSPFrame.DeleteAllLayers;
var
  s : String;
begin
  if fLayers.Count=0 then Exit;
  while fLayers.Count<>0 do begin
   s:=fLayersList.Pop;
   Layers.Remove(s);
  end;
end;

function TSPFrame.DeleteLayer(aLayerName: String): Boolean;
 var i : Integer;
begin
  Result:=False;
  i:=fLayers.IndexOf(aLayerName);
  if i<>-1 then begin
    fLayers.Delete(i);
    fLayersList.Delete(fLayersList.IndexOf(aLayerName));
    if i>0 then ActiveLayer:=Layers[fLayersList.Strings[i-1]]
       else ActiveLayer:=Layers[fLayersList.Strings[0]];
    Layers.Remove(aLayerName);
    Result:=True;
  end;
end;

{ TSPLayer }

function TSPLayer.ToBASE64String: String;
var
    aStream : TMemoryStream;
begin
  aStream:=TMemoryStream.Create;
  Drawable.SaveToStreamAsPng(aStream);
  if not StreamToBase64(aStream,Result) then Result:='';
  FreeAndNil(aStream);
end;

function TSPLayer.ToJSON: String;
 var
     aJSON : TJsonNode;
begin
  result := '';
  aJSON:=TJsonNode.Create;
  aJSON.Add('layer name',fName);
  aJSON.Add('image (BASE64)',ToBASE64String);
  aJSON.Add('visible',fVisible);
  aJSON.Add('locked',FLocked);
  Result:=aJSON.Value;
  {$IFDEF DEBUG}
  DebugLn('In : TSPLayer.ToJSON() result:'+Result);
  {$ENDIF}
  FreeAndNil(aJSON);
end;

procedure TSPLayer.RestoreFromString(aBASE64: String);
var
    aStream : TMemoryStream;
begin
   {$IFDEF DEBUG}
  DebugLn('In: TSPLayer.RestoreFromString() data: ', aBASE64);
  {$ENDIF}
  aStream:=TMemoryStream.Create;
  if Base64ToStream(aBASE64,aStream) then begin
    fLayerImg.LoadFromStream(aStream);
  end;
  FreeAndNil(aStream);
end;

constructor TSPLayer.Create(aName, aData: String);
begin
  Create(aName,0,0);
  RestoreFromString(aData);
end;

constructor TSPLayer.Create(aName: String; aWidth: Integer; aHeight: Integer);
begin
  fLayerImg := TBGRABitmap.Create(aWidth,aHeight);
  fVisible:=True;
  FLocked:=False;
  fName:=aName;
end;

destructor TSPLayer.Destroy;
begin
  FreeAndNil(fLayerImg);
  inherited Destroy;
end;

procedure TSPLayer.Resize(w, h: Integer; Stretched: Boolean);
var
  tmpbmp : TBGRABitmap;
begin
  FWidth:=w;
  FHeight:=h;
  if Stretched then begin
     fLayerImg.ResampleFilter:=rfBicubic;
     tmpbmp:=fLayerImg.Resample(w,h,rmSimpleStretch) as TBGRABitmap;
     BGRAReplace(fLayerImg,tmpbmp);
  end else begin
    tmpbmp:=fLayerImg.Resample(fLayerImg.Width,fLayerImg.Height) as TBGRABitmap;
    fLayerImg.SetSize(w,h);
    ClearBitmap(fLayerImg);
    fLayerImg.PutImage(0,0,tmpbmp,dmSetExceptTransparent);
    FreeAndNil(tmpbmp);
  end;
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
     Result.Y:= (posy+1) div (fFrameGridSize+fFrameZoom)+1;
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
  if FCheckersSize<8 then FCheckersSize:=8;
  fFrameZoom:=0;
  CalcGridRect;
  fPreview:=TBGRABitmap.Create(aW,aH);
  FCellCursor := TCellCursor.Create;
  FCellCursor.CursorSize:=1;
  FCellCursor.Visible:=True;
  fBuffer:=TBGRABitmap.Create(fFrameWidth*(fFrameGridSize+fFrameZoom),
                              fFrameHeight*(fFrameGridSize+fFrameZoom));
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
    For i := 1 to ysize do fBuffer.DrawLine(x1,y1+i*size,x2,y1+i*size,VGANavy,False);
    For i := 1 to xsize do fBuffer.DrawLine(x1+i*size,y1,x1+i*size,y2,VGANavy,False);
    fBuffer.Rectangle(x1,y1,x2,y2,ColorToBGRA(clNavy));
  end;

  procedure InternalDrawLayer(const aLayer : TSPLayer);
  var
    x,y: Integer;
    tmpPix : TBGRAPixel;
  begin
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
  fBuffer.DrawCheckers(Rect(0,0,fBuffer.Width,fBuffer.Height),
                       $BFBFBF,
                       $FFFFFF,
                       FCheckersSize,
                       FCheckersSize);;
  //draw preview picture and just zoom it up to grid size
  ProjectInfo.ActiveFrame.RenderPicture;
  tmpbmp:=ProjectInfo.ActiveFrame.Preview.Resample(fBuffer.Width,fBuffer.Height,rmSimpleStretch);
  fBuffer.PutImage(0,0,tmpbmp,dmSetExceptTransparent);
  FreeAndNil(tmpbmp);
  if ShowGrid and ((fFrameGridSize+fFrameZoom)>5) then DrawGrid(0,0,fBuffer.Width-1,fBuffer.Height-1,fFrameGridSize+fFrameZoom);

  //draw highlited cell cursor over the grid
  if CellCursor.Visible then
   fBuffer.Rectangle(CellCursor.X*(fFrameGridSize+fFrameZoom),
                    CellCursor.Y*(fFrameGridSize+fFrameZoom),
                    CellCursor.X*(fFrameGridSize+fFrameZoom)+(fFrameGridSize+fFrameZoom)*CellCursor.CursorSize,
                    CellCursor.Y*(fFrameGridSize+fFrameZoom)+(fFrameGridSize+fFrameZoom)*CellCursor.CursorSize,clRed,dmXOR);
  //if selection enabled draw XORed selection rect
  if ToolOptions.IsSelection then begin
   //recalc selection rect coords
   fBuffer.Rectangle(Rect(ToolOptions.SelectionRect.Left*(fFrameGridSize+fFrameZoom),
                          ToolOptions.SelectionRect.Top*(fFrameGridSize+fFrameZoom),
                          ToolOptions.SelectionRect.Right*(fFrameGridSize+fFrameZoom),
                          ToolOptions.SelectionRect.Bottom*(fFrameGridSize+fFrameZoom)),
                          VGALime,dmXor);
  end;
  Canvas.Clear;
  fBuffer.Draw(Canvas,fOffset.X,fOffset.Y);
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
var
  i: Integer;
begin
  Clear;
  for i:=0 to VGAColors.Count-1 do Palette.AddColor(VGAColors.ByIndex[i]);
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

function CheckFrameName(aName: String): String;
var i : Integer;
begin
  Result:=aName;
  for i:=0 to ProjectInfo.Frames.Count-1 do begin
    if ProjectInfo.Frames.Keys[i]=aName then begin
       Result:=aName+'1';
       Break;
    end;
  end;
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
 Palette:=TBGRAPalette.Create;
 Presets:=TPresetsList.Create(true);

 DrawLayer:=TSPLayer.Create(csDRAWLAYER,0,0);


 finalization
  INI.WriteString('INTERFACE','SPRITELIB',CurrentLibName);
  FreeAndNil(Presets);
  FreeAndNil(DrawLayer);
  FreeAndNil(FrameGrid);
  FreeAndNil(Palette);
  FreeAndNil(ProjectInfo);
  FreeAndNil(SpriteLibNames);
  FreeAndNil(INI);
end.

