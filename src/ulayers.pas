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
    procedure bbtnCopyLayerClick(Sender: TObject);
    procedure bbtnDeleteLayerClick(Sender: TObject);
    procedure drwgrdLayersDblClick(Sender: TObject);
    procedure drwgrdLayersDrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure drwgrdLayersSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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
    cnt  : Integer;
begin
  if not Assigned(FrameGrid) then Exit;
  //todo: change draw headers and layers data from active frame
  cnt:=Frames[FrameGrid.ActiveFrame].LayersList.Count;
  if aRow<>0 then begin //draw header
    if aRow>cnt then Exit;
    aKey:=Frames[FrameGrid.ActiveFrame].LayersList.Strings[Cnt-aRow];
    if not LayerExists(aKey) then Exit;
    case aCol of
  0:begin
      //draw layer visibility icon
      if Layers[aKey].Visible then BGRAImageList24x24.Draw(drwgrdLayers.Canvas,aRect.Left,aRect.Top,0)
         else BGRAImageList24x24.Draw(drwgrdLayers.Canvas,aRect.Left,aRect.Top,1);
    end;
  1:begin
      //draw layer protection icon
      if Layers[aKey].Locked then BGRAImageList24x24.Draw(drwgrdLayers.Canvas,aRect.Left,aRect.Top,3)
         else BGRAImageList24x24.Draw(drwgrdLayers.Canvas,aRect.Left,aRect.Top,2);
    end;
  2:begin
      //draw layer name
      if aKey=FrameGrid.ActiveLayer then drwgrdLayers.Canvas.Font.Color:=clRed
         else drwgrdLayers.Canvas.Font.Color:=clWindowText;
      drwgrdLayers.Canvas.TextRect(aRect,aRect.Left,aRect.Top,aKey);
    end;
  3:begin
      //draw layer image
      Layers[aKey].Drawable.Draw(drwgrdLayers.Canvas,aRect,False);
    end;
    end;
  end;
  Invalidate;
end;

procedure TfrmLayers.drwgrdLayersSelectCell(Sender: TObject; aCol,
  aRow: Integer; var CanSelect: Boolean);
var aKey : String;
    cnt  : Integer;
begin
  if not Assigned(FrameGrid) then Exit;
  if aRow=0 then Exit; //click on table header - do nothing
  cnt:=Frames[FrameGrid.ActiveFrame].LayersList.Count;
  aKey:=Frames[FrameGrid.ActiveFrame].LayersList.Strings[Cnt-aRow];
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

procedure TfrmLayers.FormDestroy(Sender: TObject);
begin
  INI.WriteInteger('FRMLAYERS','TOP',frmLayers.Top);
  INI.WriteInteger('FRMLAYERS','LEFT',frmLayers.Left);
  INI.WriteInteger('FRMLAYERS','WIDTH',frmLayers.Width);
  INI.WriteInteger('FRMLAYERS','HEIGHT',frmLayers.Height);
end;

procedure TfrmLayers.bbtnAddLayerClick(Sender: TObject);
var
  aLayerName: String;
begin
  frmMain.HideWindows;
  aLayerName:=CheckLayerName('Layer'+IntToStr(Layers.Count-1));
  aLayerName := InputBox(rsLayerName, rsInputNewLaye, aLayerName);
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

procedure TfrmLayers.bbtnCopyLayerClick(Sender: TObject);
 var
   aName : String;
   aData : String;
begin
  aName:=rsCopyOf + FrameGrid.ActiveLayer;
  aData:=Layers[FrameGrid.ActiveLayer].ToBASE64String;
  Layers[aName]:=TSPLayer.Create(aName,aData);
  Frames[FrameGrid.ActiveFrame].AddLayer(aName);
  Layers[aName].AddToFrame(FrameGrid.ActiveFrame);
  FrameGrid.ActiveLayer:=aName;
  Invalidate;
end;

procedure TfrmLayers.bbtnDeleteLayerClick(Sender: TObject);
begin
  if FrameGrid.ActiveLayer=cINTERNALLAYERANDFRAME then begin
    ShowMessage(rsThisLayerCan2);
    Exit;
  end;
  UndoRedoManager.SaveState;
  Layers.Remove(FrameGrid.ActiveLayer);
  Frames[FrameGrid.ActiveFrame].DeleteLayer(FrameGrid.ActiveLayer);
  FrameGrid.ActiveLayer:=cINTERNALLAYERANDFRAME;
  Invalidate;
  frmMain.Invalidate;
end;

procedure TfrmLayers.drwgrdLayersDblClick(Sender: TObject);
var
  aName : String;
  aNewName : String;
begin
  //todo: rename layer
  aName:=FrameGrid.ActiveLayer;
  if aName=cINTERNALLAYERANDFRAME then begin
    ShowMessage(rsThisLayerCan);
    Exit;
  end;
  frmMain.HideWindows;
  aNewName:=InputBox(rsInputNewLaye,rsLayerName,aName);
  frmMain.ShowWindows;
  if aNewName=aName then Exit;
  Layers[aNewName]:=TSPLayer.Create(aNewName,Layers[aName].ToBASE64String);
  Layers[aNewName].AddToFrame(FrameGrid.ActiveFrame);
  Frames[FrameGrid.ActiveFrame].DeleteLayer(aName);
  Frames[FrameGrid.ActiveFrame].AddLayer(aNewName);
  Layers.Remove(aName);
  Invalidate;
end;

end.

