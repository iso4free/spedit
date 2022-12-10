{***************************************************************************}
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


program spedit;
{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  {$IFDEF DEBUG}
  LazLogger,
  {$ENDIF}
  Forms, Interfaces, sysutils, uglobals, umain,
  uframedlg, upreview, uabout, Controls;

{$R *.res}

begin
  {$IFDEF DEBUG}
  if FileExists(ChangeFileExt(Application.ExeName,'.log')) then DeleteFile(ChangeFileExt(Application.ExeName,'.log'));
  DebugLogger.ParamForLogFileName:='--debug-log';
  {$ENDIF}
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.DoubleBuffered:=adbTrue;
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.FormStyle:=fsNormal;
  Application.CreateForm(TfrmFrameDlg, frmFrameDlg);
  frmFrameDlg.FormStyle:=fsNormal;
  Application.CreateForm(TFrmPreview, FrmPreview);
  FrmPreview.FormStyle:=fsNormal;
  Application.Run;
end.

