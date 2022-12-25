unit usettings;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ValEdit,
  Buttons, ComCtrls;

type

  { TfrmSettings }

  TfrmSettings = class(TForm)
    bbtnOk: TBitBtn;
    bbtnCancel: TBitBtn;
    pnlButtons: TPanel;
    pnlSettings: TPanel;
    tvSettingsTree: TTreeView;
  private

  public

  end;

var
  frmSettings: TfrmSettings;

implementation
  uses uglobals, umain;
{$R *.lfm}

end.

