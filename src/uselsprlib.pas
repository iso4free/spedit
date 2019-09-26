unit uselsprlib;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmSelectSpriteLib }

  TfrmSelectSpriteLib = class(TForm)
    ListBox1: TListBox;
    procedure FormActivate(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
  private

  public

  end;

var
  frmSelectSpriteLib: TfrmSelectSpriteLib;

implementation

{$R *.frm}

uses uglobals;

{ TfrmSelectSpriteLib }

procedure TfrmSelectSpriteLib.ListBox1DblClick(Sender: TObject);
begin
 CurrentLibName:=ListBox1.GetSelectedText;
 Close;
end;

procedure TfrmSelectSpriteLib.FormActivate(Sender: TObject);
begin
  ListBox1.Items.Clear;
  ListBox1.Items.Assign(SpriteLibNames);
end;

end.

