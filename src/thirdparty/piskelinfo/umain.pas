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
  isLoaded : Boolean;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    ValueListEditor1.Clear;
    ValueListEditor1.Values['JSON file']:=OpenDialog1.FileName;
    root.LoadFromFile(ValueListEditor1.Values['JSON file']);
    ValueListEditor1.Values['JSON data']:=root.AsJson;
    Button2.Enabled := true;
    isloaded := true;
    Button2Click(Sender);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  { if not root.Exists('piskel') then begin
     ShowMessage('Not Piskel file!');
     Exit;
   end;  }
   ValueListEditor1.Values['piskel']:=root.Force('piskel').AsString;
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
      isLoaded:=false;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
      FreeAndNil(root);
end;

procedure TForm1.ValueListEditor1SelectCell(Sender: TObject; aCol,
  aRow: Integer; var CanSelect: Boolean);
var
  level : TJsonNode;
begin
  if not isLoaded then Exit;
  level:=root.Find(ValueListEditor1.Cells[0,aRow]);
  Memo1.Clear;
  Memo1.Append(level.Name+' : '+level.Value);
end;

end.

