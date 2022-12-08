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
unit ftools;

{$mode ObjFPC}{$H+}

interface

uses
  {$IFDEF DEBUG}LazLoggerBase,{$ENDIF} udraw,
  Classes, SysUtils, Forms, Controls, StdCtrls,
  ExtCtrls, Buttons, Dialogs;

type

  { TfrTools }

  TfrTools = class(TFrame)
    DrawToolsFlowPanel: TFlowPanel;
    sbCircle: TSpeedButton;
    sbEracer: TSpeedButton;
    sbFilledRect: TSpeedButton;
    sbLine: TSpeedButton;
    sbPen: TSpeedButton;
    sbPipette: TSpeedButton;
    sbRect: TSpeedButton;
    procedure sbPenClick(Sender: TObject);
   public
    constructor Create(TheOwner : TComponent);override;
    destructor Destroy;override;
  end;

implementation
uses uglobals, umain;
{$R *.lfm}

{ TfrTools }

procedure TfrTools.sbPenClick(Sender: TObject);
begin
  if not Assigned(FrameGrid) then Exit;

  if Assigned(DrawTool) then FreeAndNil(DrawTool);
  case (Sender as TSpeedButton).Tag of
 1:DrawTool:=TSPPen.Create;
 2:DrawTool:=TSPLine.Create;
 3:DrawTool:=TSPEraser.Create;
 4:begin
      DrawTool:=TSPPipette.Create;
 end;
 5:DrawTool:=TSPRect.Create;
 6:DrawTool:=TSPFilledRect.Create;
 7:DrawTool:=TSPCircle.Create
 else begin
      ShowMessage(rsThisToolWill);
      DrawTool:=TSPPen.Create;
  end;
 end;
  frmMain.StatusBar1.Panels[4].Text:=rsActiveTool+DrawTool.ToolName;
end;

constructor TfrTools.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  DrawTool:=TSPPen.Create;
 // frmMain.StatusBar1.Panels[4].Text:=rsActiveTool+DrawTool.ToolName;
end;

destructor TfrTools.Destroy;
begin
  if Assigned(DrawTool) then FreeAndNil(DrawTool);
  inherited Destroy;
end;

end.

