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
  {$IFDEF DEBUG}LazLoggerBase,{$ENDIF}
  uglobals, SysUtils, Classes, Forms, Controls, Menus, ExtDlgs, ComCtrls,
  Dialogs, ExtCtrls, Types, Graphics, StdCtrls, Buttons, ValEdit,
  BGRAGraphicControl,BGRAImageList, BGRAImageManipulation, BGRABitmapTypes,
  BGRABitmap, LCLType, DefaultTranslator, gettext, Translations,
  BCGameGrid, Grids;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    bbtnAddLayer: TBitBtn;
    bbtnCopyLayer: TBitBtn;
    bbtnDeleteLayer: TBitBtn;
    bbtnMergeLayers: TBitBtn;
    bbtnSwapColors: TBitBtn;
    BgColor: TBGRAGraphicControl;
    BGRAImageList24x24: TBGRAImageList;
    ColorDialog1: TColorDialog;
    DrawToolsFlowPanel: TFlowPanel;
    drwgrdLayers: TDrawGrid;
    FgColor: TBGRAGraphicControl;
    LayersFlowPanel: TFlowPanel;
    LayersGroupBox: TGroupBox;
    lbFrames: TListBox;
    miFullScreen: TMenuItem;
    PaletteGrid: TBCGameGrid;
    pnlLayers: TPanel;
    pnlFrames: TPanel;
    pnlDrawTools: TPanel;
    pnlPalette: TPanel;
    BitBtnImportFrame: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    miRedo: TMenuItem;
    miUndo: TMenuItem;
    opndlgLocalization: TOpenDialog;
    sbCircle: TSpeedButton;
    sbEracer: TSpeedButton;
    sbFilledRect: TSpeedButton;
    sbLine: TSpeedButton;
    sbPen: TSpeedButton;
    sbPipette: TSpeedButton;
    sbRect: TSpeedButton;
    sbFrames: TScrollBox;
    Separator3: TMenuItem;
    Separator4: TMenuItem;
    Splitter1: TSplitter;
    trkbrPenSize: TTrackBar;
    ViewSettingsMenuItem: TMenuItem;
    Separator2: TMenuItem;
    LanguageMenuItem: TMenuItem;
    ReferenseImageMenuItem: TMenuItem;
    PreviewMenuItem: TMenuItem;
    pbFrameDraw: TPaintBox;
    BitBtnLayers: TBitBtn;
    miPaletteImportFromFile: TMenuItem;
    SavePaletteDialog: TSaveDialog;
    Separator1: TMenuItem;
    miPaletteClear: TMenuItem;
    miPaletteSaveToFile: TMenuItem;
    miPaletteLoadFromFile: TMenuItem;
    OpenPaletteDialog: TOpenDialog;
    BitBtnNewFrame: TBitBtn;
    FrameFlowPanel: TFlowPanel;
    ProjectSheet: TBGRAImageManipulation;
    ButtonsImageList: TBGRAImageList;
    FrameEditorTabSheet: TTabSheet;
    MainMenu1: TMainMenu;
    FileMenuItem: TMenuItem;
    EditMenuItem: TMenuItem;
    FileNewSpriteMenuItem: TMenuItem;
    FileLoadSpritesheetMenuItem: TMenuItem;
    FileSaveSpriteMenuItem: TMenuItem;
    FileSaveAsMenuItem: TMenuItem;
    FileExitMenuItem: TMenuItem;
    HelpMenuItem: TMenuItem;
    AboutMenuItem: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    LayersToolVisibleMenuItem: TMenuItem;
    ProjectButtonsPanel: TPanel;
    ActionsButtonsPanel: TPanel;
    ScrollBox4: TScrollBox;
    SaveSpriteLibMenuItem: TMenuItem;
    SelectSpriteLibMenuItem: TMenuItem;
    MenuItem7: TMenuItem;
    N3: TMenuItem;
    MainPageControl: TPageControl;
    ProjectTabSheet: TTabSheet;
    ActionsTabSheet: TTabSheet;
    StatusBar1: TStatusBar;
    FramesMenuItem: TMenuItem;
    PaintToolPanelVisibleMenuItem: TMenuItem;
    N2: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    ProjectProperties: TValueListEditor;
    ViewZoomResetMenuItem: TMenuItem;
    ViewZoomOutMenuItem: TMenuItem;
    ViewZoomInMenuItem: TMenuItem;
    N1: TMenuItem;
    ViewMenuItem: TMenuItem;
    procedure AboutMenuItemClick(Sender: TObject);
    procedure bbtnAddLayerClick(Sender: TObject);
    procedure bbtnCopyLayerClick(Sender: TObject);
    procedure bbtnDeleteLayerClick(Sender: TObject);
    procedure bbtnSwapColorsClick(Sender: TObject);
    procedure BitBtnImportFrameClick(Sender: TObject);
    procedure BitBtnLayersClick(Sender: TObject);
    procedure BitBtnNewFrameClick(Sender: TObject);
    procedure drwgrdLayersDblClick(Sender: TObject);
    procedure drwgrdLayersDrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure drwgrdLayersSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure FgColorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FgColorPaint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormPaint(Sender: TObject);
    procedure FramesMenuItemClick(Sender: TObject);
    procedure LanguageMenuItemClick(Sender: TObject);
    procedure miFullScreenClick(Sender: TObject);
    procedure miPaletteClearClick(Sender: TObject);
    procedure miPaletteImportFromFileClick(Sender: TObject);
    procedure miPaletteLoadFromFileClick(Sender: TObject);
    procedure miPaletteSaveToFileClick(Sender: TObject);
    procedure miRedoClick(Sender: TObject);
    procedure miUndoClick(Sender: TObject);
    procedure PaintToolPanelVisibleMenuItemClick(Sender: TObject);
    procedure PaletteGridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaletteGridRenderControl(Sender: TObject; Bitmap: TBGRABitmap;
      r: TRect; n, x, y: integer);
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
    procedure FormCreate(Sender: TObject);
    procedure pnlPaletteMouseLeave(Sender: TObject);
    procedure PreviewMenuItemClick(Sender: TObject);
    procedure ReferenseImageMenuItemClick(Sender: TObject);
    procedure SaveSpriteLibMenuItemClick(Sender: TObject);
    procedure sbPenClick(Sender: TObject);
    procedure SrcImageFramesOptsValueListEditorValidate(Sender: TObject; ACol, ARow: longint; const KeyName, KeyValue: string);
    procedure trkbrPenSizeChange(Sender: TObject);
    procedure ViewZoomInMenuItemClick(Sender: TObject);
    procedure ViewZoomOutMenuItemClick(Sender: TObject);
    procedure ViewZoomResetMenuItemClick(Sender: TObject);
    procedure HideWindows;
    procedure ShowWindows;
  private
   fDrawGridMode : TDrawGridMode;
   dx,dy : Integer;             //offset to move grid
   startx,starty : Integer;     //start position to move

  end;

var
  frmMain: TfrmMain;


implementation

uses uabout, uframedlg, upreview,
  ureferense, udraw;

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.AboutMenuItemClick(Sender: TObject);
begin
  if not Assigned(frmAbout) then frmAbout:= TfrmAbout.Create(Application);
  frmMain.HideWindows;
     frmAbout.ShowModal;
  frmMain.ShowWindows;
  FreeAndNil(frmAbout);
end;

procedure TfrmMain.bbtnAddLayerClick(Sender: TObject);
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

procedure TfrmMain.bbtnCopyLayerClick(Sender: TObject);
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

procedure TfrmMain.bbtnDeleteLayerClick(Sender: TObject);
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

procedure TfrmMain.bbtnSwapColorsClick(Sender: TObject);
var cl : TBGRAPixel;
begin
   cl := spclBackColor;
   spclBackColor:=spclForeColor;
   spclForeColor:=cl;
end;

procedure TfrmMain.BitBtnImportFrameClick(Sender: TObject);
begin
  HideWindows;
  if OpenPictureDialog1.Execute then begin
   FreeAndNil(FrameGrid);
   FrameGrid:=TFrameGrid.Create(OpenPictureDialog1.FileName);
   FrameGrid.Offset:=Point(0,0);
   dx:=0;
   dy:=0;
   if Assigned(FrmPreview) then begin
    FrmPreview.FramePreview.Width:=FrameGrid.FrameWidth;
    FrmPreview.FramePreview.Height:=FrameGrid.FrameHeight;
   end;
  end;
  ShowWindows;
end;

procedure TfrmMain.BitBtnLayersClick(Sender: TObject);
begin
  pnlLayers.Visible:=not pnlLayers.Visible;
end;

procedure TfrmMain.BitBtnNewFrameClick(Sender: TObject);
var
  i: Integer;
begin
  //show dialog to create new frame with default parameters
  if Assigned(FrameGrid) then begin
   frmFrameDlg.spnedtHeight.Value:=FrameGrid.FrameHeight;
   frmFrameDlg.spnedtWidth.Value:=FrameGrid.FrameWidth;
   frmFrameDlg.edtFrameName.Text:=FrameGrid.ActiveFrame;
  end;
  HideWindows;
  frmFrameDlg.isOk:=False;
  frmFrameDlg.ShowModal;
  if frmFrameDlg.isOk then begin
   FreeAndNil(FrameGrid);
   FrameGrid:=TFrameGrid.Create(frmFrameDlg.spnedtWidth.Value,frmFrameDlg.spnedtHeight.Value);
   FrameGrid.Offset:=Point(0,0);
   dx:=0;
   dy:=0;
   if Assigned(FrmPreview) then begin
    FrmPreview.FramePreview.Width:=FrameGrid.FrameWidth;
    FrmPreview.FramePreview.Height:=FrameGrid.FrameHeight;
   end;
   Frames[frmFrameDlg.edtFrameName.Text]:=TSPFrame.Create(frmFrameDlg.edtFrameName.Text,
                                                          FrmPreview.FramePreview.Width,
                                                          FrmPreview.FramePreview.Height);
   Frames[frmFrameDlg.edtFrameName.Text].AddLayer(cINTERNALLAYERANDFRAME);
   Layers[cINTERNALLAYERANDFRAME].AddToFrame(frmFrameDlg.edtFrameName.Text);
   //todo: copy all layers to new frame if option checked
   for i:=0 to Layers.Count-1 do Layers.Data[i].Resize(FrameGrid.FrameWidth,FrameGrid.FrameHeight);
   FrameGrid.ActiveFrame:=frmFrameDlg.edtFrameName.Text;
   FrameGrid.ActiveLayer:=cINTERNALLAYERANDFRAME;
   trkbrPenSize.Max:=(FrameGrid.FrameWidth+FrameGrid.FrameHeight) div 4;
   if Assigned(FrameGrid) then ShowWindows;
  end;
  Invalidate;
end;

procedure TfrmMain.drwgrdLayersDblClick(Sender: TObject);
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

procedure TfrmMain.drwgrdLayersDrawCell(Sender: TObject; aCol, aRow: Integer;
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
  frmMain.Invalidate;
  frmMain.SetFocus;
end;

procedure TfrmMain.FgColorMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case Button of
  mbLeft: begin
           frmMain.HideWindows;
           if ColorDialog1.Execute then begin
              if (Sender as TBGRAGraphicControl).Tag=1 then spclBackColor:=ColorDialog1.Color
              else spclForeColor:=ColorDialog1.Color;
              Palette.AddColor(ColorDialog1.Color);
              ToolOptions.Color:=ColorDialog1.Color;
              frmMain.StatusBar1.Panels[0].Text:=rsColors+IntToStr(Palette.Count);
              //PaletteGrid.RenderAndDrawControl;
           end;
           frmMain.ShowWindows;
          end;
  mbRight:begin
           if (Sender as TBGRAGraphicControl).Tag=1 then spclBackColor:=BGRAPixelTransparent
              else spclForeColor:=BGRAPixelTransparent;
             ToolOptions.Color:=BGRAPixelTransparent;

  end;
end;
  FgColorPaint(Sender);
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
  Invalidate;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin

  FreeAndNil(DrawTool);

  //save forms size and position
  INI.WriteInteger('FRMMAIN','TOP',frmMain.Top);
  INI.WriteInteger('FRMMAIN','LEFT',frmMain.Left);
  INI.WriteInteger('FRMMAIN','WIDTH',frmMain.Width);
  INI.WriteInteger('FRMMAIN','HEIGHT',frmMain.Height);

  INI.WriteBool('FRMPREVIEW','VISIBLE',PreviewMenuItem.Checked);

  if Assigned(frmAbout) then FreeAndNil(frmAbout);
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

 procedure DrawToCursor(aColor : TBGRAPixel; ErasePixels : Boolean = False);
 //draw or erace pixels in CellCursor selected region
 var
   i, j: Integer;
 begin
  if FrameGrid.CellCursor.CursorSize=1 then begin
     if ErasePixels then Layers[FrameGrid.ActiveLayer].Drawable.ErasePixel(FrameGrid.CellCursor.Coords.X,FrameGrid.CellCursor.Coords.Y,255)
                    else Layers[FrameGrid.ActiveLayer].Drawable.DrawPixel(FrameGrid.CellCursor.Coords.X,FrameGrid.CellCursor.Coords.Y,aColor);
 end else begin
  for i:= 0 to FrameGrid.CellCursor.CursorSize-1 do
    for j:=0 to FrameGrid.CellCursor.CursorSize-1 do begin
       if ErasePixels then Layers[FrameGrid.ActiveLayer].Drawable.ErasePixel(FrameGrid.CellCursor.Coords.X+i,FrameGrid.CellCursor.Coords.Y+j,255)
                    else Layers[FrameGrid.ActiveLayer].Drawable.DrawPixel(FrameGrid.CellCursor.Coords.X+i,FrameGrid.CellCursor.Coords.Y+j,aColor);
    end;
  end;
 end;

begin
  //if in Frame Editor mode
  if MainPageControl.ActivePage.Tag=1 then begin
   if not Assigned(FrameGrid) then Exit;
    case Key of
     //when arrow keys pressed move cell cursor in drawing grid
      VK_LEFT : begin
        if FrameGrid.CellCursor.X=0 then FrameGrid.CellCursor.X:=FrameGrid.FrameWidth-1 else
           FrameGrid.CellCursor.X:=FrameGrid.CellCursor.X-1;
        Key:=0;
      end;
      VK_RIGHT : begin
        if FrameGrid.CellCursor.X=(FrameGrid.FrameWidth-1) then FrameGrid.CellCursor.X:=0 else
           FrameGrid.CellCursor.X:=FrameGrid.CellCursor.X+1;
        //need to block change tab
        Key:=0;
      end;
      VK_UP : begin
        if FrameGrid.CellCursor.Y=0 then FrameGrid.CellCursor.Y:=FrameGrid.FrameHeight-1 else
           FrameGrid.CellCursor.y:=FrameGrid.CellCursor.y-1;
        Key:=0;
      end;
      VK_DOWN : begin
        if FrameGrid.CellCursor.Y=(FrameGrid.FrameHeight-1) then FrameGrid.CellCursor.Y:=0 else
        FrameGrid.CellCursor.Y:=FrameGrid.CellCursor.Y+1;
        Key:=0;
      end;
      //next keys can be used to drawing
       VK_SPACE : begin
      //draw pixels depends on selected cursor size - first color
        DrawToCursor(spclForeColor);
        Key:=0;
       end;
       VK_RETURN : begin
      //draw pixels depends on selected cursor size - second color
        DrawToCursor(spclBackColor);
        Key:=0;
       end;
       //just set pixel to background by setting opacity to 0
       VK_DELETE : begin
      //erace pixels to transparent
        DrawToCursor(spclForeColor,True);
        Key:=0;
       end;
     //swap colors
     VK_X: begin
       bbtnSwapColorsClick(Sender);
       Key:=0;
      end;
     //show/hide preview window
       VK_F7: begin
        PreviewMenuItemClick(Sender);
       end;
     //show/hide Frames window
      VK_F: begin
       if (ssShift in Shift) then FramesMenuItemClick(Sender);
      end;
    end;
    pbFrameDraw.Invalidate;
  end;
end;

procedure TfrmMain.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Invalidate;
end;

procedure TfrmMain.FormPaint(Sender: TObject);
begin
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.FramesMenuItemClick(Sender: TObject);
begin
 pnlFrames.Visible:= not pnlFrames.Visible;
 FramesMenuItem.Checked:=pnlFrames.Visible;
end;

procedure TfrmMain.HideWindows;
begin
  FrmPreview.Hide;
  if Assigned(frmReferense) then frmReferense.Hide;
end;

procedure TfrmMain.LanguageMenuItemClick(Sender: TObject);
begin
  opndlgLocalization.InitialDir:=INI.ReadString('INTERFACE','LOCALES','');
  HideWindows;
  if opndlgLocalization.Execute then begin
    INI.WriteString('INTERFACE','LOCALES',ExtractFilePath(opndlgLocalization.FileName));
    INI.WriteString('INTERFACE','L10n file',opndlgLocalization.FileName);
    INI.WriteString('INTERFACE','LANGUAGE',DetectPOLanguage(opndlgLocalization.FileName));
  end;
  ShowWindows;
end;

procedure TfrmMain.miFullScreenClick(Sender: TObject);
begin
  if WindowState<>wsFullScreen then WindowState:=wsFullScreen
     else WindowState:=wsMaximized;
end;

procedure TfrmMain.miPaletteClearClick(Sender: TObject);
begin
  if MessageDlg(rsWarning, rsPaletteWillB, mtWarning, mbYesNo, '')=mrYes
    then Palette.Reset;
  PaletteGrid.RenderAndDrawControl;
end;

procedure TfrmMain.miPaletteImportFromFileClick(Sender: TObject);
label stop;
var
    img : TBGRABitmap;
    w,h , i, j: Integer;
begin
  HideWindows;
  if OpenPictureDialog1.Execute then begin
   img:=TBGRABitmap.Create(OpenPictureDialog1.FileName);
   w:=img.Width-1;
   h:=img.Height-1;
   Palette.Clear;
   for i :=0 to w do
     for j:=0 to h do begin
       if Palette.AddColor(FPColorToBGRA(img.Colors[i,j]))=-1 then begin
        ShowMessage(rsImageHasTooM);
        Palette.Reset;
        goto stop;
       end;
     end;
stop:
   FreeAndNil(img);
  PaletteGrid.RenderAndDrawControl;
  end;
  ShowWindows;
end;

procedure TfrmMain.miPaletteLoadFromFileClick(Sender: TObject);
begin
  if OpenPaletteDialog.Execute then begin
    Palette.LoadFromFile(OpenPaletteDialog.FileName);
  end;
 PaletteGrid.RenderAndDrawControl;
end;

procedure TfrmMain.miPaletteSaveToFileClick(Sender: TObject);
begin
  if SavePaletteDialog.Execute then begin
    Palette.SaveToFile(SavePaletteDialog.FileName);
  end;
end;

procedure TfrmMain.miRedoClick(Sender: TObject);
begin
 UndoRedoManager.Redo;
 Invalidate;
end;

procedure TfrmMain.miUndoClick(Sender: TObject);
begin
  UndoRedoManager.Undo;
  Invalidate;
end;

procedure TfrmMain.PaintToolPanelVisibleMenuItemClick(Sender: TObject);
begin
  pnlPalette.Visible:= not pnlPalette.Visible;
end;

procedure TfrmMain.PaletteGridMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var xx,yy,n : Integer;
begin
  xx:=x div PaletteGrid.BlockWidth+1;
  yy:=y div PaletteGrid.BlockHeight+1;
  n := xx-PaletteGrid.GridWidth+yy*PaletteGrid.GridWidth-1;
  if n>Palette.Count then Exit;
  Palette.SelectColor(n);
  case Button of
    mbLeft:begin
     spclForeColor:=Palette.SelectedColor;
     //todo: fix when refactored
     //FgColor.Invalidate;
    end;
    mbRight:begin
     spclBackColor:=Palette.SelectedColor;
     //todo: fix when refactored
     //BgColor.Invalidate;
    end;
  end;
  ToolOptions.Color:=Palette.SelectedColor;
end;

procedure TfrmMain.PaletteGridRenderControl(Sender: TObject;
  Bitmap: TBGRABitmap; r: TRect; n, x, y: integer);
var c : TBGRAPixel;
begin
  if (n>Palette.Count-1) then begin
   c:=BGRAPixelTransparent;
   end  else begin
     c := palette.Color[n];
   end;
  Bitmap.Rectangle(r,c,c,dmSet);
end;

procedure TfrmMain.pbFrameDrawMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 var p : TPoint;
begin
  if not Assigned(FrameGrid) then Exit;
  case Button of
    mbLeft,mbRight:begin
     if Layers[FrameGrid.ActiveLayer].Locked then begin
      ShowMessage(Format(rsLayerSIsLock, [FrameGrid.ActiveLayer]))
     end;
     if Assigned(DrawTool) and (FrameGrid.HasCoords(Point(x,y))) then begin
      fDrawGridMode:=dgmDraw;
      p:=FrameGrid.Coords(x,y);
       ToolOptions.PenSize:=trkbrPenSize.Position;
       if Button=mbLeft then
          DrawTool.StartDraw(p.X,p.Y,Shift,Button, spclForeColor)
       else if Button=mbRight then
          DrawTool.StartDraw(p.X,p.Y,Shift,Button,spclBackColor);
       pbFrameDraw.Invalidate;
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
    if Assigned(DrawTool) and ( FrameGrid.HasCoords(Point(X,Y))) then begin
     if Layers[FrameGrid.ActiveLayer].Locked then Exit;
     p:=FrameGrid.Coords(X,Y);
     DrawTool.MouseMove(p.X,p.Y);
    end;
   end;
   StatusBar1.Panels[0].Text:='x='+IntToStr(x)+'/y='+IntToStr(y);
   Invalidate;
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
  end;
  if Assigned(FrmPreview) then FrmPreview.FramePreview.Invalidate;
  Invalidate;
end;

procedure TfrmMain.pbFrameDrawMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  if not Assigned(FrameGrid) then Exit;
  if (ssCtrl in Shift) then ViewZoomOutMenuItemClick(Sender);
  if (ssAlt in Shift) then FrameGrid.CheckersSize:=FrameGrid.CheckersSize-1;
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.pbFrameDrawMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  if not Assigned(FrameGrid) then Exit;
  if (ssCtrl in Shift) then ViewZoomInMenuItemClick(Sender);
  if (ssAlt in Shift) then FrameGrid.CheckersSize:=FrameGrid.CheckersSize+1;
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.pbFrameDrawPaint(Sender: TObject);
begin
   //draw here zoomed frame data
  if Assigned(FrameGrid) then begin
    FrameGrid.RenderAndDraw(pbFrameDraw.Canvas);
    if Assigned(FrmPreview) then
     FrameGrid.RenderPicture(FrmPreview.FramePreview.Canvas);
  end;
  StatusBar1.Panels[2].Text:='w='+IntToStr(pbFrameDraw.ClientWidth)+'/h='+IntToStr(pbFrameDraw.ClientHeight);
end;

procedure TfrmMain.pnlPaletteMouseLeave(Sender: TObject);
begin
  pnlPalette.Visible:=False;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  //because sometimes this property resets to fsStayOnTop and main window shown over the tools windows
  FormStyle:=fsNormal;

  DetectPOLanguage(INI.ReadString('INTERFACE','L10n file',''));
  //if checked create and  show  splashscreen
   if INI.ReadBool('INTERFACE', 'SHOWSPLASH', true) then begin
     frmAbout:= TfrmAbout.Create(Application);
     frmAbout.Show;
   end;

  //load form size and position from settings
  frmMain.Top:=INI.ReadInteger('FRMMAIN','TOP',frmMain.Top);
  frmMain.Left:=INI.ReadInteger('FRMMAIN','LEFT',frmMain.Left);
  frmMain.Width:=INI.ReadInteger('FRMMAIN','WIDTH',frmMain.Width);
  frmMain.Height:=INI.ReadInteger('FRMMAIN','HEIGHT',frmMain.Height);

   //preview form
  if INI.ReadBool('FRMPREVIEW','VISIBLE',False) then PreviewMenuItemClick(Sender)
     else PreviewMenuItem.Checked:=False;

  MainPageControl.ActivePageIndex := 0;

  //default draw tool - pen
  DrawTool:=TSPPen.Create;
  StatusBar1.Panels[4].Text:=rsActiveTool+DrawTool.ToolName;

end;

procedure TfrmMain.PreviewMenuItemClick(Sender: TObject);
begin
  //preview form
 if not Assigned(FrmPreview) then Exit;
 FrmPreview.Visible:=not FrmPreview.Visible;
 PreviewMenuItem.Checked:=FrmPreview.Visible;
end;

procedure TfrmMain.ReferenseImageMenuItemClick(Sender: TObject);
begin
 if not Assigned(frmReferense) then begin
  //referense image form
  frmReferense:=TfrmReferense.Create(self);
  frmReferense.Top:=INI.ReadInteger('FRMREFERENSE','TOP',frmReferense.Top);
  frmReferense.Left:=INI.ReadInteger('FRMREFERENSE','LEFT',frmReferense.Left);
  frmReferense.Width:=INI.ReadInteger('FRMREFERENSE','WIDTH',frmReferense.Width);
  frmReferense.Height:=INI.ReadInteger('FRMREFERENSE','HEIGHT',frmReferense.Height);
 end;
 ReferenseImageMenuItem.Checked:=True;
 frmReferense.Show;
end;

procedure TfrmMain.SaveSpriteLibMenuItemClick(Sender: TObject);
begin
  if Trim(CurrentLibName) = '' then
    CurrentLibName := InputBox(rsPleaseInputN, CurrentLibName, 'default');
  libpath := SpriteLibPath + DirectorySeparator + CurrentLibName;
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
 4:begin
      DrawTool:=TSPPipette.Create;
 end;
 5:DrawTool:=TSPRect.Create;
 6:DrawTool:=TSPFilledRect.Create;
 7:DrawTool:=TSPCircle.Create
 else begin
      ShowMessage(rsThisToolWill);
      DrawTool:=TSPPen.Create;
      sbPen.Down:=True;
  end;
 end;
 StatusBar1.Panels[4].Text:=rsActiveTool+DrawTool.ToolName;
end;

procedure TfrmMain.ShowWindows;
begin
  if PreviewMenuItem.Checked then FrmPreview.Show;
  if ReferenseImageMenuItem.Checked then frmReferense.Show;
  Invalidate;
end;

procedure TfrmMain.SrcImageFramesOptsValueListEditorValidate(Sender: TObject; ACol, ARow: longint; const KeyName, KeyValue: string);
begin
  if KeyValue <> '' then
    if not IsDigits(KeyValue) then
    begin
      ShowMessage(QuotedStr(KeyName) + rsHasNonIntege);
    end;
end;

procedure TfrmMain.trkbrPenSizeChange(Sender: TObject);
begin
  FrameGrid.CellCursor.CursorSize:=trkbrPenSize.Position;
end;

procedure TfrmMain.ViewZoomInMenuItemClick(Sender: TObject);
begin
  if not Assigned(FrameGrid) then Exit;
  FrameGrid.FrameZoom:=FrameGrid.FrameZoom+1;
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.ViewZoomOutMenuItemClick(Sender: TObject);
begin
  if not Assigned(FrameGrid) then Exit;
  if FrameGrid.FrameZoom>0 then FrameGrid.FrameZoom:=FrameGrid.FrameZoom-1;
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.ViewZoomResetMenuItemClick(Sender: TObject);
begin
  if not Assigned(FrameGrid) then Exit;
  FrameGrid.FrameZoom:=0;
  pbFrameDraw.Invalidate;
end;

end.
