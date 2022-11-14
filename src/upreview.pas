{***************************************************************************}
{*     This file is a part of                                              *}
{*                                                                         *}
{* @@@@@@  @@@@@@@  @@@@@@@@ @@@@@@@  @@@ @@@@@@@   @@@  @@@         @@@   *}
{*@@@@@@@  @@@@@@@@ @@@@@@@@ @@@@@@@@ @@@ @@@@@@@   @@@  @@@        @@@@   *}
{*!@@      @@!  @@@ @@!      @@!  @@@ @@!   @@!     @@!  @@@       @@!@!   *}
{*!@!      !@!  @!@ !@!      !@!  @!@ !@!   !@!     !@!  @!@      !@!!@!   *}
{*!!@@!!   @!@@!@!  @!!!:!   @!@  !@! !!@   @!!     @!@  !@!     @!! @!!   *}
{* !!@!!!  !!@!!!   !!!!!:   !@!  !!! !!!   !!!     !@!  !!!    !!!  !@!   *}
{*     !:! !!:      !!:      !!:  !!! !!:   !!:     :!:  !!:    :!!:!:!!:  *}
{*    !:!  :!:      :!:      :!:  !:! :!:   :!:      ::!!:! :!: !:::!!:::  *}
{*:::: ::   ::       :: ::::  :::: ::  ::    ::       ::::  :::      :::   *}
{*:: : :    :       : :: ::  :: :  :  :      :         :    :::      :::   *}
{*                                                                         *}
{***************************************************************************}
{*    Sprite Editor 4.0                                                    *}
{*    Copyright (c) 2000-2022 by Vadim Vitomsky                            *}
{*                                                                         *}
{*    See the file LICENSE, included in this distribution, for details.    *}
{*                                                                         *}
{*    This program is distributed in the hope that it will be useful,      *}
{*    but WITHOUT ANY WARRANTY; without even the implied warranty of       *}
{*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                 *}
{***************************************************************************}
unit upreview;

{$mode ObjFPC}{$H+}

interface

uses
  {$IFDEF DEBUG}LazLoggerBase,{$ENDIF}
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TFrmPreview }

  TFrmPreview = class(TForm)
    FramePreview: TPaintBox;
    Panel1: TPanel;
    sdExportFrameSaveDialog: TSaveDialog;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FramePreviewClick(Sender: TObject);
    procedure FramePreviewPaint(Sender: TObject);
  private

  public

  end;

var
  FrmPreview: TFrmPreview;

implementation
 uses uglobals, umain;
{$R *.lfm}

 { TFrmPreview }

procedure TFrmPreview.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  frmMain.PreviewMenuItem.Checked:=False;
  frmMain.SetFocus;
end;

procedure TFrmPreview.FormCreate(Sender: TObject);
begin
  FrmPreview.Top:=INI.ReadInteger('FRMPREVIEW','TOP',FrmPreview.Top);
  FrmPreview.Left:=INI.ReadInteger('FRMPREVIEW','LEFT',FrmPreview.Left);
  FrmPreview.Width:=INI.ReadInteger('FRMPREVIEW','WIDTH',FrmPreview.Width);
  FrmPreview.Height:=INI.ReadInteger('FRMPREVIEW','HEIGHT',FrmPreview.Height);
end;

procedure TFrmPreview.FormDestroy(Sender: TObject);
begin
  INI.WriteInteger('FRMPREVIEW','TOP',FrmPreview.Top);
  INI.WriteInteger('FRMPREVIEW','LEFT',FrmPreview.Left);
  INI.WriteInteger('FRMPREVIEW','WIDTH',FrmPreview.Width);
  INI.WriteInteger('FRMPREVIEW','HEIGHT',FrmPreview.Height);
end;

 procedure TFrmPreview.FramePreviewClick(Sender: TObject);
 begin
   sdExportFrameSaveDialog.InitialDir:=GetUserDir;
  sdExportFrameSaveDialog.FileName:=FrameGrid.ActiveFrame;
  if sdExportFrameSaveDialog.Execute then begin
    //save current frame to PNG file by default to user dir and with frame name
    FrameGrid.ExpotPng(sdExportFrameSaveDialog.FileName);
  end;
 end;

procedure TFrmPreview.FramePreviewPaint(Sender: TObject);
begin
 if Assigned(FrameGrid) then
  FrameGrid.RenderPicture(FramePreview.Canvas);
end;

end.

