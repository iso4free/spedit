unit upiskel;

interface

uses SysUtils, Classes, fpJSON;


Type
  
  Tpiskellayers = Array of String;

Function CreateTpiskellayers(AJSON : TJSONData) : Tpiskellayers;
Procedure SaveTpiskellayersToJSON(AnArray : Tpiskellayers; AJSONArray : TJSONArray); overload;
Function SaveTpiskellayersToJSON(AnArray : Tpiskellayers) : TJSONArray; overload;


Type
  
  
  { -----------------------------------------------------------------------
    Tpiskel
    -----------------------------------------------------------------------}
  
  Tpiskel = class(TObject)
  Private
    Fname : String;
    Fdescription : String;
    Ffps : Integer;
    Fheight : Integer;
    Fwidth : Integer;
    Flayers : Tpiskellayers;
  Public
    Destructor Destroy; override;
    Constructor CreateFromJSON(AJSON : TJSONData); virtual;
    Procedure LoadFromJSON(AJSON : TJSONData); virtual;
    Function SaveToJSON : TJSONObject; overload;
    Procedure SaveToJSON(AJSON : TJSONObject); overload; virtual;
    Property name : String Read Fname Write Fname;
    Property description : String Read Fdescription Write Fdescription;
    Property fps : Integer Read Ffps Write Ffps;
    Property height : Integer Read Fheight Write Fheight;
    Property width : Integer Read Fwidth Write Fwidth;
    Property layers : Tpiskellayers Read Flayers Write Flayers;
  end;
  
  
  { -----------------------------------------------------------------------
    TPiskelJSON
    -----------------------------------------------------------------------}
  
  TPiskelJSON = class(TObject)
  Private
    FmodelVersion : Integer;
    Fpiskel : Tpiskel;
  Public
    Destructor Destroy; override;
    Constructor CreateFromJSON(AJSON : TJSONData); virtual;
    Procedure LoadFromJSON(AJSON : TJSONData); virtual;
    Function SaveToJSON : TJSONObject; overload;
    Procedure SaveToJSON(AJSON : TJSONObject); overload; virtual;
    Property modelVersion : Integer Read FmodelVersion Write FmodelVersion;
    Property piskel : Tpiskel Read Fpiskel Write Fpiskel;
  end;

implementation





Function CreateTpiskellayers(AJSON : TJSONData) : Tpiskellayers;

var
  I : integer;

begin
  SetLength(Result,AJSON.Count);
  For I:=0 to AJSON.Count-1 do
    Result[i]:=AJSON.Items[i].AsString;
End;


Function SaveTpiskellayersToJSON(AnArray : Tpiskellayers) : TJSONArray;
begin
  Result:=TJSONArray.Create;
  Try
    SaveTpiskellayersToJSON(AnArray,Result);
  Except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure SaveTpiskellayersToJSON(AnArray : Tpiskellayers; AJSONArray : TJSONArray);

var
  I : integer;

begin
  For I:=0 to Length(AnArray)-1 do
    AJSONArray.Add(AnArray[i]);
end;



{ -----------------------------------------------------------------------
  Tpiskel
  -----------------------------------------------------------------------}


Constructor Tpiskel.CreateFromJSON(AJSON : TJSONData);

begin
  Create(aFilename : TFilename);
  LoadFromJSON(AJSON);
end;

Procedure Tpiskel.LoadFromJSON(AJSON : TJSONData);

var
  E : TJSONEnum;

begin
  for E in AJSON do
    begin
    case E.Key of
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
    end;
    end;
end;
Function  Tpiskel.SaveToJSON : TJSONObject;
begin
  Result:=TJSONObject.Create;
  Try
    SaveToJSON(Result);
  except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure Tpiskel.SaveToJSON(AJSON : TJSONObject);

begin
  AJSON.Add('name',name);
  AJSON.Add('description',description);
  AJSON.Add('fps',fps);
  AJSON.Add('height',height);
  AJSON.Add('width',width);
  AJSON.Add('layers',SaveTpiskellayersToJSON(layers));
end;


{ -----------------------------------------------------------------------
  TPiskelJSON
  -----------------------------------------------------------------------}

Destructor TPiskelJSON.Destroy;

begin
  FreeAndNil(Fpiskel);
  inherited;
end;


Constructor TPiskelJSON.CreateFromJSON(AJSON : TJSONData);

begin
  Create(aFilename : TFilename);
  LoadFromJSON(AJSON);
end;

Procedure TPiskelJSON.LoadFromJSON(AJSON : TJSONData);

var
  E : TJSONEnum;

begin
  for E in AJSON do
    begin
    case E.Key of
    'modelVersion':
      modelVersion:=E.Value.AsInteger;
    'piskel':
      piskel:=Tpiskel.CreateFromJSON(E.Value);
    end;
    end;
end;
Function  TPiskelJSON.SaveToJSON : TJSONObject;
begin
  Result:=TJSONObject.Create;
  Try
    SaveToJSON(Result);
  except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure TPiskelJSON.SaveToJSON(AJSON : TJSONObject);

begin
  AJSON.Add('modelVersion',modelVersion);
  If Assigned(piskel) then
    AJSON.Add('piskel',piskel.SaveToJSON);
end;

end.
