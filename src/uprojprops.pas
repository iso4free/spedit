unit uprojprops;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  ComCtrls, StdCtrls;

type

  { TfrmProjectProps }

  TfrmProjectProps = class(TForm)
    bbtnOk: TBitBtn;
    bbtnCancel: TBitBtn;
    bbtnSave: TBitBtn;
    edTitle: TEdit;
    lblTitle: TLabel;
    pcProject: TPageControl;
    pnl: TPanel;
    pnlTop: TPanel;
    pnlBottom: TPanel;
    StatusBar1: TStatusBar;
    tsGeneral: TTabSheet;
    procedure bbtnSaveClick(Sender: TObject);
    procedure edTitleChange(Sender: TObject);
  private

  public
    procedure LoadProjProps;
  end;

var
  frmProjectProps: TfrmProjectProps;

implementation
uses umain, uglobals;
{$R *.lfm}

{ TfrmProjectProps }

procedure TfrmProjectProps.bbtnSaveClick(Sender: TObject);
begin
  frmMain.actSaveProjExecute(Sender);
end;

procedure TfrmProjectProps.edTitleChange(Sender: TObject);
begin
  ProjectInfo.Title:=edTitle.Text;
  StatusBar1.Panels[0].Text:='*';
end;

procedure TfrmProjectProps.LoadProjProps;
begin
  if not Assigned(ProjectInfo) then Exit;
  edTitle.Text:=ProjectInfo.Title;
  if ProjectInfo.Changed then StatusBar1.Panels[0].Text:='*'
     else StatusBar1.Panels[0].Text:=' ';
  StatusBar1.Panels[1].Text:=ProjectInfo.Filename;
end;

end.

