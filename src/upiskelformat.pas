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
{*    Copyright (c) 2000-2023 by Vadim Vitomsky                            *}
{*                                                                         *}
{*    See the file LICENSE, included in this distribution, for details.    *}
{*                                                                         *}
{*    This program is distributed in the hope that it will be useful,      *}
{*    but WITHOUT ANY WARRANTY; without even the implied warranty of       *}
{*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                 *}
{***************************************************************************}

unit upiskelformat;

interface

uses
   {$IFDEF DEBUG}LazLoggerBase,{$ENDIF}
   SysUtils, Classes, fpJSON, uglobals;


Type
  
  Tpiskellayers = Array of String;

Function CreateTpiskellayers(AJSON : TJSONData) : Tpiskellayers;
Procedure SaveTpiskellayersToJSON(AnArray : Tpiskellayers; AJSONArray : TJSONArray); overload;
Function SaveTpiskellayersToJSON(AnArray : Tpiskellayers) : TJSONArray; overload;


Type
  
  TpiskelhiddenFrames = Array of String;

Function CreateTpiskelhiddenFrames(AJSON : TJSONData) : TpiskelhiddenFrames;
Procedure SaveTpiskelhiddenFramesToJSON(AnArray : TpiskelhiddenFrames; AJSONArray : TJSONArray); overload;
Function SaveTpiskelhiddenFramesToJSON(AnArray : TpiskelhiddenFrames) : TJSONArray; overload;


Type
  
  
  { -----------------------------------------------------------------------
    Tpiskel
    -----------------------------------------------------------------------}
  
  { Tpiskel }

  Tpiskel = class(TObject)
  Private
    FLayersCount: Integer;
    Fname : String;
    Fdescription : String;
    Ffps : Integer;
    Fheight : Integer;
    Fwidth : Integer;
    Flayers : Tpiskellayers;
    FhiddenFrames : TpiskelhiddenFrames;
  Protected
    Procedure Setname(AValue : String); virtual;
    Procedure Setdescription(AValue : String); virtual;
    Procedure Setfps(AValue : Integer); virtual;
    Procedure Setheight(AValue : Integer); virtual;
    Procedure Setwidth(AValue : Integer); virtual;
    Procedure Setlayers(AValue : Tpiskellayers); virtual;
    Procedure SethiddenFrames(AValue : TpiskelhiddenFrames); virtual;
  Public
    Destructor Destroy; override;
    Constructor CreateFromJSON(AJSON : TJSONData); virtual;
    Procedure LoadFromJSON(AJSON : TJSONData); virtual;
    Function SaveToJSON : TJSONObject; overload;
    Procedure SaveToJSON(AJSON : TJSONObject); overload; virtual;
    Property name : String Read Fname Write Setname;
    Property description : String Read Fdescription Write Setdescription;
    Property fps : Integer Read Ffps Write Setfps;
    Property height : Integer Read Fheight Write Setheight;
    Property width : Integer Read Fwidth Write Setwidth;
    Property layers : Tpiskellayers Read Flayers Write Setlayers;
    Property LayersCount : Integer read FLayersCount;
    Property hiddenFrames : TpiskelhiddenFrames Read FhiddenFrames Write SethiddenFrames;
  end;
  
  
  { -----------------------------------------------------------------------
    TPiskelFile
    -----------------------------------------------------------------------}
  
  TPiskelFile = class(TObject)
  Private
    FmodelVersion : Integer;
    Fpiskel : Tpiskel;
  Protected
    Procedure SetmodelVersion(AValue : Integer); virtual;
    Procedure Setpiskel(AValue : Tpiskel); virtual;
  Public
    Destructor Destroy; override;
    Constructor CreateFromJSON(AJSON : TJSONData); virtual;
    Procedure LoadFromJSON(AJSON : TJSONData); virtual;
    Function SaveToJSON : TJSONObject; overload;
    Procedure SaveToJSON(AJSON : TJSONObject); overload; virtual;
    Property modelVersion : Integer Read FmodelVersion Write SetmodelVersion;
    Property piskel : Tpiskel Read Fpiskel Write Setpiskel;
  end;


  function LoadPiskelFile(const aFile : TFilename) : TPiskelFile;
  //loads Piskel JSON file

  procedure SavePiskelFile(const aFile : TFileName; aSrc : TPiskelFile );
  //export project as Piskel JSON file

  procedure PiskelFrameToSpeditFrame(aName : String; aSrc : TPiskelFile);
  //loads frame aName from piskel JSON to SPEdit Frame

implementation





function CreateTpiskellayers(AJSON: TJSONData): Tpiskellayers;

var
  I : integer;

begin
  SetLength(Result,AJSON.Count);
  For I:=0 to AJSON.Count-1 do begin
    Result[i]:=AJSON.Items[i].AsString;
    {$IFDEF DEBUG}
    DebugLn('In: CreateTpiskellayers()) Content:'+AJSON.Items[i].AsString);
    {$ENDIF}
  end;
End;


function SaveTpiskellayersToJSON(AnArray: Tpiskellayers): TJSONArray;
begin
  Result:=TJSONArray.Create;
  Try
    SaveTpiskellayersToJSON(AnArray,Result);
  Except
    FreeAndNil(Result);
    Raise;
  end;
end;


procedure SaveTpiskellayersToJSON(AnArray: Tpiskellayers; AJSONArray: TJSONArray
  );

var
  I : integer;

begin
  For I:=0 to Length(AnArray)-1 do
    AJSONArray.Add(AnArray[i]);
end;




function CreateTpiskelhiddenFrames(AJSON: TJSONData): TpiskelhiddenFrames;

var
  I : integer;

begin
  SetLength(Result,AJSON.Count);
  For I:=0 to AJSON.Count-1 do
    Result[i]:=AJSON.Items[i].AsString;
End;


function SaveTpiskelhiddenFramesToJSON(AnArray: TpiskelhiddenFrames
  ): TJSONArray;
begin
  Result:=TJSONArray.Create;
  Try
    SaveTpiskelhiddenFramesToJSON(AnArray,Result);
  Except
    FreeAndNil(Result);
    Raise;
  end;
end;

function LoadPiskelFile(const aFile: TFilename): TPiskelFile;
var
  aMemoryStream : TMemoryStream;
begin
  //todo: if memory leak check JSON here
  aMemoryStream:=TMemoryStream.Create;
  aMemoryStream.LoadFromFile(aFile);
  Result := TPiskelFile.CreateFromJSON(GetJSON(aMemoryStream,True));
  FreeAndNil(aMemoryStream);
end;

procedure SavePiskelFile(const aFile: TFileName; aSrc: TPiskelFile);
var
  s : TStringList;
begin
  s := TStringList.Create;
  s.Text:=aSrc.SaveToJSON.AsJSON;
  s.SaveToFile(aFile);
  FreeAndNil(s);
end;

procedure PiskelFrameToSpeditFrame(aName: String; aSrc: TPiskelFile);
var
  w,h : Integer;
  cnt , i: Integer;
begin
  w:=aSrc.piskel.width;
  h:=aSrc.piskel.height;
  {
  Frames[aName]:=TSPFrame.Create(aName,w,h);
  Layers[aName]:=TSPLayer.Create(aName,w,h);
  Frames[aName].AddLayer(aName);
  FrameGrid.ActiveFrame:=aName;
  FrameGrid.ActiveLayer:=aName;   }
  //load all layers
  cnt:=aSrc.piskel.LayersCount;
  for i:=0 to cnt-1 do begin
    //todo: parse layer data and create TSPLayer object
    {$IFDEF DEBUG}
    DebugLn('In: PiskelFrameToSpeditFrame() data:');
    DebugLn(aSrc.piskel.layers[i]);
    {$ENDIF}
  end;

end;


procedure SaveTpiskelhiddenFramesToJSON(AnArray: TpiskelhiddenFrames;
  AJSONArray: TJSONArray);

var
  I : integer;

begin
  For I:=0 to Length(AnArray)-1 do
    AJSONArray.Add(AnArray[i]);
end;



{ -----------------------------------------------------------------------
  Tpiskel
  -----------------------------------------------------------------------}


procedure Tpiskel.Setname(AValue: String);

begin
  if (Fname=AValue) then exit;
  Fname:=AValue;
end;

procedure Tpiskel.Setdescription(AValue: String);

begin
  if (Fdescription=AValue) then exit;
  Fdescription:=AValue;
end;

procedure Tpiskel.Setfps(AValue: Integer);

begin
  if (Ffps=AValue) then exit;
  Ffps:=AValue;
end;

procedure Tpiskel.Setheight(AValue: Integer);

begin
  if (Fheight=AValue) then exit;
  Fheight:=AValue;
end;

procedure Tpiskel.Setwidth(AValue: Integer);

begin
  if (Fwidth=AValue) then exit;
  Fwidth:=AValue;
end;

procedure Tpiskel.Setlayers(AValue: Tpiskellayers);

begin
  FLayersCount:=Length(Flayers);
  if (Flayers=AValue) then exit;
  Flayers:=AValue;
end;

procedure Tpiskel.SethiddenFrames(AValue: TpiskelhiddenFrames);

begin
  if (FhiddenFrames=AValue) then exit;
  FhiddenFrames:=AValue;
end;

constructor Tpiskel.CreateFromJSON(AJSON: TJSONData);

begin
  Create();
  LoadFromJSON(AJSON);
end;

destructor Tpiskel.Destroy;
begin
  inherited Destroy;
end;

procedure Tpiskel.LoadFromJSON(AJSON: TJSONData);

var
  E : TJSONEnum;

begin
  for E in AJSON do
    begin
    case lowercase(E.Key) of
    'name':
      name:=E.Value.AsString;
    'description':
      description:=E.Value.AsString;
    'fps':
      fps:=E.Value.AsInteger;
    'height':
      height:=E.Value.AsInteger;
    'width':
      width:=E.Value.AsInteger;
    'layers':
      layers:=CreateTpiskellayers(E.Value);
    'hiddenframes':
      hiddenFrames:=CreateTpiskelhiddenFrames(E.Value);
    else
      Raise EJSON.CreateFmt('"%s" : Unknown property : "%s"',[ClassName,E.Key]);
    end;
    end;
end;
function Tpiskel.SaveToJSON: TJSONObject;
begin
  Result:=TJSONObject.Create;
  Try
    SaveToJSON(Result);
  except
    FreeAndNil(Result);
    Raise;
  end;
end;


procedure Tpiskel.SaveToJSON(AJSON: TJSONObject);

begin
  AJSON.Add('name',name);
  AJSON.Add('description',description);
  AJSON.Add('fps',fps);
  AJSON.Add('height',height);
  AJSON.Add('width',width);
  AJSON.Add('layers',SaveTpiskellayersToJSON(layers));
  AJSON.Add('hiddenFrames',SaveTpiskelhiddenFramesToJSON(hiddenFrames));
end;


{ -----------------------------------------------------------------------
  TPiskelFile
  -----------------------------------------------------------------------}

Destructor TPiskelFile.Destroy;

begin
  FreeAndNil(Fpiskel);
  inherited;
end;


Procedure TPiskelFile.SetmodelVersion(AValue : Integer);

begin
  if (FmodelVersion=AValue) then exit;
  FmodelVersion:=AValue;
end;

Procedure TPiskelFile.Setpiskel(AValue : Tpiskel);

begin
  if (Fpiskel=AValue) then exit;
  FreeAndNil(Fpiskel);
  Fpiskel:=AValue;
end;

Constructor TPiskelFile.CreateFromJSON(AJSON : TJSONData);

begin
  Create();
  LoadFromJSON(AJSON);
end;

Procedure TPiskelFile.LoadFromJSON(AJSON : TJSONData);

var
  E : TJSONEnum;

begin
  for E in AJSON do
    begin
    case lowercase(E.Key) of
    'modelversion':
      modelVersion:=E.Value.AsInteger;
    'piskel':
      piskel:=Tpiskel.CreateFromJSON(E.Value);
    else
      Raise EJSON.CreateFmt('"%s" : Unknown property : "%s"',[ClassName,E.Key]);
    end;
    end;
end;
Function  TPiskelFile.SaveToJSON : TJSONObject;
begin
  Result:=TJSONObject.Create;
  Try
    SaveToJSON(Result);
  except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure TPiskelFile.SaveToJSON(AJSON : TJSONObject);

begin
  AJSON.Add('modelVersion',modelVersion);
  If Assigned(piskel) then
    AJSON.Add('piskel',piskel.SaveToJSON);
end;



end.
