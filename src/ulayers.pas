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
unit ulayers;

{$mode ObjFPC}{$H+}

interface

uses
  {$IFDEF DEBUG}LazLoggerBase, BGRAImageList,{$ENDIF}
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, Grids, Types;

type

  { TfrmLayers }

  TfrmLayers = class(TForm)
    bbtnAddLayer: TBitBtn;
    bbtnCopyLayer: TBitBtn;
    bbtnDeleteLayer: TBitBtn;
    bbtnMergeLayers: TBitBtn;
    BGRAImageList1: TBGRAImageList;
    drwgrdLayers: TDrawGrid;
    LayersFlowPanel: TFlowPanel;
    LayersGroupBox: TGroupBox;
    procedure bbtnAddLayerClick(Sender: TObject);
    procedure drwgrdLayersDrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmLayers: TfrmLayers;

implementation

uses uglobals, umain;
{$R *.frm}

{ TfrmLayers }

procedure TfrmLayers.drwgrdLayersDrawCell(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
begin
  //todo: draw headers and layers data
  if aRow=0 then begin //draw header
    case aCol of
  0:
    end;
  end;

end;

procedure TfrmLayers.FormCreate(Sender: TObject);
begin
  drwgrdLayers.RowCount:=Layers.Count;
end;

procedure TfrmLayers.bbtnAddLayerClick(Sender: TObject);
var
  aLayerName: String;
begin
  aLayerName := InputBox('Layer name','Input new layer name:','');
  if (Trim(aLayerName)='') then aLayerName:=CheckLayerName('Layer');
  Layers[aLayerName]:=TLayer.Create(aLayerName,FrameGrid.FrameWidth,FrameGrid.FrameHeight);
  drwgrdLayers.RowCount:=Layers.Count;
end;

end.

