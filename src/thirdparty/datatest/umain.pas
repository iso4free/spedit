unit umain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    PaintBox1: TPaintBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation
uses
  uglobals;
{$R *.lfm}
 var
   aTestLayer : TSPLayer;
{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Edit1.Text='' then Exit;
  ListBox1.Items.Add(Edit1.Text);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  aTestLayer:=TSPLayer.Create('test',0,0);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if Assigned(aTestLayer) then FreeAndNil(aTestLayer);
end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
begin
  if ListBox1.Count<1 then Exit;
  ShowMessage(ListBox1.Items.Strings[ListBox1.ItemIndex]);
  aTestLayer.RestoreFromString(ListBox1.Items.Strings[ListBox1.ItemIndex]);
  PaintBox1.Invalidate;
end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
begin
  if not Assigned(aTestLayer) then Exit;
  aTestLayer.Drawable.Draw(PaintBox1.Canvas,0,0,True);
end;

end.

