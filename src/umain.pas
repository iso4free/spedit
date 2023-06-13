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
{*    Copyright (c) 2000-2023 by Vadim Vitomsky                            *}
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
  {$IFDEF DEBUG}LazLoggerBase,{$ENDIF}
  LResources, uglobals, JvMovableBevel, Classes, SysUtils, Forms,
  Controls, Graphics, Types, Dialogs, Menus, ComCtrls, ExtCtrls, Buttons,
  ActnList, Grids, JSONPropStorage, ExtDlgs, StdCtrls, StdActns, LCLIntf,
  LCLType, Spin, HexaColorPicker, mbColorPalette, BGRAImageList,
  BGRAGraphicControl, BGRABitmapTypes, BGRABitmap, Clipbrd;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    acImportFrame: TAction;
    actAddLayer: TAction;
    actDeleteLayer: TAction;
    actCopyLayer: TAction;
    actFrameExportPNG: TAction;
    actFrameResize: TAction;
    actDither: TAction;
    actCopy: TAction;
    actCut: TAction;
    actGridToggle: TAction;
    actFlipH: TAction;
    actFlipV: TAction;
    actImportPiskel: TAction;
    actImportSprites: TAction;
    actDeleteFrame: TAction;
    actSetAsNext: TAction;
    actSetAsPrevious: TAction;
    actOnionSkin: TAction;
    actPreviewToggle: TAction;
    actOpenProj: TAction;
    actSaveProj: TAction;
    actNewProj: TAction;
    actProjProps: TAction;
    actRotateCCW: TAction;
    actRotateCW: TAction;
    actMoveDown: TAction;
    actMoveUp: TAction;
    actPaste: TAction;
    actSelectAll: TAction;
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
    bbtnImportFrame: TBitBtn;
    bbtnNewFrame: TBitBtn;
    bbtnResize: TBitBtn;
    bbtnOnionMode: TBitBtn;
    ButtonsImageList: TBGRAImageList;
    ColorDialog1: TColorDialog;
    cbPalettePresets: TComboBox;
    drwgrdLayers: TDrawGrid;
    actUndo: TEditUndo;
    FgColor: TBGRAGraphicControl;
    actExit: TFileExit;
    HexaColorPicker1: THexaColorPicker;
    FramePreview: TImage;
    JSONPropStorage1: TJSONPropStorage;
    Label1: TLabel;
    Label2: TLabel;
    pmiSetAsNext: TMenuItem;
    pmiSetAsPrev: TMenuItem;
    Separator16: TMenuItem;
    miOnionMode: TMenuItem;
    Separator15: TMenuItem;
    pnlOnion: TPanel;
    pmiDeleteFrame: TMenuItem;
    pmiAddFrame: TMenuItem;
    miTogglePreview: TMenuItem;
    pnlPreview: TJvMovablePanel;
    lbpPalettePresrts: TLabel;
    lblPenSize: TLabel;
    LayersFlowPanel: TFlowPanel;
    LayersGroupBox: TGroupBox;
    mbPaletteGrid: TmbColorPalette;
    mbColorPalettePreset: TmbColorPalette;
    MenuItem1: TMenuItem;
    miOpenProj: TMenuItem;
    miProjProps: TMenuItem;
    miPiskelImport: TMenuItem;
    miImport: TMenuItem;
    miRotateCCW: TMenuItem;
    miRotateCW: TMenuItem;
    miFlipVertical: TMenuItem;
    miFlipH: TMenuItem;
    miFlipRotate: TMenuItem;
    dlgOpenProj: TOpenDialog;
    pmiRotateCCW: TMenuItem;
    pmiRotateCW: TMenuItem;
    pmiFlipV: TMenuItem;
    pmiFlipH: TMenuItem;
    pmiLayerFlipRotate: TMenuItem;
    pmiMoveUp: TMenuItem;
    pmiMoveDown: TMenuItem;
    miMoveDown: TMenuItem;
    miMoveUp: TMenuItem;
    pmiMergeLayers: TMenuItem;
    pmiCopyLayer: TMenuItem;
    pmiDeleteLayer: TMenuItem;
    pmiAddLayer: TMenuItem;
    miPaste: TMenuItem;
    miCut: TMenuItem;
    miSelectAll: TMenuItem;
    miCopy: TMenuItem;
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
    pnlOnionMode: TJvMovablePanel;
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
    pnlEditor: TPanel;
    pnlLayers: TPanel;
    pmLayers: TPopupMenu;
    pmFrames: TPopupMenu;
    SavePaletteDialog: TSaveDialog;
    sbCircle: TSpeedButton;
    sbEracer: TSpeedButton;
    sbFilledRect: TSpeedButton;
    sbLine: TSpeedButton;
    sbPen: TSpeedButton;
    sbPipette: TSpeedButton;
    sbRect: TSpeedButton;
    ScrollBox1: TScrollBox;
    sdExportFrameSaveDialog: TSaveDialog;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    Separator1: TMenuItem;
    Separator10: TMenuItem;
    Separator11: TMenuItem;
    Separator12: TMenuItem;
    Separator13: TMenuItem;
    Separator14: TMenuItem;
    Separator2: TMenuItem;
    Separator3: TMenuItem;
    Separator4: TMenuItem;
    Separator5: TMenuItem;
    Separator6: TMenuItem;
    Separator7: TMenuItem;
    sbFloodFill: TSpeedButton;
    Separator8: TMenuItem;
    sbRectSelection: TSpeedButton;
    Separator9: TMenuItem;
    bbtnGridToggle: TBitBtn;
    sbMove: TSpeedButton;
    drwgrdFrames: TDrawGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    StatusBar1: TStatusBar;
    trkbrPenSize: TSpinEdit;
    procedure actCopyExecute(Sender: TObject);
    procedure actCutExecute(Sender: TObject);
    procedure actDeleteFrameExecute(Sender: TObject);
    procedure actDitherExecute(Sender: TObject);
    procedure actFlipVExecute(Sender: TObject);
    procedure actFrameExportPNGExecute(Sender: TObject);
    procedure actFrameResizeExecute(Sender: TObject);
    procedure actGridToggleExecute(Sender: TObject);
    procedure actImportFrameExecute(Sender: TObject);
    procedure actAddLayerExecute(Sender: TObject);
    procedure actCopyLayerExecute(Sender: TObject);
    procedure actDeleteLayerExecute(Sender: TObject);
    procedure actImportSpritesExecute(Sender: TObject);
    procedure actLanguageSelectExecute(Sender: TObject);
    procedure actLayersToggleExecute(Sender: TObject);
    procedure actLoadPresetsExecute(Sender: TObject);
    procedure actMergeLayersExecute(Sender: TObject);
    procedure actFlipHExecute(Sender: TObject);
    procedure actMoveDownExecute(Sender: TObject);
    procedure actMoveUpExecute(Sender: TObject);
    procedure actNewFrameExecute(Sender: TObject);
    procedure actNewProjExecute(Sender: TObject);
    procedure actNotImplementedExecute(Sender: TObject);
    procedure actOnionSkinExecute(Sender: TObject);
    procedure actOpenProjExecute(Sender: TObject);
    procedure actPaletteImportExecute(Sender: TObject);
    procedure actPaletteLoadExecute(Sender: TObject);
    procedure actPaletteResetExecute(Sender: TObject);
    procedure actPaletteSaveExecute(Sender: TObject);
    procedure actPaletteToggleExecute(Sender: TObject);
    procedure actPasteExecute(Sender: TObject);
    procedure actPreviewToggleExecute(Sender: TObject);
    procedure actProjPropsExecute(Sender: TObject);
    procedure actRedoExecute(Sender: TObject);
    procedure actReferenceToggleExecute(Sender: TObject);
    procedure actRotateCCWExecute(Sender: TObject);
    procedure actRotateCWExecute(Sender: TObject);
    procedure actSaveProjExecute(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
    procedure actSetAsNextExecute(Sender: TObject);
    procedure actSetAsPreviousExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure actToggleFullScreenExecute(Sender: TObject);
    procedure actZoomInExecute(Sender: TObject);
    procedure actZoomOutExecute(Sender: TObject);
    procedure actZoomResetExecute(Sender: TObject);
    procedure bbtnAddLayerClick(Sender: TObject);
    procedure bbtnCopyLayerClick(Sender: TObject);
    procedure bbtnDeleteLayerClick(Sender: TObject);
    procedure bbtnGridToggleClick(Sender: TObject);
    procedure bbtnMergeLayersClick(Sender: TObject);
    procedure bbtnNewFrameClick(Sender: TObject);
    procedure bbtnOnionModeClick(Sender: TObject);
    procedure bbtnShowLayersClick(Sender: TObject);
    procedure bbtnShowPaletteClick(Sender: TObject);
    procedure bbtnSwapColorsClick(Sender: TObject);
    procedure bbtnImportFrameClick(Sender: TObject);
    procedure bbtnTogglePreviewClick(Sender: TObject);
    procedure bbtnResizeClick(Sender: TObject);
    procedure cbPalettePresetsChange(Sender: TObject);
    procedure cbPalettePresetsDrawItem(Control: TWinControl; Index: integer;
      ARect: TRect; State: TOwnerDrawState);
    procedure drwgrdFramesSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure drwgrdLayersDrawCell(Sender: TObject; aCol, aRow: integer;
      aRect: TRect; aState: TGridDrawState);
    procedure drwgrdLayersMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure actUndoExecute(Sender: TObject);
    procedure FgColorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure FgColorPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of string);
    procedure FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FramePreviewClick(Sender: TObject);
    procedure HexaColorPicker1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure lwFramesColumnClick(Sender: TObject; Column: TListColumn);
    procedure mbColorPalettePresetCellClick(Button: TMouseButton;
      Shift: TShiftState; Index: integer; AColor: TColor; var DontCheck: boolean);
    procedure miAboutClick(Sender: TObject);
    procedure actImportPiskelExecute(Sender: TObject);
    procedure miRedoClick(Sender: TObject);
    procedure miSaveProjectAsClick(Sender: TObject);
    procedure miUndoClick(Sender: TObject);
    procedure pbFrameDrawMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure pbFrameDrawMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: integer);
    procedure pbFrameDrawMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure pbFrameDrawMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: boolean);
    procedure pbFrameDrawMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: boolean);
    procedure pbFrameDrawPaint(Sender: TObject);
    procedure sbPenClick(Sender: TObject);
    procedure drwgrdFramesDrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure trkbrPenSizeChange(Sender: TObject);
  private
    fDrawGridMode: TDrawGridMode;
    dx, dy: integer;             //offset to move grid
    startx, starty: integer;     //start position to move
    fCheckers : TBGRABitmap;
    procedure LayersChange;
    procedure FramesChange;
    procedure LoadPresets(aDir: string);
    procedure SetSelectedColor(const Button: TMouseButton; aColor: TBGRAPixel);
    procedure PaletteChange; //added colors to current palette
    procedure CreateCursors; //create custom cursors for drawing
    procedure ImportFrame(aFilename: TFilename);
  public
  end;

var
  frmMain: TfrmMain;

implementation

uses uprojprops, udraw, uabout, unamedlg, uframedlg, uresizedlg,
  ureferense, usettings, uspriteimport;

procedure EraseSelection;
begin
  if ToolOptions.IsSelection then
  begin
    ProjectInfo.ActiveFrame.SaveState;
    ProjectInfo.ActiveFrame.ActiveLayer.Drawable.EraseRect(
      ToolOptions.SelectionRect, 255);
  end;
end;

{$R *.frm}

{ TfrmMain }

procedure TfrmMain.actImportFrameExecute(Sender: TObject);
begin
  if not Assigned(ProjectInfo) then
     actNewProjExecute(Sender);
  if OpenPictureDialog1.Execute then
  begin
    ImportFrame(OpenPictureDialog1.Filename);
  end;
end;

procedure TfrmMain.actGridToggleExecute(Sender: TObject);
begin
  actGridToggle.Checked := not actGridToggle.Checked;
  if not Assigned(FrameGrid) then Exit;
  FrameGrid.ShowGrid := actGridToggle.Checked;
  INI.WriteBool('INTERFACE', 'SHOWGRID', actGridToggle.Checked);
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.actFrameExportPNGExecute(Sender: TObject);
begin
  sdExportFrameSaveDialog.InitialDir := INI.ReadString('PATH', 'EXPORT', GetUserDir());
  if sdExportFrameSaveDialog.Execute then
  begin
    //save current frame to PNG file by default to user dir and with frame name
    ProjectInfo.ActiveFrame.ExportPng(sdExportFrameSaveDialog.FileName);
    INI.WriteString('PATH', 'EXPORT', ExtractFilePath(sdExportFrameSaveDialog.FileName));
  end;
end;

procedure TfrmMain.actDitherExecute(Sender: TObject);
var
  i: integer;
begin
  ProjectInfo.ActiveFrame.SaveState;
  //dither all layers
  for i := 0 to ProjectInfo.ActiveFrame.LayersList.Count - 1 do
  begin
  {$IFDEF DEBUG}
  //DebugLn('In: actDitherExecute() layer: ',Frames[FrameGrid.ActiveFrame].LayersList.Strings[i]);
  {$ENDIF}
    DitherImage(ProjectInfo.ActiveFrame.Layers[
      ProjectInfo.ActiveFrame.LayersList.Strings[i]].Drawable,
      Presets[cbPalettePresets.Text].Palette, 0);
  end;
  pbFrameDraw.Invalidate;
  FramePreview.Invalidate;
  PaletteChange;
end;

procedure TfrmMain.actFrameResizeExecute(Sender: TObject);
var
  canSelect : Boolean;
begin
  if not Assigned(FrameGrid) then Exit;
  frmResize.CheckSettings;
  frmResize.ShowModal;
  if frmResize.ModalResult = mrOk then
  begin
    ProjectInfo.ActiveFrame.Resize(frmResize.spnWidth.Value, frmResize.spnHeight.Value,
       frmResize.cbStretch.Checked);
    drwgrdFramesSelectCell(Sender,drwgrdFrames.Col,drwgrdFrames.Row,canSelect);
  end;
end;

procedure TfrmMain.actAddLayerExecute(Sender: TObject);
var
  aLayerName: string;
begin
  if not Assigned(FrameGrid) then Exit;
  aLayerName := CheckLayerName(rsLayer + IntToStr(ProjectInfo.ActiveFrame.Layers.Count - 1));
  frmNameDlg.Caption := rsLayerName;
  frmNameDlg.edName.Text := aLayerName;
  frmNameDlg.lblName.Caption := rsInputNewLaye;
  frmNameDlg.ShowModal;
  if frmNameDlg.ModalResult <> mrOk then Exit;
  aLayerName := frmNameDlg.edName.Text;
  ProjectInfo.ActiveFrame.AddLayer(aLayerName);
  ProjectInfo.ActiveFrame.ActiveLayer.Visible := True;
  ProjectInfo.ActiveFrame.ActiveLayer.Locked := False;
  LayersChange;
end;

procedure TfrmMain.actCopyExecute(Sender: TObject);
var
  aBmp: TBGRABitmap;
begin
  //copy selection to clipboard
  if ToolOptions.IsSelection then
  begin
    aBmp := TBGRABitmap.Create(ToolOptions.SelectionRect.Width,
      ToolOptions.SelectionRect.Height);
    aBmp.Canvas.CopyRect(aBmp.ClipRect,
      ProjectInfo.ActiveFrame.ActiveLayer.Drawable.Canvas, ToolOptions.SelectionRect);
    Clipboard.Assign(aBmp.Bitmap);
    FreeAndNil(aBmp);
  end;
end;

procedure TfrmMain.actCopyLayerExecute(Sender: TObject);
var
  aName: string;
  aData: string;
begin
  if not Assigned(FrameGrid) then Exit;
  aName := rsCopyOf + ProjectInfo.ActiveFrame.ActiveLayer.LayerName;
  aData := ProjectInfo.ActiveFrame.ActiveLayer.ToBASE64String;
  ProjectInfo.ActiveFrame.ActiveLayer.RestoreFromString(aData);
  LayersChange;
end;

procedure TfrmMain.actCutExecute(Sender: TObject);
begin
  //cut selection to clipboard
  if not ToolOptions.IsSelection then Exit;
  ProjectInfo.ActiveFrame.SaveState;
  actCopyExecute(Sender);
  EraseSelection;
end;

procedure TfrmMain.actDeleteFrameExecute(Sender: TObject);
begin
  if MessageDlg(rsWarning, rsActionNotUndone,mtWarning,mbYesNo,'')<>mrYes then Exit;
  if not Assigned(FrameGrid) then Exit;
  if not Assigned(ProjectInfo.ActiveFrame) then
  begin
    ShowMessage(rsFrameNotExist);
    Exit;
  end;
  ProjectInfo.DeleteFrame(ProjectInfo.ActiveFrame);
  FramesChange;
end;

procedure TfrmMain.actDeleteLayerExecute(Sender: TObject);
begin
  if not Assigned(FrameGrid) then Exit;
  if ProjectInfo.ActiveFrame.IsMainLayerActive then
  begin
    ShowMessage(rsThisLayerCan2);
    Exit;
  end;
  ProjectInfo.ActiveFrame.SaveState;
  ProjectInfo.ActiveFrame.DeleteLayer(ProjectInfo.ActiveFrame.ActiveLayer.LayerName);
  LayersChange;
end;

procedure TfrmMain.actLanguageSelectExecute(Sender: TObject);
begin
  opndlgLocalization.InitialDir := INI.ReadString('INTERFACE', 'LOCALES', '');
  if opndlgLocalization.Execute then
  begin
    INI.WriteString('INTERFACE', 'LOCALES', ExtractFilePath(opndlgLocalization.FileName));
    INI.WriteString('INTERFACE', 'L10n file', opndlgLocalization.FileName);
    INI.WriteString('INTERFACE', 'LANGUAGE', DetectPOLanguage(opndlgLocalization.FileName));
  end;
end;

procedure TfrmMain.actLayersToggleExecute(Sender: TObject);
begin
  pnlLayers.Visible := not pnlLayers.Visible;
  actLayersToggle.Checked := pnlLayers.Visible;
end;

procedure TfrmMain.actLoadPresetsExecute(Sender: TObject);
begin
  SelectDirectoryDialog1.InitialDir := INI.ReadString('PRESETS', 'PALETTES', '');
  if SelectDirectoryDialog1.Execute then
  begin
    LoadPresets(SelectDirectoryDialog1.FileName);
    INI.WriteString('PRESETS', 'PALETTES', SelectDirectoryDialog1.FileName);
  end;
end;

procedure TfrmMain.actMergeLayersExecute(Sender: TObject);
var
  aIdx: integer;
  aMergeName, activeName: string;
begin
  if not Assigned(FrameGrid) then Exit;
  if ProjectInfo.ActiveFrame.IsMainLayerActive or
    (ProjectInfo.ActiveFrame.LayersList.Count < 2) or
    (ProjectInfo.ActiveFrame.ActiveLayer.Locked) then
  begin
    ShowMessage(rsCantMerge);
    Exit;
  end;
  activeName := ProjectInfo.ActiveFrame.ActiveLayer.LayerName;
  aIdx := ProjectInfo.ActiveFrame.LayersList.IndexOf(activeName);
  if aIdx > 0 then
  begin
    aMergeName := ProjectInfo.ActiveFrame.LayersList.Strings[aIdx - 1];
    if ProjectInfo.ActiveFrame.Layers[aMergeName].Locked then
    begin
      ShowMessage(rsCantMerge);
      Exit;
    end;
    //all good - let`s merge
    ProjectInfo.ActiveFrame.SaveState;
    ProjectInfo.ActiveFrame.Layers[aMergeName].Drawable.PutImage(
      0, 0, ProjectInfo.ActiveFrame.Layers[activeName].Drawable, dmDrawWithTransparency);
    ProjectInfo.ActiveFrame.DeleteLayer(activeName);
    ProjectInfo.ActiveFrame.ActiveLayer := ProjectInfo.ActiveFrame.Layers[aMergeName];

    LayersChange;
  end
  else
    ShowMessage(rsCantMerge);
end;

procedure TfrmMain.actFlipHExecute(Sender: TObject);
begin
  if Assigned(FrameGrid) then
  begin
    ProjectInfo.ActiveFrame.ActiveLayer.Drawable.HorizontalFlip;
    pbFrameDraw.Invalidate;
    FramePreview.Invalidate;
    drwgrdLayers.Invalidate;
  end;
end;

procedure TfrmMain.actFlipVExecute(Sender: TObject);
begin
  if Assigned(FrameGrid) then
  begin
    ProjectInfo.ActiveFrame.ActiveLayer.Drawable.VerticalFlip;
    pbFrameDraw.Invalidate;
    FramePreview.Invalidate;
    drwgrdLayers.Invalidate;
  end;
end;

procedure TfrmMain.actMoveDownExecute(Sender: TObject);
var
  aIdx: integer;
begin
  with ProjectInfo.ActiveFrame.LayersList do
  begin
    aIdx := IndexOf(ProjectInfo.ActiveFrame.ActiveLayer.LayerName);
    if aIdx > 1 then
    begin
      Move(aIdx, aIdx - 1);
      LayersChange;
    end;
  end;
end;

procedure TfrmMain.actMoveUpExecute(Sender: TObject);
var
  aIdx: integer;
begin
  with ProjectInfo.ActiveFrame.LayersList do
  begin
    aIdx := IndexOf(ProjectInfo.ActiveFrame.ActiveLayer.LayerName);
    if aIdx < (Count - 1) then
    begin
      Move(aIdx, aIdx + 1);
      LayersChange;
    end;
  end;
end;

procedure TfrmMain.actNewFrameExecute(Sender: TObject);
begin
  //show dialog to create new frame with default parameters
  if not Assigned(ProjectInfo) then  actNewProjExecute(Sender);
  if Assigned(FrameGrid) then
  begin
    frmFrameDlg.spnedtHeight.Value := FrameGrid.FrameHeight;
    frmFrameDlg.spnedtWidth.Value := FrameGrid.FrameWidth;
    frmFrameDlg.edtFrameName.Text := CheckFrameName(rsFrame);
  end;
  frmFrameDlg.isOk := False;
  frmFrameDlg.ShowModal;
  if frmFrameDlg.isOk then
  begin
    //at first let's create new frame
    ProjectInfo.Frames.Add(TSPFrame.Create(frmFrameDlg.edtFrameName.Text,
      frmFrameDlg.spnedtWidth.Value,
      frmFrameDlg.spnedtHeight.Value));

    ProjectInfo.ActiveFrame := ProjectInfo.Frames[frmFrameDlg.edtFrameName.Text];

    //al last we can create FrameGrid for visualize our frame
    FreeAndNil(FrameGrid);
    FrameGrid := TFrameGrid.Create(frmFrameDlg.spnedtWidth.Value,
      frmFrameDlg.spnedtHeight.Value, frmFrameDlg.spnedtCellSize.Value);
    FrameGrid.Offset := Point(0, 0);
    dx := 0;
    dy := 0;
    FramePreview.Width := FrameGrid.FrameWidth;
    FramePreview.Height := FrameGrid.FrameHeight;

    //todo: copy all layers to new frame if option checked

    FrameGrid.ShowGrid := actGridToggle.Checked;
    trkbrPenSize.MaxValue := (FrameGrid.FrameWidth + FrameGrid.FrameHeight) div 4;
    Palette.Clear;
    //todo: here just add the frame name in visual control, in DrawItem use mapped frame Preview image (scalable)

    LayersChange;
    mbPaletteGrid.Colors.Clear;
    pbFrameDraw.Invalidate;
    FramesChange;
  end;
end;

procedure TfrmMain.actNewProjExecute(Sender: TObject);
var
  mr: TModalResult;
begin
  if Assigned(ProjectInfo) then
  begin
    if ProjectInfo.Changed then
    begin
      mr := MessageDlg(rsWarning, rsProjNotSaved + LineEnding +
        rsPressYesToSave + LineEnding +
       rsNoToContinue + LineEnding +
        rsCancelToContinue,
        mtWarning, mbYesNoCancel, '');
      case mr of
        mrYes: begin
          ProjectInfo.Save;
        end;
        mrCancel: begin
          Exit;
        end;
      end;

    end;
    FreeAndNil(ProjectInfo);
  end;
  ProjectInfo := TSPProjectInfo.Create;
  actProjPropsExecute(Sender);
end;

procedure TfrmMain.actNotImplementedExecute(Sender: TObject);
begin
  ShowMessage(rsSorry);
end;

procedure TfrmMain.actOnionSkinExecute(Sender: TObject);
begin
  actOnionSkin.Checked :=not actOnionSkin.Checked;
  pnlOnionMode.Visible := actOnionSkin.Checked;
  ProjectInfo.ActiveFrame.UseOnionSkin:=actOnionSkin.Checked;
  pbFrameDraw.Invalidate;
  drwgrdFrames.Invalidate;
end;

procedure TfrmMain.actOpenProjExecute(Sender: TObject);
var
  aframename : String;
  canselect : Boolean;
  idx : Integer;
begin
  dlgOpenProj.InitialDir := INI.ReadString('PATH', 'EXPORT', GetUserDir());
  if dlgOpenProj.Execute then
  begin
    if Assigned(ProjectInfo) then FreeAndNil(ProjectInfo);
    ProjectInfo:=TSPProjectInfo.Create;
    ProjectInfo.Filename := dlgOpenProj.FileName;
    ProjectInfo.Load;
    aframename:=ProjectInfo.ActiveFrame.FrameName;
    idx:=ProjectInfo.ActiveFrame.Index;
    Caption:=APP_NAME+' - '+ProjectInfo.Title+'/'+rsFrame+': '+aframename;

    drwgrdFrames.RowCount:=ProjectInfo.FramesCount;
    ProjectInfo.ActiveFrame:=ProjectInfo.Frames[aframename];

    drwgrdFramesSelectCell(Sender,0,idx,canselect);
    INI.WriteString('PATH', 'EXPORT', ExtractFilePath(dlgOpenProj.FileName));
  end;
end;

procedure TfrmMain.actPaletteImportExecute(Sender: TObject);
var
  aPal: TPalette;
  i: integer;
begin
  if OpenPictureDialog1.Execute then
  begin
    aPal.LoadFromImage(OpenPictureDialog1.FileName);
    Palette.Clear;
    for i := 0 to aPal.Count - 1 do Palette.AddColor(aPal.Color[i]);
    PaletteChange;
  end;
end;

procedure TfrmMain.actPaletteLoadExecute(Sender: TObject);
begin
  if OpenPaletteDialog.Execute then
  begin
    Palette.LoadFromFile(OpenPaletteDialog.FileName);
  end;
end;

procedure TfrmMain.actPaletteResetExecute(Sender: TObject);
var
  i: integer;
begin
  if MessageDlg(rsWarning, rsPaletteWillB, mtWarning, mbYesNo, '') = mrYes then
  begin
    Palette.Clear;
    if ProjectInfo.ActiveFrame.Layers.Count > 0 then
      for i := 0 to ProjectInfo.ActiveFrame.Layers.Count - 1 do
        Palette.AddColors(ProjectInfo.ActiveFrame.Layers[
          ProjectInfo.ActiveFrame.Layers.Keys[i]].Drawable);
  end;
  mbPaletteGrid.Invalidate;
end;

procedure TfrmMain.actPaletteSaveExecute(Sender: TObject);
begin
  if SavePaletteDialog.Execute then
  begin
    Palette.SaveToFile(SavePaletteDialog.FileName);
  end;
end;

procedure TfrmMain.actPaletteToggleExecute(Sender: TObject);
begin
  pnlPalette.Visible := not pnlPalette.Visible;
  actPaletteToggle.Visible := pnlPalette.Visible;
end;

procedure TfrmMain.actPasteExecute(Sender: TObject);
var
  aBmp: TBitmap;
begin
  //todo: clip or resample clipboar image to selection or frame size
  aBmp := TBitmap.Create();
  if (Clipboard.HasFormat(PredefinedClipboardFormat(pcfBitmap))) then
    aBmp.LoadFromClipboardFormat(PredefinedClipboardFormat(pcfBitmap))
  else if (Clipboard.HasFormat(PredefinedClipboardFormat(pcfPixmap))) then
    aBmp.LoadFromClipboardFormat(PredefinedClipboardFormat(pcfPixmap))
  else if (Clipboard.HasFormat(PredefinedClipboardFormat(pcfIcon))) then
    aBmp.LoadFromClipboardFormat(PredefinedClipboardFormat(pcfIcon))
  else if (Clipboard.HasFormat(PredefinedClipboardFormat(pcfPicture))) then
    aBmp.LoadFromClipboardFormat(PredefinedClipboardFormat(pcfPicture))
  else if (Clipboard.HasFormat(PredefinedClipboardFormat(pcfMetaFilePict))) then
    aBmp.LoadFromClipboardFormat(PredefinedClipboardFormat(pcfMetaFilePict))
  else
  begin
    ShowMessage(rsUnsupportedFmt);
    FreeAndNil(aBmp);
    Exit;
  end;
      {$IFDEF DEBUG}
      DebugLn('In: actPasteExecute() w=', IntToStr(aBmp.Width)+'/h='+IntToStr(aBmp.Height));
      {$ENDIF}
  //we get image from clipboard - now create new layer with it
  ProjectInfo.ActiveFrame.AddLayer('Clipboard');

  //if has selection paste inside selection
  if ToolOptions.IsSelection then
  begin
    // Layers['Clipboard'].Drawable.ResampleFilter:=rfBicubic;
    ProjectInfo.ActiveFrame.ActiveLayer.Drawable.PutImage(
      ToolOptions.SelectionRect.Left, ToolOptions.SelectionRect.Top, aBmp,
      dmSetExceptTransparent);
  end
  else
  begin
    ProjectInfo.ActiveFrame.ActiveLayer.Drawable.Canvas.Draw(0, 0, aBmp);
  end;
  FreeAndNil(aBmp);
  LayersChange;
  pbFrameDraw.Invalidate;
  FramePreview.Invalidate;
end;

procedure TfrmMain.actPreviewToggleExecute(Sender: TObject);
begin
 pnlPreview.Visible:=not pnlPreview.Visible;
 actPreviewToggle.Checked:=pnlPreview.Visible;
end;

procedure TfrmMain.actProjPropsExecute(Sender: TObject);
begin
  if not Assigned(ProjectInfo) then Exit;
  frmProjectProps.LoadProjProps;
  frmProjectProps.ShowModal;
end;

procedure TfrmMain.actRedoExecute(Sender: TObject);
begin
  ProjectInfo.ActiveFrame.RedoState;
  LayersChange;
end;

procedure TfrmMain.actReferenceToggleExecute(Sender: TObject);
begin
  if not Assigned(frmReferense) then frmReferense := TfrmReferense.Create(nil);
  frmReferense.Visible := not frmReferense.Visible;
  actReferenceToggle.Checked := frmReferense.Visible;
end;

procedure TfrmMain.actRotateCCWExecute(Sender: TObject);
var
  aTmp: TBGRABitmap;
begin
  if Assigned(FrameGrid) then
  begin
    aTmp := ProjectInfo.ActiveFrame.ActiveLayer.Drawable.RotateCCW;
    ClearBitmap(ProjectInfo.ActiveFrame.ActiveLayer.Drawable);
    ProjectInfo.ActiveFrame.ActiveLayer.Drawable.PutImage(0, 0, aTmp, dmSetExceptTransparent);
    FreeAndNil(aTmp);
    //todo:if w<>h change FrameGrid W/H
    pbFrameDraw.Invalidate;
    FramePreview.Invalidate;
    drwgrdLayers.Invalidate;
  end;
end;

procedure TfrmMain.actRotateCWExecute(Sender: TObject);
var
  aTmp: TBGRABitmap;
begin
  if Assigned(FrameGrid) then
  begin
    aTmp := ProjectInfo.ActiveFrame.ActiveLayer.Drawable.RotateCW;
    ClearBitmap(ProjectInfo.ActiveFrame.ActiveLayer.Drawable);
    ProjectInfo.ActiveFrame.ActiveLayer.Drawable.PutImage(0, 0, aTmp, dmSetExceptTransparent);
    FreeAndNil(aTmp);
    //todo:if w<>h change FrameGrid W/H
    pbFrameDraw.Invalidate;
    FramePreview.Invalidate;
    drwgrdLayers.Invalidate;
  end;
end;

procedure TfrmMain.actSaveProjExecute(Sender: TObject);
begin
  if not Assigned(ProjectInfo) then Exit;
  if ProjectInfo.Filename = '' then
  begin
    sdExportFrameSaveDialog.InitialDir := INI.ReadString('PATH', 'EXPORT', GetUserDir());
    sdExportFrameSaveDialog.DefaultExt := '.json';
    sdExportFrameSaveDialog.FileName := ProjectInfo.Title;
    if ProjectInfo.Filename='' then
    if sdExportFrameSaveDialog.Execute then begin
      ProjectInfo.Filename := sdExportFrameSaveDialog.FileName+sdExportFrameSaveDialog.DefaultExt;
      ProjectInfo.Save;
    end;
  end
  else ProjectInfo.Save;
end;

procedure TfrmMain.actSelectAllExecute(Sender: TObject);
begin
  ToolOptions.SelectionRect.Left := 0;
  ToolOptions.SelectionRect.Top := 0;
  ToolOptions.SelectionRect.Bottom := FrameGrid.FrameHeight;
  ToolOptions.SelectionRect.Right := FrameGrid.FrameWidth;
  ToolOptions.IsSelection := True;
end;

procedure TfrmMain.actSetAsNextExecute(Sender: TObject);
var
  ci: Integer;
begin
    ci := ProjectInfo.Frames.Names.IndexOf(ProjectInfo.ActiveFrame.FrameName);
  if ci=0 then begin
    ShowMessage('There is no frames before...');
    Exit;
  end;
  ProjectInfo.Frames[ProjectInfo.Frames.Names[ci-1]].NextFrame:=ProjectInfo.ActiveFrame;
end;

procedure TfrmMain.actSetAsPreviousExecute(Sender: TObject);
var
  ci: Integer;          //current frame idx
begin
  ci := ProjectInfo.Frames.Names.IndexOf(ProjectInfo.ActiveFrame.FrameName);
  if ci=ProjectInfo.Frames.Count then begin
    ShowMessage(rsNoFramesAfter);
    Exit;
  end;
  ProjectInfo.Frames[ProjectInfo.Frames.Names[ci+1]].PrevFrame:=ProjectInfo.ActiveFrame;
end;

procedure TfrmMain.actSettingsExecute(Sender: TObject);
begin
  frmSettings.ShowModal;
end;

procedure TfrmMain.actToggleFullScreenExecute(Sender: TObject);
begin
  if WindowState <> wsFullScreen then WindowState := wsFullScreen
  else
    WindowState := wsMaximized;
  actToggleFullScreen.Checked := WindowState = wsFullScreen;
  //try ZEN mode
  if actToggleFullScreen.Checked then
  begin
    actPaletteToggle.Checked := pnlPalette.Visible;
    pnlPalette.Visible := False;
    actLayersToggle.Checked := pnlLayers.Visible;
    pnlLayers.Visible := False;
    pnlEditor.Visible := False;
    pnlTools.Visible := False;
  end
  else
  begin
    //back to normal mode
    pnlPalette.Visible := actPaletteToggle.Checked;
    pnlLayers.Visible := actLayersToggle.Checked;
    pnlEditor.Visible := True;
    pnlTools.Visible := True;
  end;
end;

procedure TfrmMain.actZoomInExecute(Sender: TObject);
begin
  if not Assigned(FrameGrid) then Exit;
  if FrameGrid.FrameZoom < 20 then FrameGrid.FrameZoom := FrameGrid.FrameZoom + 1;
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.actZoomOutExecute(Sender: TObject);
begin
  if not Assigned(FrameGrid) then Exit;
  if FrameGrid.FrameZoom > 0 then FrameGrid.FrameZoom := FrameGrid.FrameZoom - 1;
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.actZoomResetExecute(Sender: TObject);
begin
  if not Assigned(FrameGrid) then Exit;
  FrameGrid.FrameZoom := 0;
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

procedure TfrmMain.bbtnGridToggleClick(Sender: TObject);
begin
  actGridToggleExecute(Sender);
end;

procedure TfrmMain.bbtnMergeLayersClick(Sender: TObject);
begin
  actMergeLayersExecute(Sender);
end;

procedure TfrmMain.bbtnNewFrameClick(Sender: TObject);
begin
  actNewFrameExecute(Sender);
end;

procedure TfrmMain.bbtnOnionModeClick(Sender: TObject);
begin
  actOnionSkinExecute(Sender);
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
var
  cl: TBGRAPixel;
begin
  cl := spclBackColor;
  spclBackColor := spclForeColor;
  spclForeColor := cl;
  FgColor.Invalidate;
  BgColor.Invalidate;
end;

procedure TfrmMain.bbtnImportFrameClick(Sender: TObject);
begin
  actImportFrameExecute(Sender);
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
  i: integer;
begin
  mbColorPalettePreset.Colors.Clear;
  for i := 0 to Presets[cbPalettePresets.Text].Palette.Count - 1 do
    mbColorPalettePreset.Colors.Add(
      ColorToString(Presets[cbPalettePresets.Text].Palette.Color[i]));
  mbColorPalettePreset.Invalidate;
end;

procedure TfrmMain.cbPalettePresetsDrawItem(Control: TWinControl;
  Index: integer; ARect: TRect; State: TOwnerDrawState);
const
  MaxColorCount = 64;
var
  Count, I: integer;
  aColor: TBGRAPixel;
  OldColor: TColor;
  BoxWidth: integer;
begin
  TComboBox(Control).Canvas.FillRect(ARect);

  OldColor := TComboBox(Control).Canvas.Brush.Color;
  Count := Presets[TComboBox(Control).Items[Index]].Palette.Count;
  //if Count>MaxColorCount then Count:=MaxColorCount;
  if (Count <= (ARect.Width - 2)) then
  begin

    BoxWidth := (ARect.Width - 2) div Count;
  end
  else
    BoxWidth := 1;
  for i := 0 to Count - 1 do
  begin
    aColor := Presets[TComboBox(Control).Items[Index]].Palette.Color[i];
    TComboBox(Control).Canvas.Brush.Color := aColor;
    TComboBox(Control).Canvas.FillRect(
      ARect.Left + I * BoxWidth + 2,
      ARect.Top + 1,
      ARect.Right - 1{ + (I + 1) * (MaxColorCount div Count) + 2},
      ARect.Bottom - 1
      );
  end;

  TComboBox(Control).Canvas.Brush.Color := OldColor;
  //ARect.Left := ARect.Left + MaxColorCount + 2;
  TComboBox(Control).Canvas.TextOut(ARect.Left, ARect.Top,
    TComboBox(Control).Items[Index]);

end;

procedure TfrmMain.drwgrdLayersDrawCell(Sender: TObject; aCol, aRow: integer;
  aRect: TRect; aState: TGridDrawState);
var
  aKey: string;
  cnt: integer;
begin
  if not Assigned(FrameGrid) then Exit;
  cnt := ProjectInfo.ActiveFrame.LayersList.Count;
  if aRow <> 0 then
  begin //draw header
    if aRow > cnt then Exit;
    aKey := ProjectInfo.ActiveFrame.LayersList.Strings[Cnt - aRow];
    if (ProjectInfo.ActiveFrame.Layers.IndexOf(aKey) = -1) then Exit;
    case aCol of
      0: begin
        //draw layer visibility icon
        if ProjectInfo.ActiveFrame.Layers[aKey].Visible then
          BGRAImageList24x24.Draw(drwgrdLayers.Canvas, aRect.Left, aRect.Top, 0)
        else
          BGRAImageList24x24.Draw(drwgrdLayers.Canvas, aRect.Left, aRect.Top, 1);
      end;
      1: begin
        //draw layer protection icon
        if ProjectInfo.ActiveFrame.Layers[aKey].Locked then
          BGRAImageList24x24.Draw(drwgrdLayers.Canvas, aRect.Left, aRect.Top, 3)
        else
          BGRAImageList24x24.Draw(drwgrdLayers.Canvas, aRect.Left, aRect.Top, 2);
      end;
      2: begin
        //draw layer name
        if aKey = ProjectInfo.ActiveFrame.ActiveLayer.LayerName then begin
          drwgrdLayers.Canvas.Font.Color := clRed;
          drwgrdLayers.Canvas.Font.Bold:=True;
        end
        else begin
          drwgrdLayers.Canvas.Font.Color := clWindowText;
          drwgrdLayers.Canvas.Font.Bold:=False;
        end;
        drwgrdLayers.Canvas.TextRect(aRect, aRect.Left, aRect.Top, aKey);
      end;
      3: begin
        //draw layer image
        ProjectInfo.ActiveFrame.Layers[aKey].Drawable.Draw(
          drwgrdLayers.Canvas, aRect, False);
      end;
    end;
  end;
end;

procedure TfrmMain.drwgrdLayersMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
var
  ACol, ARow: integer;
  ARect: TRect;
  aKey: string;
  cnt: integer;
begin
  if ((Button <> mbLeft) or (not Assigned(FrameGrid))) then Exit;
  with (Sender as TDrawGrid) do
  begin
    MouseToCell(X, Y, ACol, ARow);
    ARect := CellRect(ACol, ARow);
    if ((aRow = 0) or (Y > ARect.Bottom)) then Exit;
    cnt := ProjectInfo.ActiveFrame.LayersList.Count;
    aKey := ProjectInfo.ActiveFrame.LayersList.Strings[Cnt - aRow];
    if aKey = '' then Exit;

    case aCol of
      0: begin //change layer visibility
        ProjectInfo.ActiveFrame.Layers[aKey].Visible := not
          ProjectInfo.ActiveFrame.Layers[aKey].Visible;
      end;
      1: begin
        ProjectInfo.ActiveFrame.Layers[aKey].Locked := not
          ProjectInfo.ActiveFrame.Layers[aKey].Locked;
      end;
      2, 3: begin  //select active layer
        ProjectInfo.ActiveFrame.ActiveLayer := ProjectInfo.ActiveFrame.Layers[aKey];
      end;
    end;
    pbFrameDraw.Invalidate;
    FramePreview.Invalidate;
  end;
end;

procedure TfrmMain.actUndoExecute(Sender: TObject);
begin
  ProjectInfo.ActiveFrame.RestoreState;
  LayersChange;
end;

procedure TfrmMain.FgColorMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  case Button of
    mbLeft: begin
      if ColorDialog1.Execute then
      begin
        if (Sender as TBGRAGraphicControl).Tag = 1 then
          spclBackColor := ColorDialog1.Color
        else
          spclForeColor := ColorDialog1.Color;
        Palette.AddColor(ColorDialog1.Color);
        ToolOptions.Color := ColorDialog1.Color;
        frmMain.StatusBar1.Panels[0].Text := rsColors + IntToStr(Palette.Count);
        FgColor.Invalidate;
        //PaletteGrid.RenderAndDrawControl;
      end;
    end;
    mbRight: begin
      if (Sender as TBGRAGraphicControl).Tag = 1 then
        spclBackColor := BGRAPixelTransparent
      else
        spclForeColor := BGRAPixelTransparent;
      ToolOptions.Color := BGRAPixelTransparent;
      BgColor.Invalidate;
    end;
  end;
end;

procedure TfrmMain.FgColorPaint(Sender: TObject);
var
  cl: TBGRAPixel;
begin
  if (Sender as TBGRAGraphicControl).Tag = 1 then cl := spclBackColor
  else
    cl := spclForeColor;
  if cl = BGRAPixelTransparent then
  begin
    (Sender as TBGRAGraphicControl).Bitmap.DrawCheckers(
      Rect(2, 2, (Sender as TBGRAGraphicControl).Width - 2,
      (Sender as TBGRAGraphicControl).Height - 2),
      ColorToBGRA($BFBFBF),
      ColorToBGRA($FFFFFF), 4, 4);
    (Sender as TBGRAGraphicControl).Bitmap.Rectangle(
      Rect(2, 2, (Sender as TBGRAGraphicControl).Width - 2,
      (Sender as TBGRAGraphicControl).Height - 2), ColorToBGRA(clBlackOpaque));
  end
  else
    (Sender as TBGRAGraphicControl).Bitmap.FillRect(
      Rect(2, 2, (Sender as TBGRAGraphicControl).Width - 2,
      (Sender as TBGRAGraphicControl).Height - 2), ColorToBGRA(cl));
  frmMain.StatusBar1.Panels[1].Text := rsFG + IntToHex(spclForeColor) + rsBG +
    IntToHex(spclBackColor);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  JSONProp: TFilename;
  i: integer;
  aPreset: string;
begin
  Caption:=APP_NAME;
  JSONProp := UserSettingsPath + 'spedit.json';
  JSONPropStorage1.JSONFileName := JSONProp;
   {$IFDEF DEBUG}
   //DebugLn(DateTimeToStr(Now()),' In: frmMain.Create() JSONProp=',JSONProp);
   {$ENDIF}

  DetectPOLanguage(INI.ReadString('INTERFACE', 'L10n file', ''));
  //if checked create and  show  splashscreen
  if INI.ReadBool('INTERFACE', 'SHOWSPLASH', True) then
  begin
    frmAbout := TfrmAbout.Create(Application);
    frmAbout.Show;
  end;

  //default draw tool - pen
  DrawTool := TSPPen.Create;
  StatusBar1.Panels[4].Text := rsActiveTool + DrawTool.ToolName;
  JSONPropStorage1.Restore;

  //grid visibility
  actGridToggle.Checked := INI.ReadBool('INTERFACE', 'SHOWGRID', True);
  //palette preset load if directory selected
  if INI.ReadString('PRESETS', 'PALETTES', '') <> '' then
    LoadPresets(INI.ReadString('PRESETS', 'PALETTES', ''));
  Palette.Clear;
  aPreset := INI.ReadString('INTERFACE', 'PRESET', '');
  if aPreset <> '' then
  begin
    cbPalettePresets.ItemIndex := cbPalettePresets.Items.IndexOf(aPreset);
    cbPalettePresetsChange(Sender);
  end;
  CreateCursors;
  pbFrameDraw.Cursor := 1;
  fCheckers:=TBGRABitmap.Create;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  if cbPalettePresets.Items.Count > 0 then
    INI.WriteString('INTERFACE', 'PRESET', cbPalettePresets.Text);
  FreeAndNil(fCheckers);
  JSONPropStorage1.Save;
  FreeAndNil(DrawTool);
  if Assigned(frmAbout) then FreeAndNil(frmAbout);
end;

procedure TfrmMain.FormDropFiles(Sender: TObject; const FileNames: array of string);
begin
  if not Assigned(ProjectInfo) then Exit;
  ImportFrame(FileNames[0]);
end;

procedure TfrmMain.FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
var
  aPt: TPoint;
begin
  if not Assigned(FrameGrid) then Exit;
  aPt := FrameGrid.Offset;
  if ssShift in Shift then
  begin
    case Key of
      //10 px grid shift to selected direction
      VK_LEFT: begin
        FrameGrid.Offset.SetLocation(aPt.X - 10, aPt.Y);
      end;
      VK_RIGHT: begin
        FrameGrid.Offset.SetLocation(aPt.X + 10, aPt.Y);
      end;
      VK_UP: begin
        FrameGrid.Offset.SetLocation(aPt.X, aPt.Y - 10);
      end;
      VK_DOWN: begin
        FrameGrid.Offset.SetLocation(aPt.X, aPt.Y + 10);
      end;
      VK_R: begin
        //Shift+R filled rectangle tool
        sbFilledRect.Click;
      end;
      //Shift+NumPlus increase pen size
      VK_ADD: begin
        trkbrPenSize.Value := trkbrPenSize.Value + 1;
        trkbrPenSizeChange(Sender);
      end;
      //Shift+NumMinus decrease pen size
      VK_SUBTRACT: begin
        trkbrPenSize.Value := trkbrPenSize.Value - 1;
        trkbrPenSizeChange(Sender);
      end;
    end; //case

  end
  else//ssShift
  if Shift = [] then
  begin
    case Key of
      VK_F7: begin
         //toggle preview
        actPreviewToggleExecute(Sender);
      end;
      VK_P: begin
        //P key Pen tool
        sbPen.Click;
      end;
      VK_L: begin
        //L key Line tool
        sbLine.Click;
      end;
      VK_M: begin
        //M key Move tool
        sbMove.Click;
      end;
      VK_R: begin
        //R key Rectangle tool
        sbRect.Click;
      end;
      VK_C: begin
        //C key Cirkle tool
        sbCircle.Click;
      end;
      VK_F: begin
        //F key Flood fill tool
        sbFloodFill.Click;
      end;
      VK_E: begin
        //E key Eraser tool
        sbEracer.Click;
      end;
      VK_O: begin
        //O key Pipette tool (color picker)
        sbPipette.Click;
      end;
      VK_X: begin
        //X key Swap colors
        bbtnSwapColorsClick(Sender);
      end;
      VK_S: begin
        //S key Selection
        sbRectSelection.Click;
      end;
      //Esc for discard selection
      VK_ESCAPE: begin
        ToolOptions.IsSelection := False;
      end;
      //clear celected region if selection is active
      VK_DELETE: begin
        EraseSelection;
      end;
    end;
  end;

  pbFrameDraw.Invalidate;
  FramePreview.Invalidate;
  drwgrdLayers.Invalidate;
end;

procedure TfrmMain.FramePreviewClick(Sender: TObject);
begin
  actFrameExportPNGExecute(Sender);
end;

procedure TfrmMain.FramesChange;
begin
  if Assigned(ProjectInfo) then
    if ProjectInfo.FramesCount<>0 then begin
     drwgrdFrames.RowCount:=ProjectInfo.FramesCount;
     drwgrdFrames.Invalidate;
  end;
end;

procedure TfrmMain.HexaColorPicker1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if ssCtrl in Shift then SetSelectedColor(mbRight, HexaColorPicker1.SelectedColor)
  else
    SetSelectedColor(Button, HexaColorPicker1.SelectedColor);
  Palette.AddColor(HexaColorPicker1.SelectedColor);
end;

procedure TfrmMain.mbColorPalettePresetCellClick(Button: TMouseButton;
  Shift: TShiftState; Index: integer; AColor: TColor; var DontCheck: boolean);
begin
  if ssCtrl in Shift then SetSelectedColor(mbRight, AColor)
  else
    SetSelectedColor(Button, AColor);
end;

procedure TfrmMain.miAboutClick(Sender: TObject);
begin
  if not Assigned(frmAbout) then frmAbout := TfrmAbout.Create(Application);
  frmAbout.ShowModal;
  FreeAndNil(frmAbout);
end;

procedure TfrmMain.actImportPiskelExecute(Sender: TObject);
var
  canselect : Boolean;
  idx : Integer;
begin
  if not Assigned(ProjectInfo) then ProjectInfo := TSPProjectInfo.Create;
  dlgOpenProj.InitialDir := INI.ReadString('PATH', 'Piskel files', '');
  dlgOpenProj.DefaultExt:='.piskel';
  if dlgOpenProj.Execute then
  begin
    ProjectInfo.ImportPiskel(dlgOpenProj.FileName);
    ProjectInfo.Frames.Reindex;
    INI.WriteString('PATH', 'Piskel files', ExtractFilePath(dlgOpenProj.FileName));
    idx:=ProjectInfo.Frames.Names.IndexOf(ProjectInfo.ActiveFrame.FrameName);
    drwgrdFrames.RowCount:=ProjectInfo.FramesCount;
    drwgrdFramesSelectCell(Sender,0,idx,canselect);
    FramesChange;
  end;
end;

procedure TfrmMain.actImportSpritesExecute(Sender: TObject);
begin
  frmImportSheet.ShowOnTop;
end;

procedure TfrmMain.miRedoClick(Sender: TObject);
begin
  actRedoExecute(Sender);
end;

procedure TfrmMain.miSaveProjectAsClick(Sender: TObject);
var
  oldname : String;
begin
  if not Assigned(ProjectInfo) then Exit;
  oldname:=ProjectInfo.Filename;
  ProjectInfo.Filename := '';
  actSaveProjExecute(Sender);
  if ProjectInfo.Filename='' then ProjectInfo.Filename:=oldname;
end;

procedure TfrmMain.miUndoClick(Sender: TObject);
begin
  actUndoExecute(Sender);
end;

procedure TfrmMain.PaletteChange;
var
  i: integer;
begin
  mbPaletteGrid.Colors.Clear;
  for i := 0 to Palette.Count - 1 do
    mbPaletteGrid.Colors.Add(ColorToString(Palette.Color[i].ToColor));
end;

procedure TfrmMain.CreateCursors;
var
  aCur: TCursorImage;
  i: integer;
begin
  //create cursors from tool buttons images
  for i := 1 to 10 do
  begin
    aCur := TCursorImage.Create;
    aCur.LoadFromTyphonResource(IntToStr(i));
    aCur.HotSpot.Create(0, 15);
    Screen.Cursors[i] := aCur.ReleaseHandle;
    aCur.Free;
  end;
end;

procedure TfrmMain.ImportFrame(aFilename: TFilename);
var
  aPal: TPalette;
  i: integer;
begin
  ProjectInfo.Frames.CreateFromImage(aFilename);
  FreeAndNil(FrameGrid);

  FrameGrid:=TFrameGrid.Create(ProjectInfo.ActiveFrame.Width,
                               ProjectInfo.ActiveFrame.Height,4);
  FrameGrid.Offset := Point(0, 0);
  dx := 0;
  dy := 0;
  FramePreview.Width := ProjectInfo.ActiveFrame.Width;
  FramePreview.Height := ProjectInfo.ActiveFrame.Height;

  trkbrPenSize.MaxValue := (FrameGrid.FrameWidth + FrameGrid.FrameHeight) div 4;
  //todo: here add item to visual control for frames list
  //lbFrames.AddItem(ProjectInfo.ActiveFrame.FrameName, ProjectInfo.ActiveFrame);
  Palette.Clear;
  aPal.LoadFromImage(aFilename);
  for i := 0 to aPal.Count - 1 do Palette.AddColor(aPal.Color[i]);
  mbPaletteGrid.Colors.Clear;
  PaletteChange;
  LayersChange;
  FramesChange;
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.pbFrameDrawMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
var
  p: TPoint;
begin
  if not Assigned(FrameGrid) then Exit;
  if (DrawTool.ToolName <> rsRectangleSel) and (ToolOptions.IsSelection) then
  begin
    ProjectInfo.ActiveFrame.ActiveLayer.Drawable.ClipRect := ToolOptions.SelectionRect;
  end
  else
  begin
    ProjectInfo.ActiveFrame.ActiveLayer.Drawable.ClipRect :=
      Rect(0, 0, ProjectInfo.ActiveFrame.ActiveLayer.Drawable.Width,
      ProjectInfo.ActiveFrame.ActiveLayer.Drawable.Height);
  end;
  //if tool not pipette  Ctrl+mbLeft works like color picker
  if (DrawTool.ToolName <> rsPipette) and (Button = mbRight) then
  begin
    p := FrameGrid.Coords(x, y);
    spclForeColor := ProjectInfo.ActiveFrame.ActiveLayer.Drawable.GetPixel(p.X, p.Y);
    FgColor.Invalidate;
  end
  else
    case Button of
      mbLeft, mbRight: begin
        if ProjectInfo.ActiveFrame.ActiveLayer.Locked then
        begin
          ShowMessage(Format(rsLayerSIsLock,
            [ProjectInfo.ActiveFrame.ActiveLayer.LayerName]));
        end;
          fDrawGridMode := dgmDraw;
          p := FrameGrid.Coords(x, y);
          ToolOptions.PenSize := trkbrPenSize.Value;
          if Button = mbLeft then
            DrawTool.StartDraw(p.X, p.Y, Shift, Button, spclForeColor)
          else if Button = mbRight then
            DrawTool.StartDraw(p.X, p.Y, Shift, Button, spclBackColor);
        end;

      mbMiddle: begin   //start grid drag
        fDrawGridMode := dgmMove;
        dx := 0;
        dy := 0;
        startx := x;
        starty := y;
      end;
    end;
  pbFrameDraw.Invalidate;
  drwgrdLayers.Invalidate;
end;

procedure TfrmMain.pbFrameDrawMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: integer);
var
  p: TPoint;
begin
  if not Assigned(FrameGrid) then Exit;
  FrameGrid.CellCursor.Coords := FrameGrid.Coords(x, y);
  StatusBar1.Panels[3].Text :=
    'x=' + IntToStr(FrameGrid.CellCursor.X) + '/y=' + IntToStr(FrameGrid.CellCursor.y);
  if fDrawGridMode = dgmMove then
  begin //move grid inside paintbox
    dx := x - startx;
    dy := y - starty;
    startx := x;
    starty := y;
    FrameGrid.Offset := Point(dx, dy);
  end;
  if fDrawGridMode = dgmDraw then
  begin //draw if layer not locked
    if Assigned(DrawTool) then
    begin
      if ProjectInfo.ActiveFrame.ActiveLayer.Locked then Exit;
      p := FrameGrid.Coords(X, Y);
      DrawTool.MouseMove(p.X, p.Y);
      FramePreview.Invalidate;
    end;
  end;
  StatusBar1.Panels[0].Text := 'x=' + IntToStr(x) + '/y=' + IntToStr(y);
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.pbFrameDrawMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
var
  p: TPoint;
begin
  if not Assigned(FrameGrid) then Exit;
  fDrawGridMode := dgmNone;
  if ProjectInfo.ActiveFrame.ActiveLayer.Locked then Exit;
  if Assigned(DrawTool) then
  begin
    p := FrameGrid.Coords(X, Y);
    DrawTool.MouseUp(p.x, p.y, Shift);
    //check if current palette hasn't current color then add it
    if ToolOptions.Color <> BGRAPixelTransparent then
    begin
      Palette.AddColor(ToolOptions.Color);
      PaletteChange;
    end;
  end;
  //miUndo.Enabled:=UndoRedoManager.CanUndo;
  //miRedo.Enabled:=UndoRedoManager.CanRedo;
  pbFrameDraw.Invalidate;
  drwgrdLayers.Invalidate;
  if ssCtrl in Shift then FgColor.Invalidate;
  FramePreview.Invalidate;
  FramesChange;
end;

procedure TfrmMain.pbFrameDrawMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: boolean);
begin
  if not Assigned(FrameGrid) then Exit;
  if (ssCtrl in Shift) then actZoomOutExecute(Sender);
  if (ssAlt in Shift) then FrameGrid.CheckersSize := FrameGrid.CheckersSize - 1;
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.pbFrameDrawMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: boolean);
begin
  if not Assigned(FrameGrid) then Exit;
  if (ssCtrl in Shift) then actZoomInExecute(Sender);
  if (ssAlt in Shift) then FrameGrid.CheckersSize := FrameGrid.CheckersSize + 1;
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.pbFrameDrawPaint(Sender: TObject);
begin
  //draw here zoomed frame data
  if Assigned(FrameGrid) then
  begin
    FrameGrid.RenderAndDraw(pbFrameDraw.Canvas);
    fCheckers.DrawCheckers(Rect(0,0,fCheckers.Width-1,fCheckers.Height-1), $BFBFBF,
                       $FFFFFF);
    fCheckers.PutImage(0,0,ProjectInfo.ActiveFrame.Preview,dmDrawWithTransparency);
    FramePreview.Picture.Bitmap.Assign(fCheckers);
  end;
  StatusBar1.Panels[2].Text := 'w=' + IntToStr(pbFrameDraw.ClientWidth) +
    '/h=' + IntToStr(pbFrameDraw.ClientHeight);
end;

procedure TfrmMain.LayersChange;
begin
   if not Assigned(ProjectInfo) then Exit;
   if ProjectInfo.FramesCount=0 then Exit;
   ProjectInfo.ActiveFrame.ActiveLayer.Visible := True;
   drwgrdLayers.RowCount := ProjectInfo.ActiveFrame.LayersList.Count + 1;
   drwgrdLayers.Invalidate;
   pbFrameDraw.Invalidate;
   FramePreview.Invalidate;
end;

procedure TfrmMain.SetSelectedColor(const Button: TMouseButton; aColor: TBGRAPixel);
begin
  case Button of
    mbLeft: begin
      spclForeColor := aColor;
      FgColor.Invalidate;
    end;
    mbRight: begin
      spclBackColor := aColor;
      BgColor.Invalidate;
    end;
  end;
  ToolOptions.Color := aColor;
  Palette.AddColor(aColor);
  mbPaletteGrid.Invalidate;
end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
begin
  actPreviewToggleExecute(Sender);
end;

procedure TfrmMain.SpeedButton2Click(Sender: TObject);
begin
  actOnionSkinExecute(Sender);
end;

procedure TfrmMain.drwgrdFramesDrawCell(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
var
  aName : String;
begin
  if not Assigned(ProjectInfo) then Exit;
  aName:=ProjectInfo.Frames.Names.Strings[aRow];
  case aCol of
0:begin
  //show frame name
  if aName=ProjectInfo.ActiveFrame.FrameName
     then begin
       TDrawGrid(Sender).Canvas.Font.Color:=clRed;
       TDrawGrid(Sender).Canvas.Font.Bold:=True;
     end else begin
       TDrawGrid(Sender).Canvas.Font.Color:=clDefault;
       TDrawGrid(Sender).Canvas.Font.Bold:=False;
     end;
  TDrawGrid(Sender).Canvas.TextRect(aRect, aRect.Left, aRect.Top, aName);
end;
1:begin
  //show frame preview
   TDrawGrid(Sender).Canvas.Brush.Color:=clDefault;
   TDrawGrid(Sender).Canvas.FillRect(aRect);
   ProjectInfo.Frames[aName].Preview.Draw(TDrawGrid(Sender).Canvas,aRect,False);
  end;
  end;
end;

procedure TfrmMain.drwgrdFramesSelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);
begin
  if not Assigned(ProjectInfo) then Exit;

  ProjectInfo.ActiveFrame:=ProjectInfo.Frames[ProjectInfo.Frames.Names.Strings[aRow]];
  ProjectInfo.ActiveFrame.UseOnionSkin:=actOnionSkin.Checked;
  FreeAndNil(FrameGrid);
  FrameGrid:=TFrameGrid.Create(ProjectInfo.ActiveFrame.Width,
                               ProjectInfo.ActiveFrame.Height);
  fCheckers.SetSize(ProjectInfo.ActiveFrame.Width,
                               ProjectInfo.ActiveFrame.Height);
  LayersChange;
  FramesChange;
end;

procedure TfrmMain.LoadPresets(aDir: string);
var
  i: integer;
begin
  cbPalettePresets.Clear;
  ReloadPresets(aDir);
  if Presets.Count > 0 then
  begin
    for i := 0 to Presets.Count - 1 do
    begin
      cbPalettePresets.Items.Add(Presets.Keys[i]);
     {$IFDEF DEBUG}
     // DebugLn('In: LoadPresets preset name: ', Presets.Keys[i], ' '
      //  +'Colors: '+IntToStr(Presets[Presets.Keys[i]].Palette.Count));
     {$ENDIF}
    end;
  end;
  cbPalettePresets.ItemIndex := 0;
  cbPalettePresetsChange(Self);
end;

procedure TfrmMain.lwFramesColumnClick(Sender: TObject; Column: TListColumn);
begin
  //todo: save current frame and load selected
end;

procedure TfrmMain.sbPenClick(Sender: TObject);
begin
  if not Assigned(FrameGrid) then
  begin
    sbPen.Down := True;
    Exit;
  end;
  if Assigned(DrawTool) then FreeAndNil(DrawTool);
  case (Sender as TSpeedButton).Tag of
    1: DrawTool := TSPPen.Create;
    2: DrawTool := TSPLine.Create;
    3: DrawTool := TSPEraser.Create;
    4: DrawTool := TSPPipette.Create;
    5: DrawTool := TSPRect.Create;
    6: DrawTool := TSPFilledRect.Create;
    7: DrawTool := TSPCircle.Create;
    8: DrawTool := TSPFloodFill.Create;
    9: DrawTool := TSPSelection.Create;
    10: DrawTool := TSPMove.Create
    else
    begin
      ShowMessage(rsThisToolWill);
      DrawTool := TSPPen.Create;
      sbPen.Down := True;
    end;
  end;
  trkbrPenSize.Value := ToolOptions.PenSize;
  (Sender as TSpeedButton).Down := True;
  pbFrameDraw.Cursor := TSpeedButton(Sender).Tag;
  StatusBar1.Panels[4].Text := rsActiveTool + DrawTool.ToolName;
end;

procedure TfrmMain.trkbrPenSizeChange(Sender: TObject);
begin
  FrameGrid.CellCursor.CursorSize := trkbrPenSize.Value;
  pbFrameDraw.Invalidate;
end;

initialization
{$I cursors.ctrs}

end.
