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
unit uframes;

{$mode ObjFPC}{$H+}

interface

uses
  {$IFDEF DEBUG}LazLoggerBase,{$ENDIF}
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  BGRAImageList;

type

  { TfrmFrames }

  TfrmFrames = class(TForm)
    FramesListPreview: TBGRAImageList;
    flpnlFrames: TFlowPanel;
    lvFrames: TListView;
    Panel1: TPanel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private

  public

  end;

var
  frmFrames: TfrmFrames;

implementation
 uses uglobals, umain;
{$R *.lfm}

 { TfrmFrames }

 procedure TfrmFrames.FormClose(Sender: TObject; var CloseAction: TCloseAction);
 begin
   frmMain.FramesMenuItem.Checked:=False;
   frmMain.SetFocus;
 end;

procedure TfrmFrames.FormCreate(Sender: TObject);
begin
  frmFrames.Top:=INI.ReadInteger('FRMFRAMES','TOP',frmFrames.Top);
  frmFrames.Left:=INI.ReadInteger('FRMFRAMES','LEFT',frmFrames.Left);
  frmFrames.Width:=INI.ReadInteger('FRMFRAMES','WIDTH',frmFrames.Width);
  frmFrames.Height:=INI.ReadInteger('FRMFRAMES','HEIGHT',frmFrames.Height);
end;

procedure TfrmFrames.FormDestroy(Sender: TObject);
begin
   INI.WriteInteger('FRMFRAMES','TOP',frmFrames.Top);
   INI.WriteInteger('FRMFRAMES','LEFT',frmFrames.Left);
   INI.WriteInteger('FRMFRAMES','WIDTH',frmFrames.Width);
   INI.WriteInteger('FRMFRAMES','HEIGHT',frmFrames.Height);
end;

end.

