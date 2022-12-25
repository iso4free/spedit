unit uresizedlg;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls;

type

  { TfrmResize }

  TfrmResize = class(TForm)
    bbtnOk: TBitBtn;
    bbtnCancel: TBitBtn;
    chkbCanvasOnly: TCheckBox;
    grpbResize: TGroupBox;
    pnlButtons: TPanel;
  private

  public

  end;

var
  frmResize: TfrmResize;

implementation
 uses uglobals;
{$R *.lfm}

end.

