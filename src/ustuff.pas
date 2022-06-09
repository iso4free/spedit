unit ustuff;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, db;

type

{ TSTaticDic }
//Dictionary-like Key=Value store
TSTaticDic = class (TStringList)
 private
   FName: String;
 public
  constructor Create(aDicName : String = 'Dictionary'); overload;
  destructor Destroy; override;
  //set key/value pair
  procedure AddStrValue(aKey: String; aValue : String);
  procedure AddIntValue(aKey: String; aValue : Integer);
  procedure AddDblValue(aKey: String; aValue : Double);
  procedure AddBoolValue(aKey: String; aValue : Boolean);
  function GetStrValue(aKey : String) : String;
  function GetIntValue(aKey : String) : Integer;
  function GetDblValue(aKey : String) : Double;
  function GetBoolValue(aKey : String) : Boolean;
  function KeyExists(aKey : String) : Boolean; //check if key exists
  function GetKey(aValue : String) : String;
  procedure ToList(aList : TStrings);//output all values to list
 published
  property Name : String read FName write FName;
end;


procedure StaticDicFromDBRecord(aDS: TDataSet; const aDic : TSTaticDic);//write record value from database table to dictionary
procedure StaticDicFromDBTable(aDS: TDataSet; const aDic : TSTaticDic; aKeyField,aValueField : String);//simple table key/value to dictionary

implementation

procedure StaticDicFromDBRecord(aDS: TDataSet; const aDic: TSTaticDic);
var
  i: Integer;
begin
 if not Assigned(aDic) then Exit;
 if not Assigned(aDS) then Exit;
 if not aDS.Active then Exit;
 for i:=0 to aDS.FieldCount-1 do begin
   aDic.AddStrValue(aDS.Fields[i].FieldName,aDS.Fields[i].AsString);
 end;
end;

procedure StaticDicFromDBTable(aDS: TDataSet; const aDic: TSTaticDic;
  aKeyField, aValueField: String);
begin
 if not Assigned(aDic) then Exit;
 if not Assigned(aDS) then Exit;
 if not aDS.Active then Exit;
 aDS.First;
 while not aDs.EOF do begin
   aDic.AddStrValue(aDs.FieldByName(aKeyField).AsString,aDs.FieldByName(aValueField).AsString);
   aDS.Next;
 end;
end;

{ TSTaticDic }

constructor TSTaticDic.Create(aDicName: String);
begin
  FName:= aDicName;
  Delimiter:=';';
  Sorted:=true;
end;

destructor TSTaticDic.Destroy;
begin
  inherited Destroy;
end;

procedure TSTaticDic.AddStrValue(aKey: String; aValue: String);
begin
  Add(aKey+'='+aValue);
end;

procedure TSTaticDic.AddIntValue(aKey: String; aValue: Integer);
begin
  Add(aKey+'='+IntToStr(aValue));
end;

procedure TSTaticDic.AddDblValue(aKey: String; aValue: Double);
begin
  Add(aKey+'='+FloatToStr(aValue));
end;

procedure TSTaticDic.AddBoolValue(aKey: String; aValue: Boolean);
begin
  Add(aKey+'='+BoolToStr(aValue));
end;

function TSTaticDic.GetStrValue(aKey: String): String;
begin
 Result:=Values[aKey];
end;

function TSTaticDic.GetIntValue(aKey: String): Integer;
begin
 Result:=StrToInt(Values[aKey]);
end;

function TSTaticDic.GetDblValue(aKey: String): Double;
begin
 Result:=StrToFloat(Values[aKey]);
end;

function TSTaticDic.GetBoolValue(aKey: String): Boolean;
begin
 Result:=StrToBool(Values[aKey]);
end;

function TSTaticDic.KeyExists(aKey: String): Boolean;
var
  i: Integer;
begin
  Result:=false;
  if Count=0 then Exit;
  for i:=0 to Count do begin
   if Names[i]=aKey then begin
     Result:=true;
     Exit;
   end;
  end;
end;

function TSTaticDic.GetKey(aValue: String): String;
var
  i: Integer;
begin
  Result:='';
  if Count=0 then Exit;
  for i:=0 to Count do begin;
   if ValueFromIndex[i]=aValue then begin
     Result:=Names[i];
     Exit;
   end;
  end;
end;

procedure TSTaticDic.ToList(aList: TStrings);
var
  i: Integer;
begin
  if Count=0 then Exit;
  aList.Clear;
  for i:=0 to Count-1 do aList.Add(ValueFromIndex[i]);
end;

end.

