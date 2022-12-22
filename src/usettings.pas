unit usettings;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ValEdit,
  Buttons, ComCtrls;

type

  { TfrmSettings }

  TfrmSettings = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    TreeView1: TTreeView;
  private

  public

  end;

var
  frmSettings: TfrmSettings;

implementation
  uses uglobals, umain;
{$R *.lfm}

end.

