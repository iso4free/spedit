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

unit umain;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF DEBUG}LazLoggerBase, {$ENDIF} LResources,
  uglobals, Classes, SysUtils, Forms, Controls,
  Graphics, Types, Dialogs, Menus, ComCtrls, ExtCtrls, Buttons, ActnList, Grids,
  JSONPropStorage, ExtDlgs, StdCtrls, StdActns, LCLType, Spin,
  HexaColorPicker, mbColorPalette,
  BGRAImageList, BGRAGraphicControl, BGRABitmapTypes, BGRABitmap, BCTypes;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    acImportFrame: TAction;
    actAddLayer: TAction;
    actDeleteLayer: TAction;
    actCopyLayer: TAction;
    actFramesToggle: TAction;
    actFrameExportPNG: TAction;
    actFrameResize: TAction;
    actDither: TAction;
    actNotImplemented: TAction;
    actSettings: TAction;
    actLoadPresets: TAction;
    actReferenceToggle: TAction;
    actPaletteToggle: TAction;
    actPaletteImport: TAction;
    actPaletteSave: TAction;
    actPaletteLoad: TAction;
    actPaletteReset: TAction;
    actMergeLayers: TAction;
    actLanguageSelect: TAction;
    actRedo: TAction;
    actLayersToggle: TAction;
    actZoomReset: TAction;
    actZoomOut: TAction;
    actToggleFullScreen: TAction;
    actZoomIn: TAction;
    actNewFrame: TAction;
    ActionList1: TActionList;
    bbtnAddLayer: TBitBtn;
    bbtnCopyLayer: TBitBtn;
    bbtnDeleteLayer: TBitBtn;
    bbtnMergeLayers: TBitBtn;
    bbtnSwapColors: TBitBtn;
    BgColor: TBGRAGraphicControl;
    BGRAImageList24x24: TBGRAImageList;
    bbtnShowLayers: TBitBtn;
    bbtnShowPalette: TBitBtn;
    bbtnTogglePreview: TBitBtn;
    bbtnToggleFrames: TBitBtn;
    bbtnImportFrame: TBitBtn;
    bbtnNewFrame: TBitBtn;
    bbtnResize: TBitBtn;
    ButtonsImageList: TBGRAImageList;
    ColorDialog1: TColorDialog;
    cbPalettePresets: TComboBox;
    drwgrdLayers: TDrawGrid;
    actUndo: TEditUndo;
    FgColor: TBGRAGraphicControl;
    actExit: TFileExit;
    FramePreview: TPaintBox;
    gbPreview: TGroupBox;
    HexaColorPicker1: THexaColorPicker;
    JSONPropStorage1: TJSONPropStorage;
    lbpPalettePresrts: TLabel;
    lblPenSize: TLabel;
    LayersFlowPanel: TFlowPanel;
    LayersGroupBox: TGroupBox;
    mbPaletteGrid: TmbColorPalette;
    mbColorPalettePreset: TmbColorPalette;
    miLoadPresets: TMenuItem;
    miFrameDither: TMenuItem;
    miFrameResize: TMenuItem;
    miFrame: TMenuItem;
    miExportFramePNG: TMenuItem;
    miExport: TMenuItem;
    miMergeLayers: TMenuItem;
    miCopyLayer: TMenuItem;
    miDeleteLayer: TMenuItem;
    miAddLayer: TMenuItem;
    OpenPaletteDialog: TOpenDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    opndlgLocalization: TOpenDialog;
    pnlColors: TPanel;
    pnlPalette: TPanel;
    pbFrameDraw: TPaintBox;
    pnlTools: TFlowPanel;
    MainMenu1: TMainMenu;
    miAbout: TMenuItem;
    miDrawingTools: TMenuItem;
    miEdit: TMenuItem;
    miFileExit: TMenuItem;
    miFileMenu: TMenuItem;
    miFileNewPoject: TMenuItem;
    miFileSaveProject: TMenuItem;
    miFrames: TMenuItem;
    miFullScreen: TMenuItem;
    miHelp: TMenuItem;
    miImportSpritesheet: TMenuItem;
    miLanguage: TMenuItem;
    miLayers: TMenuItem;
    miLayersPanel: TMenuItem;
    miNewLibrary: TMenuItem;
    miPalette: TMenuItem;
    miPaletteClear: TMenuItem;
    miPaletteImportFromFile: TMenuItem;
    miPaletteLoad: TMenuItem;
    miPaletteSaveToFile: TMenuItem;
    miPreview: TMenuItem;
    miRedo: TMenuItem;
    miReferense: TMenuItem;
    miSaveLibrary: TMenuItem;
    miSaveProjectAs: TMenuItem;
    miSelectLibrary: TMenuItem;
    miSettings: TMenuItem;
    miSprite: TMenuItem;
    miTioolPanels: TMenuItem;
    miUndo: TMenuItem;
    miView: TMenuItem;
    miZoomIn: TMenuItem;
    miZoomOut: TMenuItem;
    miZoomReset: TMenuItem;
    pnlFrames: TPanel;
    pnlEditor: TPanel;
    pnlLayers: TPanel;
    SavePaletteDialog: TSaveDialog;
    sbCircle: TSpeedButton;
    sbEracer: TSpeedButton;
    sbFilledRect: TSpeedButton;
    sbLine: TSpeedButton;
    sbPen: TSpeedButton;
    sbPipette: TSpeedButton;
    sbRect: TSpeedButton;
    sbCurrentPalette: TScrollBox;
    sbPresetPalette: TScrollBox;
    sdExportFrameSaveDialog: TSaveDialog;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    Separator1: TMenuItem;
    Separator2: TMenuItem;
    Separator3: TMenuItem;
    Separator4: TMenuItem;
    Separator5: TMenuItem;
    Separator6: TMenuItem;
    Separator7: TMenuItem;
    sbFloodFill: TSpeedButton;
    Separator8: TMenuItem;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    StatusBar1: TStatusBar;
    trkbrPenSize: TSpinEdit;
    procedure actDitherExecute(Sender: TObject);
    procedure actFrameExportPNGExecute(Sender: TObject);
    procedure actFrameResizeExecute(Sender: TObject);
    procedure actFramesToggleExecute(Sender: TObject);
    procedure actImportFrameExecute(Sender: TObject);
    procedure actAddLayerExecute(Sender: TObject);
    procedure actCopyLayerExecute(Sender: TObject);
    procedure actDeleteLayerExecute(Sender: TObject);
    procedure actLanguageSelectExecute(Sender: TObject);
    procedure actLayersToggleExecute(Sender: TObject);
    procedure actLoadPresetsExecute(Sender: TObject);
    procedure actMergeLayersExecute(Sender: TObject);
    procedure actNewFrameExecute(Sender: TObject);
    procedure actNotImplementedExecute(Sender: TObject);
    procedure actPaletteImportExecute(Sender: TObject);
    procedure actPaletteLoadExecute(Sender: TObject);
    procedure actPaletteResetExecute(Sender: TObject);
    procedure actPaletteSaveExecute(Sender: TObject);
    procedure actPaletteToggleExecute(Sender: TObject);
    procedure actRedoExecute(Sender: TObject);
    procedure actReferenceToggleExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure actToggleFullScreenExecute(Sender: TObject);
    procedure actZoomInExecute(Sender: TObject);
    procedure actZoomOutExecute(Sender: TObject);
    procedure actZoomResetExecute(Sender: TObject);
    procedure bbtnAddLayerClick(Sender: TObject);
    procedure bbtnCopyLayerClick(Sender: TObject);
    procedure bbtnDeleteLayerClick(Sender: TObject);
    procedure bbtnMergeLayersClick(Sender: TObject);
    procedure bbtnNewFrameClick(Sender: TObject);
    procedure bbtnShowLayersClick(Sender: TObject);
    procedure bbtnShowPaletteClick(Sender: TObject);
    procedure bbtnSwapColorsClick(Sender: TObject);
    procedure bbtnImportFrameClick(Sender: TObject);
    procedure bbtnToggleFramesClick(Sender: TObject);
    procedure bbtnTogglePreviewClick(Sender: TObject);
    procedure bbtnResizeClick(Sender: TObject);
    procedure cbPalettePresetsChange(Sender: TObject);
    procedure cbPalettePresetsDrawItem(Control: TWinControl; Index: Integer;
      ARect: TRect; State: TOwnerDrawState);
    procedure drwgrdLayersDrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure drwgrdLayersSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure actUndoExecute(Sender: TObject);
    procedure FgColorClick(Sender: TObject);
    procedure FgColorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FgColorPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of string);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FramePreviewClick(Sender: TObject);
    procedure FramePreviewPaint(Sender: TObject);
    procedure HexaColorPicker1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mbColorPalettePresetCellClick(Button: TMouseButton;
      Shift: TShiftState; Index: integer; AColor: TColor; var DontCheck: boolean
      );
    procedure miAboutClick(Sender: TObject);
    procedure pbFrameDrawMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pbFrameDrawMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pbFrameDrawMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pbFrameDrawMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure pbFrameDrawMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure pbFrameDrawPaint(Sender: TObject);
    procedure sbPenClick(Sender: TObject);
    procedure trkbrPenSizeChange(Sender: TObject);
  private
   fDrawGridMode : TDrawGridMode;
   dx,dy : Integer;             //offset to move grid
   startx,starty : Integer;     //start position to move
   procedure LoadPresets(aDir : String);
   procedure SetSelectedColor(const Button: TMouseButton; aColor : TBGRAPixel);
   procedure PaletteChange; //added colors to current palette
   procedure CreateCursors; //create custom cursors for drawing
   procedure ImportFrame(aFilename : TFilename);
  public
  end;

var
  frmMain: TfrmMain;

implementation

uses udraw, uabout, uframedlg, uresizedlg, ureferense, usettings;
{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.actImportFrameExecute(Sender: TObject);
begin
 if OpenPictureDialog1.Execute then begin
   ImportFrame(OpenPictureDialog1.Filename);
 end;
end;

procedure TfrmMain.actFramesToggleExecute(Sender: TObject);
begin
    pnlFrames.Visible:=not pnlFrames.Visible;
    actFramesToggle.Checked:=pnlFrames.Visible;
end;

procedure TfrmMain.actFrameExportPNGExecute(Sender: TObject);
begin
 sdExportFrameSaveDialog.InitialDir:=GetUserDir;
 sdExportFrameSaveDialog.FileName:=FrameGrid.ActiveFrame;
 if sdExportFrameSaveDialog.Execute then begin
   //save current frame to PNG file by default to user dir and with frame name
   FrameGrid.ExpotPng(sdExportFrameSaveDialog.FileName);
 end;
end;

procedure TfrmMain.actDitherExecute(Sender: TObject);
var
  i: Integer;
begin
 //dither all layers
 for i:= 0 to Frames[FrameGrid.ActiveFrame].LayersList.Count-1 do begin
  {$IFDEF DEBUG}
  DebugLn('In: actDitherExecute() layer: ',Frames[FrameGrid.ActiveFrame].LayersList.Strings[i]);
  {$ENDIF}
  UndoRedoManager.SaveState;
  DitherImage(Layers[Frames[FrameGrid.ActiveFrame].LayersList.Strings[i]].Drawable,Presets[cbPalettePresets.Text].Palette,200);
  //todo: fix undo enabled
  actUndo.Enabled:=True;//UndoRedoManager.CanUndo;
 end;
 pbFrameDraw.Invalidate;
 FramePreview.Invalidate;
 PaletteChange;
end;

procedure TfrmMain.actFrameResizeExecute(Sender: TObject);
begin
 if not Assigned (FrameGrid) then Exit;
  frmResize.CheckSettings;
  frmResize.ShowModal;
  if frmResize.ModalResult=mrOK then begin
    FrameGrid.Resize(frmResize.spnWidth.Value,frmResize.spnHeight.Value,frmResize.cbStretch.Checked);
    pbFrameDraw.Invalidate;
  end;
end;

procedure TfrmMain.actAddLayerExecute(Sender: TObject);
var
  aLayerName: String;
begin
  aLayerName:=CheckLayerName('Layer'+IntToStr(Layers.Count-1));
  aLayerName := InputBox(rsLayerName, rsInputNewLaye, aLayerName);
  Layers[aLayerName]:=TSPLayer.Create(aLayerName,FrameGrid.FrameWidth,FrameGrid.FrameHeight);
  drwgrdLayers.RowCount:=Layers.Count;
  FrameGrid.ActiveLayer:=aLayerName;
  Frames[FrameGrid.ActiveFrame].AddLayer(aLayerName);
  Layers[aLayerName].AddToFrame(FrameGrid.ActiveFrame);
  Layers[cINTERNALLAYERANDFRAME].Visible:=True;
end;

procedure TfrmMain.actCopyLayerExecute(Sender: TObject);
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
end;

procedure TfrmMain.actDeleteLayerExecute(Sender: TObject);
begin
  if FrameGrid.ActiveLayer=cINTERNALLAYERANDFRAME then begin
    ShowMessage(rsThisLayerCan2);
    Exit;
  end;
  UndoRedoManager.SaveState;
  Layers.Remove(FrameGrid.ActiveLayer);
  Frames[FrameGrid.ActiveFrame].DeleteLayer(FrameGrid.ActiveLayer);
  FrameGrid.ActiveLayer:=cINTERNALLAYERANDFRAME;
end;

procedure TfrmMain.actLanguageSelectExecute(Sender: TObject);
begin
 opndlgLocalization.InitialDir:=INI.ReadString('INTERFACE','LOCALES','');
 if opndlgLocalization.Execute then begin
   INI.WriteString('INTERFACE','LOCALES',ExtractFilePath(opndlgLocalization.FileName));
   INI.WriteString('INTERFACE','L10n file',opndlgLocalization.FileName);
   INI.WriteString('INTERFACE','LANGUAGE',DetectPOLanguage(opndlgLocalization.FileName));
 end;
end;

procedure TfrmMain.actLayersToggleExecute(Sender: TObject);
begin
  pnlLayers.Visible:=not pnlLayers.Visible;
  actLayersToggle.Checked:=pnlLayers.Visible;
end;

procedure TfrmMain.actLoadPresetsExecute(Sender: TObject);
begin
  SelectDirectoryDialog1.InitialDir:=INI.ReadString('PRESETS','PALETTES','');
  if SelectDirectoryDialog1.Execute then begin
   LoadPresets(SelectDirectoryDialog1.FileName);
   INI.WriteString('PRESETS','PALETTES',SelectDirectoryDialog1.FileName);
  end;
end;

procedure TfrmMain.actMergeLayersExecute(Sender: TObject);
begin
  ShowMessage(rsSorry);
end;

procedure TfrmMain.actNewFrameExecute(Sender: TObject);
var
  i: Integer;
begin
  //show dialog to create new frame with default parameters
  if Assigned(FrameGrid) then begin
   frmFrameDlg.spnedtHeight.Value:=FrameGrid.FrameHeight;
   frmFrameDlg.spnedtWidth.Value:=FrameGrid.FrameWidth;
   frmFrameDlg.edtFrameName.Text:=FrameGrid.ActiveFrame;
  end;
  frmFrameDlg.isOk:=False;
  frmFrameDlg.ShowModal;
  if frmFrameDlg.isOk then begin
   FreeAndNil(FrameGrid);
   FrameGrid:=TFrameGrid.Create(frmFrameDlg.spnedtWidth.Value,frmFrameDlg.spnedtHeight.Value,frmFrameDlg.spnedtCellSize.Value);
   FrameGrid.Offset:=Point(0,0);
   dx:=0;
   dy:=0;
   FramePreview.Width:=FrameGrid.FrameWidth;
   FramePreview.Height:=FrameGrid.FrameHeight;
   Frames[frmFrameDlg.edtFrameName.Text]:=TSPFrame.Create(frmFrameDlg.edtFrameName.Text,
                                                          FramePreview.Width,
                                                          FramePreview.Height);
   Frames[frmFrameDlg.edtFrameName.Text].AddLayer(cINTERNALLAYERANDFRAME);
   Layers[cINTERNALLAYERANDFRAME].AddToFrame(frmFrameDlg.edtFrameName.Text);
   //todo: copy all layers to new frame if option checked
   for i:=0 to Layers.Count-1 do Layers.Data[i].Resize(FrameGrid.FrameWidth,FrameGrid.FrameHeight);
   FrameGrid.ActiveFrame:=frmFrameDlg.edtFrameName.Text;
   FrameGrid.ActiveLayer:=cINTERNALLAYERANDFRAME;
   trkbrPenSize.MaxValue:=(FrameGrid.FrameWidth+FrameGrid.FrameHeight) div 4;
   Palette.Clear;
   mbPaletteGrid.Colors.Clear;
   pbFrameDraw.Invalidate;
  end;
end;

procedure TfrmMain.actNotImplementedExecute(Sender: TObject);
begin
  ShowMessage(rsSorry);
end;

procedure TfrmMain.actPaletteImportExecute(Sender: TObject);
var
  aPal : TPalette;
  i: Integer;
begin
  if OpenPictureDialog1.Execute then begin
   aPal.LoadFromImage(OpenPictureDialog1.FileName);
   Palette.Clear;
   for i:= 0 to aPal.Count-1 do Palette.AddColor(aPal.Color[i]);
   PaletteChange;
  end;
end;

procedure TfrmMain.actPaletteLoadExecute(Sender: TObject);
begin
  if OpenPaletteDialog.Execute then begin
    Palette.LoadFromFile(OpenPaletteDialog.FileName);
  end;
end;

procedure TfrmMain.actPaletteResetExecute(Sender: TObject);
var
  i: Integer;
begin
  if MessageDlg(rsWarning, rsPaletteWillB, mtWarning, mbYesNo, '')=mrYes
    then begin
     Palette.Clear;
     if Layers.Count>0 then
     for i:= 0 to Layers.Count-1 do
      Palette.AddColors(Layers[Layers.Keys[i]].Drawable);
    end;
end;

procedure TfrmMain.actPaletteSaveExecute(Sender: TObject);
begin
  if SavePaletteDialog.Execute then begin
    Palette.SaveToFile(SavePaletteDialog.FileName);
  end;
end;

procedure TfrmMain.actPaletteToggleExecute(Sender: TObject);
begin
  pnlPalette.Visible:=not pnlPalette.Visible;
end;

procedure TfrmMain.actRedoExecute(Sender: TObject);
begin
 UndoRedoManager.Redo;
 pbFrameDraw.Invalidate;
end;

procedure TfrmMain.actReferenceToggleExecute(Sender: TObject);
begin
 if not Assigned(frmReferense) then frmReferense:=TfrmReferense.Create(nil);
 frmReferense.Visible:=not frmReferense.Visible;
 actReferenceToggle.Checked:=frmReferense.Visible;
end;

procedure TfrmMain.actSettingsExecute(Sender: TObject);
begin
  frmSettings.ShowModal;
end;

procedure TfrmMain.actToggleFullScreenExecute(Sender: TObject);
begin
  if WindowState<>wsFullScreen then WindowState:=wsFullScreen
     else WindowState:=wsMaximized;
  actToggleFullScreen.Checked:=WindowState = wsFullScreen;
  //try ZEN mode
  if actToggleFullScreen.Checked then begin
   pnlFrames.Visible := false;
   pnlPalette.Visible := false;
   pnlLayers.Visible:= false;
   pnlEditor.Visible:=false;
   pnlTools.Visible:=false;
  end else begin
    //back to normal mode
   pnlFrames.Visible := actFramesToggle.Checked;
   pnlPalette.Visible := actPaletteToggle.Checked;
   pnlLayers.Visible:= actLayersToggle.Checked;
   pnlEditor.Visible:=true;
   pnlTools.Visible:=true;
  end;
end;

procedure TfrmMain.actZoomInExecute(Sender: TObject);
begin
  if not Assigned(FrameGrid) then Exit;
  if FrameGrid.FrameZoom<20 then FrameGrid.FrameZoom:=FrameGrid.FrameZoom+1;
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.actZoomOutExecute(Sender: TObject);
begin
  if not Assigned(FrameGrid) then Exit;
  if FrameGrid.FrameZoom>0 then FrameGrid.FrameZoom:=FrameGrid.FrameZoom-1;
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.actZoomResetExecute(Sender: TObject);
begin
  if not Assigned(FrameGrid) then Exit;
  FrameGrid.FrameZoom:=0;
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.bbtnAddLayerClick(Sender: TObject);
begin
  actAddLayerExecute(Sender);
end;

procedure TfrmMain.bbtnCopyLayerClick(Sender: TObject);
begin
  actCopyLayerExecute(Sender);
end;

procedure TfrmMain.bbtnDeleteLayerClick(Sender: TObject);
begin
  actDeleteLayerExecute(Sender);
end;

procedure TfrmMain.bbtnMergeLayersClick(Sender: TObject);
begin
  actMergeLayersExecute(Sender);
end;

procedure TfrmMain.bbtnNewFrameClick(Sender: TObject);
begin
  actNewFrameExecute(Sender);
end;

procedure TfrmMain.bbtnShowLayersClick(Sender: TObject);
begin
  actLayersToggleExecute(Sender);
end;

procedure TfrmMain.bbtnShowPaletteClick(Sender: TObject);
begin
  actPaletteToggleExecute(Sender);
end;

procedure TfrmMain.bbtnSwapColorsClick(Sender: TObject);
var cl : TBGRAPixel;
begin
   cl := spclBackColor;
   spclBackColor:=spclForeColor;
   spclForeColor:=cl;
end;

procedure TfrmMain.bbtnImportFrameClick(Sender: TObject);
begin
  actImportFrameExecute(Sender);
end;

procedure TfrmMain.bbtnToggleFramesClick(Sender: TObject);
begin
  actFramesToggleExecute(Sender);
end;

procedure TfrmMain.bbtnTogglePreviewClick(Sender: TObject);
begin
  actReferenceToggleExecute(Sender);
end;

procedure TfrmMain.bbtnResizeClick(Sender: TObject);
begin
  actFrameResizeExecute(Sender);
end;

procedure TfrmMain.cbPalettePresetsChange(Sender: TObject);
var
  i: Integer;
begin
  mbColorPalettePreset.Colors.Clear;
  for i:=0 to Presets[cbPalettePresets.Text].Palette.Count-1 do
    mbColorPalettePreset.Colors.Add(ColorToString(Presets[cbPalettePresets.Text].Palette.Color[i]));
  mbColorPalettePreset.Invalidate;
end;

procedure TfrmMain.cbPalettePresetsDrawItem(Control: TWinControl;
  Index: Integer; ARect: TRect; State: TOwnerDrawState);
const
  MaxColorCount = 64;
var
  Count, I: Integer;
  aColor: TBGRAPixel;
  OldColor: TColor;
  BoxWidth : Integer;
begin
  TComboBox(Control).Canvas.FillRect(ARect);

  OldColor := TComboBox(Control).Canvas.Brush.Color;
  Count := Presets[TComboBox(Control).Items[Index]].Palette.Count;
  //if Count>MaxColorCount then Count:=MaxColorCount;
  if (Count<=(ARect.Width-2))  then   begin

    BoxWidth:=(ARect.Width-2) div Count;
  end
  else BoxWidth:=1 ;
  for i := 0 to Count - 1 do
  begin
    aColor := Presets[TComboBox(Control).Items[Index]].Palette.Color[i];
    TComboBox(Control).Canvas.Brush.Color := aColor;
    TComboBox(Control).Canvas.FillRect(
      ARect.Left + I * BoxWidth + 2,
      ARect.Top + 1,
      ARect.Right-1{ + (I + 1) * (MaxColorCount div Count) + 2},
      ARect.Bottom - 1
    );
  end;

  TComboBox(Control).Canvas.Brush.Color := OldColor;
  //ARect.Left := ARect.Left + MaxColorCount + 2;
  TComboBox(Control).Canvas.TextOut(ARect.Left, ARect.Top, TComboBox(Control).Items[Index]);

end;

procedure TfrmMain.drwgrdLayersDrawCell(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
var aKey : String;
    cnt  : Integer;
begin
  if not Assigned(FrameGrid) then Exit;
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
end;

procedure TfrmMain.drwgrdLayersSelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);
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
end;

procedure TfrmMain.actUndoExecute(Sender: TObject);
begin
 UndoRedoManager.Undo;
 pbFrameDraw.Invalidate;
end;

procedure TfrmMain.FgColorClick(Sender: TObject);
begin
 pnlPalette.Top:=(Sender as TControl).Top;
 pnlPalette.Left:=(Sender as TControl).Left-pnlPalette.Width;
 pnlPalette.Visible:=True;
end;

procedure TfrmMain.FgColorMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 case Button of
 mbLeft: begin
          if ColorDialog1.Execute then begin
             if (Sender as TBGRAGraphicControl).Tag=1 then spclBackColor:=ColorDialog1.Color
             else spclForeColor:=ColorDialog1.Color;
             Palette.AddColor(ColorDialog1.Color);
             ToolOptions.Color:=ColorDialog1.Color;
             frmMain.StatusBar1.Panels[0].Text:=rsColors+IntToStr(Palette.Count);
             FgColor.Invalidate;
             //PaletteGrid.RenderAndDrawControl;
          end;
         end;
 mbRight:begin
          if (Sender as TBGRAGraphicControl).Tag=1 then spclBackColor:=BGRAPixelTransparent
             else spclForeColor:=BGRAPixelTransparent;
            ToolOptions.Color:=BGRAPixelTransparent;
            BgColor.Invalidate;
 end;
end;
end;

procedure TfrmMain.FgColorPaint(Sender: TObject);
var cl : TBGRAPixel;
begin
  if (Sender as TBGRAGraphicControl).Tag = 1 then cl := spclBackColor
    else cl:=spclForeColor;
  if cl=BGRAPixelTransparent then begin
   (Sender as TBGRAGraphicControl).Bitmap.DrawCheckers(Rect(2,2,(Sender as TBGRAGraphicControl).Width-2,(Sender as TBGRAGraphicControl).Height-2),
                                              ColorToBGRA($BFBFBF),ColorToBGRA($FFFFFF),4,4);
   (Sender as TBGRAGraphicControl).Bitmap.Rectangle(Rect(2,2,(Sender as TBGRAGraphicControl).Width-2,(Sender as TBGRAGraphicControl).Height-2),ColorToBGRA(clBlackOpaque));
  end
    else (Sender as TBGRAGraphicControl).Bitmap.FillRect(Rect(2,2,(Sender as TBGRAGraphicControl).Width-2,(Sender as TBGRAGraphicControl).Height-2),ColorToBGRA(cl));
  frmMain.StatusBar1.Panels[1].Text:=rsFG+IntToHex(spclForeColor)+rsBG+
    IntToHex(spclBackColor);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
   JSONProp : TFilename;
   i: Integer;
begin
   JSONProp:=UserSettingsPath+'spedit.json';
   JSONPropStorage1.JSONFileName:=JSONProp;
   {$IFDEF DEBUG}
   DebugLn(DateTimeToStr(Now()),' In: frmMain.Create() JSONProp=',JSONProp);
   {$ENDIF}

   DetectPOLanguage(INI.ReadString('INTERFACE','L10n file',''));
   //if checked create and  show  splashscreen
    if INI.ReadBool('INTERFACE', 'SHOWSPLASH', true) then begin
      frmAbout:= TfrmAbout.Create(Application);
      frmAbout.Show;
    end;

   //default draw tool - pen
   DrawTool:=TSPPen.Create;
   StatusBar1.Panels[4].Text:=rsActiveTool+DrawTool.ToolName;
   JSONPropStorage1.Restore;
   //palette preset load if directory selected
   if INI.ReadString('PRESETS','PALETTES','')<>'' then LoadPresets(INI.ReadString('PRESETS','PALETTES',''));
   Palette.Clear;
   CreateCursors;
   pbFrameDraw.Cursor:=1;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
     JSONPropStorage1.Save;
     FreeAndNil(DrawTool);
     if Assigned(frmAbout) then FreeAndNil(frmAbout);
end;

procedure TfrmMain.FormDropFiles(Sender: TObject;
  const FileNames: array of string);
begin
 {$IFDEF DEBUG}
  DebugLn('In: FormDropFiles() Filenames[0]='+FileNames[0]);
 {$ENDIF}
  ImportFrame(FileNames[0]);
end;

procedure TfrmMain.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState
  );
var
   aPt : TPoint;
begin
     if not Assigned(FrameGrid) then Exit;
     aPt:=FrameGrid.Offset;
     if ssShift in Shift then begin
      case Key of
      //10 px grid shift to selected direction
    VK_LEFT: begin
         FrameGrid.Offset.SetLocation(aPt.X-10,aPt.Y);
      end;
    VK_RIGHT: begin
         FrameGrid.Offset.SetLocation(aPt.X+10,aPt.Y);
      end;
    VK_UP: begin
         FrameGrid.Offset.SetLocation(aPt.X,aPt.Y-10);
      end;
    VK_DOWN: begin
          FrameGrid.Offset.SetLocation(aPt.X,aPt.Y+10);
      end;
    VK_R: begin
       //Shift+R filled rectangle tool
       sbFilledRect.Click;
     end;
    //Shift+NumPlus increase pen size
    VK_ADD: begin
       trkbrPenSize.Value:=trkbrPenSize.Value+1;
       trkbrPenSizeChange(Sender);
     end;
    //Shift+NumMinus decrease pen size
    VK_SUBTRACT: begin
       trkbrPenSize.Value:=trkbrPenSize.Value-1;
       trkbrPenSizeChange(Sender);
     end;
    end; //case

    end else//ssShift
     if Shift=[] then begin
      case Key of
    VK_P: begin
       //P key Pen tool
        sbPen.Click;
      end;
    VK_L: begin
       //L key Line tool
        sbLine.Click;
      end;
    VK_R:begin
       //R key Rectangle tool
        sbRect.Click;
      end;
    VK_C: begin
       //C key Cirkle tool
        sbCircle.Click;
      end;
    VK_F:begin
       //F key Flood fill tool
        sbFloodFill.Click;
      end;
    VK_E: begin
       //E key Eraser tool
        sbEracer.Click;
      end;
    VK_O:begin
       //O key Pipette tool (color picker)
        sbPenClick(sbPipette);
      end;
    VK_X:begin
       //X key Swap colors
        bbtnSwapColorsClick(Sender);
      end;
      end;
     end;
    pbFrameDraw.SetBounds(0,0,
     FrameGrid.Offset.X+(FrameGrid.FrameWidth*(FrameGrid.GridSize+FrameGrid.FrameZoom)),
     FrameGrid.Offset.Y+(FrameGrid.FrameHeight*(FrameGrid.GridSize+FrameGrid.FrameZoom)));
    pbFrameDraw.Invalidate;
end;

procedure TfrmMain.FramePreviewClick(Sender: TObject);
begin
  actFrameExportPNGExecute(Sender);
end;

procedure TfrmMain.FramePreviewPaint(Sender: TObject);
begin
 if Assigned(FrameGrid) then
  FrameGrid.RenderPicture(FramePreview.Canvas);
end;

procedure TfrmMain.HexaColorPicker1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ssCtrl in Shift then SetSelectedColor(mbRight,HexaColorPicker1.SelectedColor)
   else SetSelectedColor(Button,HexaColorPicker1.SelectedColor);
  Palette.AddColor(HexaColorPicker1.SelectedColor);
end;

procedure TfrmMain.mbColorPalettePresetCellClick(Button: TMouseButton;
  Shift: TShiftState; Index: integer; AColor: TColor; var DontCheck: boolean);
begin
 if ssCtrl in Shift then SetSelectedColor(mbRight,AColor)
  else SetSelectedColor(Button,AColor);
end;

procedure TfrmMain.miAboutClick(Sender: TObject);
begin
     if not Assigned(frmAbout) then frmAbout:= TfrmAbout.Create(Application);
     frmAbout.ShowModal;
     FreeAndNil(frmAbout);
end;

procedure TfrmMain.PaletteChange;
var
  i: Integer;
begin
 mbPaletteGrid.Colors.Clear;
  for i:=0 to Palette.Count-1 do mbPaletteGrid.Colors.Add(ColorToString(Palette.Color[i].ToColor));
end;

procedure TfrmMain.CreateCursors;
 var
   aCur : TCursorImage;
   i: Integer;
begin
   //create cursors from tool buttons images
   for i:= 1 to 8 do begin
    aCur:=TCursorImage.Create;
    aCur.LoadFromLazarusResource(IntToStr(i));
    aCur.HotSpot.Create(0,15);
    Screen.Cursors[i]:=aCur.ReleaseHandle;
    aCur.Free;
   end;
end;

procedure TfrmMain.ImportFrame(aFilename: TFilename);
 var
   aPal : TPalette;
   i: Integer;
begin
 //todo: check file type before import
  FreeAndNil(FrameGrid);
  FrameGrid:=TFrameGrid.Create(aFilename,INI.ReadInteger('FRAMEDLG','CELL SIZE',10));
  FrameGrid.Offset:=Point(0,0);
  dx:=0;
  dy:=0;
  FramePreview.Width:=FrameGrid.FrameWidth;
  FramePreview.Height:=FrameGrid.FrameHeight;
  trkbrPenSize.MaxValue:=(FrameGrid.FrameWidth+FrameGrid.FrameHeight) div 4;
  Palette.Clear;
  aPal.LoadFromImage(aFilename);
  for i:=0 to aPal.Count-1 do Palette.AddColor(aPal.Color[i]);
  mbPaletteGrid.Colors.Clear;
  PaletteChange;
  drwgrdLayers.Invalidate;
end;

procedure TfrmMain.pbFrameDrawMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var p : TPoint;
begin
 if not Assigned(FrameGrid) then Exit;
 //if tool not pipette  Ctrl+mbLeft works like color picker
 if (DrawTool.ToolName<>rsPipette) and (Button=mbLeft) and (ssCtrl in Shift) then begin
   p:=FrameGrid.Coords(x,y);
   spclForeColor:=Layers[FrameGrid.ActiveLayer].Drawable.GetPixel(p.X,p.Y);
   FgColor.Invalidate;
 end else
 case Button of
   mbLeft,mbRight:begin
    if Layers[FrameGrid.ActiveLayer].Locked then begin
     ShowMessage(Format(rsLayerSIsLock, [FrameGrid.ActiveLayer]))
    end;
    if (FrameGrid.HasCoords(Point(x,y))) then begin
     fDrawGridMode:=dgmDraw;
     p:=FrameGrid.Coords(x,y);
      ToolOptions.PenSize:=trkbrPenSize.Value;
      if Button=mbLeft then
         DrawTool.StartDraw(p.X,p.Y,Shift,Button, spclForeColor)
      else if Button=mbRight then
         DrawTool.StartDraw(p.X,p.Y,Shift,Button,spclBackColor);
    end;
   end;

   mbMiddle: begin   //start grid drag
     fDrawGridMode:=dgmMove;
     dx:=0;
     dy:=0;
     startx:=x;
     starty:=y;
   end;
 end;
 pbFrameDraw.Invalidate;
 drwgrdLayers.Invalidate;
end;

procedure TfrmMain.pbFrameDrawMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var p : TPoint;
begin
if not Assigned(FrameGrid) then Exit;
FrameGrid.CellCursor.Coords:=FrameGrid.Coords(x,y);
      StatusBar1.Panels[3].Text:='x='+IntToStr(FrameGrid.CellCursor.X)+'/y='+IntToStr(FrameGrid.CellCursor.y);
 if fDrawGridMode=dgmMove then begin //move grid inside paintbox
   dx:=x-startx;
   dy:=y-starty;
   startx:=x;
   starty:=y;
   FrameGrid.Offset:=Point(dx,dy);
 end;
 if fDrawGridMode=dgmDraw then begin //draw if layer not locked
  if Assigned(DrawTool) and (FrameGrid.HasCoords(Point(X,Y))) then begin
   if Layers[FrameGrid.ActiveLayer].Locked then Exit;
   p:=FrameGrid.Coords(X,Y);
   DrawTool.MouseMove(p.X,p.Y);
   FramePreview.Invalidate;
  end;
 end;
 StatusBar1.Panels[0].Text:='x='+IntToStr(x)+'/y='+IntToStr(y);
 pbFrameDraw.Invalidate;
 //todo: fix undo/redo enabled
 actUndo.Enabled:=True;//UndoRedoManager.CanUndo;
 actRedo.Enabled:=True;//UndoRedoManager.CanRedo;
end;

procedure TfrmMain.pbFrameDrawMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    p : TPoint;
begin
  if not Assigned(FrameGrid) then Exit;
  fDrawGridMode:=dgmNone;
  if Layers[FrameGrid.ActiveLayer].Locked then Exit;
  if Assigned(DrawTool) then begin
   p:=FrameGrid.Coords(X,Y);
   DrawTool.MouseUp(p.x,p.y,Shift);
   //check if current palette hasn't current color then add it
   if ToolOptions.Color<>BGRAPixelTransparent then begin
    Palette.AddColor(ToolOptions.Color);
    PaletteChange;
   end;
  end;
{  pbFrameDraw.Invalidate;
  drwgrdLayers.Invalidate;
  FgColor.Invalidate;
  BgColor.Invalidate;}
end;

procedure TfrmMain.pbFrameDrawMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  if not Assigned(FrameGrid) then Exit;
  if (ssCtrl in Shift) then actZoomOutExecute(Sender);
  if (ssAlt in Shift) then FrameGrid.CheckersSize:=FrameGrid.CheckersSize-1;
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.pbFrameDrawMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  if not Assigned(FrameGrid) then Exit;
  if (ssCtrl in Shift) then actZoomInExecute(Sender);
  if (ssAlt in Shift) then FrameGrid.CheckersSize:=FrameGrid.CheckersSize+1;
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.pbFrameDrawPaint(Sender: TObject);
begin
   //draw here zoomed frame data
  if Assigned(FrameGrid) then begin
    FrameGrid.RenderAndDraw(pbFrameDraw.Canvas);
  end;
  StatusBar1.Panels[2].Text:='w='+IntToStr(pbFrameDraw.ClientWidth)+'/h='+IntToStr(pbFrameDraw.ClientHeight);
end;

procedure TfrmMain.SetSelectedColor(const Button: TMouseButton;
  aColor: TBGRAPixel);
begin
  case Button of
    mbLeft: begin
     spclForeColor:=aColor;
     FgColor.Invalidate;
    end;
    mbRight: begin
     spclBackColor:=aColor;
     BgColor.Invalidate;
    end;
  end;
  ToolOptions.Color:=aColor;
  Palette.AddColor(aColor);
  mbPaletteGrid.Invalidate;
end;

procedure TfrmMain.LoadPresets(aDir: String);
var
  i: Integer;
begin
  cbPalettePresets.Clear;
  ReloadPresets(aDir);
  if Presets.Count>0 then begin
   for i:= 0 to Presets.Count-1 do begin
       cbPalettePresets.Items.Add(Presets.Keys[i]);
     {$IFDEF DEBUG}
      DebugLn('In: LoadPresets preset name: ', Presets.Keys[i], ' '
        +'Colors: '+IntToStr(Presets[Presets.Keys[i]].Palette.Count));
     {$ENDIF}
   end;
  end;
  cbPalettePresets.ItemIndex:=0;
  cbPalettePresetsChange(Self);
end;

procedure TfrmMain.sbPenClick(Sender: TObject);
begin
  if not Assigned(FrameGrid) then begin
   sbPen.Down:=True;
   Exit;
  end;
  if Assigned(DrawTool) then FreeAndNil(DrawTool);
  case (Sender as TSpeedButton).Tag of
 1:DrawTool:=TSPPen.Create;
 2:DrawTool:=TSPLine.Create;
 3:DrawTool:=TSPEraser.Create;
 4:DrawTool:=TSPPipette.Create;
 5:DrawTool:=TSPRect.Create;
 6:DrawTool:=TSPFilledRect.Create;
 7:DrawTool:=TSPCircle.Create;
 8:DrawTool:=TSPFloodFill.Create
 else begin
      ShowMessage(rsThisToolWill);
      DrawTool:=TSPPen.Create;
      sbPen.Down:=True;
  end;
 end;
  trkbrPenSize.Value:=ToolOptions.PenSize;
 (Sender as TSpeedButton).Down:=True;
 pbFrameDraw.Cursor:=TSpeedButton(Sender).Tag;
 StatusBar1.Panels[4].Text:=rsActiveTool+DrawTool.ToolName;
end;

procedure TfrmMain.trkbrPenSizeChange(Sender: TObject);
begin
  FrameGrid.CellCursor.CursorSize:=trkbrPenSize.Value;
  pbFrameDraw.Invalidate;
end;

initialization
{$I cursors.lrs}

end.

