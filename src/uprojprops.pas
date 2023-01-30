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
    edAuthor: TEdit;
    edCredits: TEdit;
    edLicense: TEdit;
    edTitle: TEdit;
    gbDescript: TGroupBox;
    lblCredits: TLabel;
    lblLicense: TLabel;
    lblAuthor: TLabel;
    lblTitle: TLabel;
    mDescription: TMemo;
    pcProject: TPageControl;
    pnl: TPanel;
    pnlTop: TPanel;
    pnlBottom: TPanel;
    StatusBar1: TStatusBar;
    tsGeneral: TTabSheet;
    procedure bbtnOkClick(Sender: TObject);
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

procedure TfrmProjectProps.bbtnOkClick(Sender: TObject);
begin
  bbtnSaveClick(Sender);
end;

procedure TfrmProjectProps.bbtnSaveClick(Sender: TObject);
begin
 if ProjectInfo.Changed then begin
  ProjectInfo.Title:=edTitle.Text;
  ProjectInfo.Author:=edAuthor.Text;
  ProjectInfo.Description:=mDescription.Text;
  ProjectInfo.License:=edLicense.Text;
  ProjectInfo.CreditsInfo:=edCredits.Text;

  frmMain.actSaveProjExecute(Sender);
  StatusBar1.Panels[0].Text:='';
 end;
end;

procedure TfrmProjectProps.edTitleChange(Sender: TObject);
begin
  ProjectInfo.Changed:=True;
  StatusBar1.Panels[0].Text:='*';
end;

procedure TfrmProjectProps.LoadProjProps;
var oldchanged : Boolean;
begin
  if not Assigned(ProjectInfo) then Exit;
  oldchanged:=ProjectInfo.Changed;
  Caption:=rsProjInfo+ProjectInfo.Title;
  StatusBar1.Panels[1].Text:=ProjectInfo.Filename;
  edTitle.Text:=ProjectInfo.Title;
  edAuthor.Text:=ProjectInfo.Author;
  mDescription.Text:=ProjectInfo.Description;
  edCredits.Text := ProjectInfo.CreditsInfo;
  ProjectInfo.Changed:=oldchanged;
   if ProjectInfo.Changed then StatusBar1.Panels[0].Text:='*'
     else StatusBar1.Panels[0].Text:=' ';
end;

end.

