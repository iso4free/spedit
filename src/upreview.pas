unit upreview;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TFrmPreview }

  TFrmPreview = class(TForm)
    FramePreview: TPaintBox;
    Panel1: TPanel;
    sdExportFrameSaveDialog: TSaveDialog;
    procedure FramePreviewClick(Sender: TObject);
  private

  public

  end;

var
  FrmPreview: TFrmPreview;

implementation
 uses uglobals;
{$R *.frm}

 { TFrmPreview }

 procedure TFrmPreview.FramePreviewClick(Sender: TObject);
 begin
   sdExportFrameSaveDialog.InitialDir:=GetUserDir;
  sdExportFrameSaveDialog.FileName:=FrameGrid.ActiveFrame;
  if sdExportFrameSaveDialog.Execute then begin
    //save current frame to PNG file by default to user dir and with frame name
    FrameGrid.ExpotPng(sdExportFrameSaveDialog.FileName);
  end;
 end;

end.

