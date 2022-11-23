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
  {$IFDEF DEBUG}LazLoggerBase,{$ENDIF} BGRAImageList,
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, Grids, Types;

type

  { TfrmLayers }

  TfrmLayers = class(TForm)
    bbtnAddLayer: TBitBtn;
    bbtnCopyLayer: TBitBtn;
    bbtnDeleteLayer: TBitBtn;
    bbtnMergeLayers: TBitBtn;
    BGRAImageList24x24: TBGRAImageList;
    drwgrdLayers: TDrawGrid;
    LayersFlowPanel: TFlowPanel;
    LayersGroupBox: TGroupBox;
    procedure bbtnAddLayerClick(Sender: TObject);
    procedure bbtnDeleteLayerClick(Sender: TObject);
    procedure drwgrdLayersDrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure drwgrdLayersSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmLayers: TfrmLayers;

implementation

uses uglobals, umain;
{$R *.lfm}

{ TfrmLayers }

procedure TfrmLayers.drwgrdLayersDrawCell(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
var aKey : String;
begin
  if not Assigned(FrameGrid) then Exit;
  //todo: change draw headers and layers data from active frame
  if aRow<>0 then begin //draw header
    if aRow>Layers.Count then Exit;
    aKey:=Layers.Keys[aRow-1];
    case aCol of
  0:begin
      //draw layer visibility icon
      if Layers[aKey].Visible then BGRAImageList24x24.Draw(drwgrdLayers.Canvas,aRect.Left,aRect.Top,0)
         else BGRAImageList24x24.Draw(drwgrdLayers.Canvas,aRect.Left,aRect.Top,1);
    end;
  1:begin
      //draw layer protection icon
      if Layers[aKey].Locked then BGRAImageList24x24.Draw(drwgrdLayers.Canvas,aRect.Left,aRect.Top,2)
         else BGRAImageList24x24.Draw(drwgrdLayers.Canvas,aRect.Left,aRect.Top,3);
    end;
  2:begin
      //draw layer name
      if aKey=FrameGrid.ActiveLayer then drwgrdLayers.Canvas.Font.Color:=clRed
         else drwgrdLayers.Canvas.Font.Color:=clWindowText;
      drwgrdLayers.Canvas.TextRect(aRect,aRect.Left,aRect.Top,aKey);
    end;
  3:begin
      //draw layer image
      Layers[aKey].Drawable.Draw(drwgrdLayers.Canvas,aRect);
    end;
    end;
  end;

end;

procedure TfrmLayers.drwgrdLayersSelectCell(Sender: TObject; aCol,
  aRow: Integer; var CanSelect: Boolean);
var aKey : String;
begin
  if aRow=0 then Exit; //click on table header - do nothing
  aKey:=Layers.Keys[aRow-1];
  if aKey='' then Exit;
  case aCol of
0:begin //change layer visibility
     Layers[aKey].Visible:=not Layers[aKey].Visible;
    end;
1:begin
     Layers[aKey].Locked:=not Layers[aKey].Locked;
    end;
2,3:begin  //select active layer
     FrameGrid.ActiveLayer:=aKey;
    end;
  end;
  frmMain.Invalidate;
  frmMain.SetFocus;
end;

procedure TfrmLayers.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  INI.WriteInteger('FRMLAYERS','TOP',frmLayers.Top);
  INI.WriteInteger('FRMLAYERS','LEFT',frmLayers.Left);
  INI.WriteInteger('FRMLAYERS','WIDTH',frmLayers.Width);
  INI.WriteInteger('FRMLAYERS','HEIGHT',frmLayers.Height);
  frmMain.LayersToolVisibleMenuItem.Checked:=False;
  frmMain.SetFocus;
end;

procedure TfrmLayers.FormCreate(Sender: TObject);
begin
  frmLayers.Top:=INI.ReadInteger('FRMLAYERS','TOP',frmLayers.Top);
  frmLayers.Left:=INI.ReadInteger('FRMLAYERS','LEFT',frmLayers.Left);
  frmLayers.Width:=INI.ReadInteger('FRMLAYERS','WIDTH',frmLayers.Width);
  frmLayers.Height:=INI.ReadInteger('FRMLAYERS','HEIGHT',frmLayers.Height);
  //todo: after tests change to active frame layers count
  drwgrdLayers.RowCount:=Layers.Count+1;
end;

procedure TfrmLayers.bbtnAddLayerClick(Sender: TObject);
var
  aLayerName: String;
begin
  frmMain.HideWindows;
  aLayerName := InputBox(rsLayerName, rsInputNewLaye, 'Layer');
  if (Trim(aLayerName)='') then aLayerName:=CheckLayerName('Layer');
  Layers[aLayerName]:=TSPLayer.Create(aLayerName,FrameGrid.FrameWidth,FrameGrid.FrameHeight);
  drwgrdLayers.RowCount:=Layers.Count;
  FrameGrid.ActiveLayer:=aLayerName;
  Frames[FrameGrid.ActiveFrame].AddLayer(aLayerName);
  Layers[aLayerName].AddToFrame(FrameGrid.ActiveFrame);
  Layers[cINTERNALLAYERANDFRAME].Visible:=True;
  frmMain.ShowWindows;
  frmMain.SetFocus;
  frmMain.Invalidate;
end;

procedure TfrmLayers.bbtnDeleteLayerClick(Sender: TObject);
begin
  Layers.Remove(FrameGrid.ActiveLayer);
  Frames[FrameGrid.ActiveFrame].DeleteLayer(FrameGrid.ActiveLayer);
  FrameGrid.ActiveLayer:=cINTERNALLAYERANDFRAME;
end;

end.

