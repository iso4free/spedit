unit umain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ValEdit,
  StdCtrls, JsonTools, Grids, StrUtils;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    PaintBox1: TPaintBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    ValueListEditor1: TValueListEditor;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ValueListEditor1SelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
  private

  public

  end;

var
  Form1: TForm1;
  root : TJSONNode;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    ValueListEditor1.Clear;
    ValueListEditor1.Values['Piskel file']:=OpenDialog1.FileName;
    Button2.Enabled := true;
    Button2Click(Sender);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  piskel : TJsonNode;
  layers : TJSONNode;
  layerdata: TJsonNode;
  c , l, cc: TJsonNode;
  s : String;
begin
  root.LoadFromFile(ValueListEditor1.Values['Piskel file']);
  ValueListEditor1.Values['root']:=root.Value;
  if not root.Exists('piskel') then begin
    ShowMessage('Not Piskel file!');
  end;
  ShowMessage('FPS: '+IntToStr(root.Find('fps').AsInteger));
  for c in root do begin
   ValueListEditor1.Values[c.Name]:=c.Value;
  end;
  piskel:=root.Find('piskel');
  for c in piskel do begin
   ValueListEditor1.Values[c.Name]:=c.Value;
  end;
  layers:=piskel.Find('layers');
  ShowMessage('Layers count: '+IntToStr(layers.Count));
  for c in layers do begin
   s := c.AsString;
   Memo1.Append(s);
   ValueListEditor1.Values['layer['+c.Name+']']:=s;
   c.AsJson:=s;
   for l in c do begin
    ValueListEditor1.Values['layer['+c.Name+']/'+l.Name]:=l.Value;
    if l.Value='chunks' then
     for cc in l do begin
      ValueListEditor1.Values['layer['+c.Name+']/'+l.Name+'/'+'chunks/'+cc.Name]:=cc.Value;
     end;
   end;
  end;
  Button3.Enabled := true;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if root.Exists(Edit1.text) then begin
   Memo1.Clear;
   Memo1.Lines.Add(root.Find(Edit1.Text).Value);
  end;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: char);
begin
  if Key=#13 then Button3Click(Sender);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
      root:=TJsonNode.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
      FreeAndNil(root);
end;

procedure TForm1.ValueListEditor1SelectCell(Sender: TObject; aCol,
  aRow: Integer; var CanSelect: Boolean);
begin
  Memo1.Clear;
  Memo1.Append(ValueListEditor1.Cells[1,aRow]);
end;

end.

