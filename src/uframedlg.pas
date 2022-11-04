unit uframedlg;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Spin, Buttons;

type

  { TfrmFrameDlg }

  TfrmFrameDlg = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    edtFrameName: TEdit;
    frmFrameWidth: TLabel;
    lblFrameHeight: TLabel;
    lblFrameName: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    spnedtHeight: TSpinEdit;
    spnedtWidth: TSpinEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    fExecute: Boolean;

  public
    function Execute() : Boolean;
  end;

var
  frmFrameDlg: TfrmFrameDlg;

implementation

{$R *.frm}

{ TfrmFrameDlg }

procedure TfrmFrameDlg.BitBtn1Click(Sender: TObject);
begin
  fExecute:=True;
end;

procedure TfrmFrameDlg.BitBtn2Click(Sender: TObject);
begin
  fExecute:=False;
end;

procedure TfrmFrameDlg.FormCreate(Sender: TObject);
begin
  fExecute:=False;
end;

function TfrmFrameDlg.Execute(): Boolean;
begin
  fExecute:=False;
  frmFrameDlg.ShowModal;
end;

end.

