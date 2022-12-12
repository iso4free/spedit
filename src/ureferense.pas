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
unit ureferense;

{$mode ObjFPC}{$H+}

interface

uses
  {$IFDEF DEBUG}LazLoggerBase,{$ENDIF}
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtDlgs, ExtCtrls;

type

  { TfrmReferense }

  TfrmReferense = class(TForm)
    OpenPictureDialog1: TOpenPictureDialog;
    ReferenceImage: TImage;
    procedure FormClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private

  public

  end;

var
  frmReferense: TfrmReferense;

implementation

uses uglobals, umain;

{$R *.lfm}

{ TfrmReferense }

procedure TfrmReferense.FormClick(Sender: TObject);
begin
  //frmMain.HideWindows;
    if OpenPictureDialog1.Execute then begin
   ReferenceImage.Picture.Clear;
   ReferenceImage.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;
  //frmMain.ShowWindows;
end;

procedure TfrmReferense.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  frmMain.miReferense.Checked:=false;
  frmMain.SetFocus;
end;

procedure TfrmReferense.FormDestroy(Sender: TObject);
begin
  INI.WriteInteger('FRMREFERENSE','TOP',frmReferense.Top);
  INI.WriteInteger('FRMREFERENSE','LEFT',frmReferense.Left);
  INI.WriteInteger('FRMREFERENSE','WIDTH',frmReferense.Width);
  INI.WriteInteger('FRMREFERENSE','HEIGHT',frmReferense.Height);
end;

end.

