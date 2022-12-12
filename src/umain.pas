unit umain;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF DEBUG}LazLoggerBase,{$ENDIF} uglobals,
  Classes, SysUtils, Forms, Controls, Graphics, Types,
  Dialogs, Menus, ComCtrls, ExtCtrls, Buttons, ActnList, Grids,
  JSONPropStorage, ExtDlgs, StdCtrls, StdActns, LCLType,
  BGRAImageList, BGRAGraphicControl, BCGameGrid, BGRABitmapTypes, BGRABitmap;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    acImportFrame: TAction;
    actAddLayer: TAction;
    actDeleteLayer: TAction;
    actCopyLayer: TAction;
    actFramesToggle: TAction;
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
    ButtonsImageList: TBGRAImageList;
    ColorDialog1: TColorDialog;
    drwgrdLayers: TDrawGrid;
    actUndo: TEditUndo;
    FgColor: TBGRAGraphicControl;
    actExit: TFileExit;
    FramePreview: TPaintBox;
    GroupBox1: TGroupBox;
    JSONPropStorage1: TJSONPropStorage;
    LayersFlowPanel: TFlowPanel;
    LayersGroupBox: TGroupBox;
    miMergeLayers: TMenuItem;
    miCopyLayer: TMenuItem;
    miDeleteLayer: TMenuItem;
    miAddLayer: TMenuItem;
    OpenPaletteDialog: TOpenDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    opndlgLocalization: TOpenDialog;
    PaletteGrid: TBCGameGrid;
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
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    sdExportFrameSaveDialog: TSaveDialog;
    Separator1: TMenuItem;
    Separator2: TMenuItem;
    Separator3: TMenuItem;
    Separator4: TMenuItem;
    Separator5: TMenuItem;
    Separator6: TMenuItem;
    Separator7: TMenuItem;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    StatusBar1: TStatusBar;
    trkbrPenSize: TTrackBar;
    procedure actFramesToggleExecute(Sender: TObject);
    procedure actImportFrameExecute(Sender: TObject);
    procedure actAddLayerExecute(Sender: TObject);
    procedure actCopyLayerExecute(Sender: TObject);
    procedure actDeleteLayerExecute(Sender: TObject);
    procedure actLanguageSelectExecute(Sender: TObject);
    procedure actLayersToggleExecute(Sender: TObject);
    procedure actMergeLayersExecute(Sender: TObject);
    procedure actNewFrameExecute(Sender: TObject);
    procedure actPaletteImportExecute(Sender: TObject);
    procedure actPaletteLoadExecute(Sender: TObject);
    procedure actPaletteResetExecute(Sender: TObject);
    procedure actPaletteSaveExecute(Sender: TObject);
    procedure actPaletteToggleExecute(Sender: TObject);
    procedure actRedoExecute(Sender: TObject);
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
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FramePreviewClick(Sender: TObject);
    procedure FramePreviewPaint(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
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
    procedure sbPenClick(Sender: TObject);
  private
   fDrawGridMode : TDrawGridMode;
   dx,dy : Integer;             //offset to move grid
   startx,starty : Integer;     //start position to move

  public
  end;

var
  frmMain: TfrmMain;

procedure GetPaletteFromImage(aImg : TFilename);

implementation

uses udraw, uabout, uframedlg, ureferense;

procedure GetPaletteFromImage(aImg: TFilename);
label stop;
var
  j,i, h, w: Integer;
  img: TBGRABitmap;
begin
     img:=TBGRABitmap.Create(aImg);
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
end;

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.actImportFrameExecute(Sender: TObject);
begin
 if OpenPictureDialog1.Execute then begin
  FreeAndNil(FrameGrid);
  FrameGrid:=TFrameGrid.Create(OpenPictureDialog1.FileName);
  FrameGrid.Offset:=Point(0,0);
  dx:=0;
  dy:=0;
  FramePreview.Width:=FrameGrid.FrameWidth;
  FramePreview.Height:=FrameGrid.FrameHeight;
  GetPaletteFromImage(OpenPictureDialog1.FileName);
  PaletteGrid.RenderAndDrawControl;
 end;
end;

procedure TfrmMain.actFramesToggleExecute(Sender: TObject);
begin
    pnlFrames.Visible:=not pnlFrames.Visible;
    actFramesToggle.Checked:=pnlFrames.Visible;
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
   FrameGrid:=TFrameGrid.Create(frmFrameDlg.spnedtWidth.Value,frmFrameDlg.spnedtHeight.Value);
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
   trkbrPenSize.Max:=(FrameGrid.FrameWidth+FrameGrid.FrameHeight) div 4;
  end;
  frmMain.pbFrameDrawPaint(Sender);
end;

procedure TfrmMain.actPaletteImportExecute(Sender: TObject);
label stop;
begin
  if OpenPictureDialog1.Execute then begin
   GetPaletteFromImage(OpenPictureDialog1.FileName);
  PaletteGrid.RenderAndDrawControl;
  end;
end;

procedure TfrmMain.actPaletteLoadExecute(Sender: TObject);
begin
  if OpenPaletteDialog.Execute then begin
    Palette.LoadFromFile(OpenPaletteDialog.FileName);
  end;
 PaletteGrid.RenderAndDrawControl;
end;

procedure TfrmMain.actPaletteResetExecute(Sender: TObject);
begin
  if MessageDlg(rsWarning, rsPaletteWillB, mtWarning, mbYesNo, '')=mrYes
    then Palette.Reset;
  PaletteGrid.RenderAndDrawControl;
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
 Invalidate;
end;

procedure TfrmMain.actToggleFullScreenExecute(Sender: TObject);
begin
  if WindowState<>wsFullScreen then WindowState:=wsFullScreen
     else WindowState:=wsMaximized;
  actToggleFullScreen.Checked:=WindowState = wsMaximized;
end;

procedure TfrmMain.actZoomInExecute(Sender: TObject);
begin
  if not Assigned(FrameGrid) then Exit;
  FrameGrid.FrameZoom:=FrameGrid.FrameZoom+1;
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
 Invalidate;
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
             //PaletteGrid.RenderAndDrawControl;
          end;
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
  (Sender as TControl).Invalidate;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
   JSONProp : TFilename;
begin
   JSONProp:=UserSettingsPath+'spedit.json';
   JSONPropStorage1.JSONFileName:=JSONProp;
   {$IFDEF DEBUG}
   DebugLn(DateTimeToStr(Now()),' In: frmMain.Create() JSONProp=',JSONProp);
   {$ENDIF}
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
   miPreview.Checked:=INI.ReadBool('FRMPREVIEW','VISIBLE',False);

   //default draw tool - pen
   DrawTool:=TSPPen.Create;
   StatusBar1.Panels[4].Text:=rsActiveTool+DrawTool.ToolName;
   JSONPropStorage1.Restore;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
     JSONPropStorage1.Save;
     FreeAndNil(DrawTool);
     if Assigned(frmAbout) then FreeAndNil(frmAbout);
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if not Assigned(FrameGrid) then Exit;
  case Key of
VK_LEFT: begin
    if ssShift in Shift then begin
   FrameGrid.Offset.Add(Point(-10,0));
    end
    else if Shift=[] then begin
     FrameGrid.CellCursor.X:=FrameGrid.CellCursor.X-1;
    end;
  end;
VK_RIGHT: begin
    if ssShift in Shift then begin
   FrameGrid.Offset.Add(Point(10,0));
    end
    else if Shift=[] then begin
     FrameGrid.CellCursor.X:=FrameGrid.CellCursor.X+1;
    end;
  end;
VK_UP: begin
    if ssShift in Shift then begin
   FrameGrid.Offset.Add(Point(0,-10));
    end
    else if Shift=[] then begin
     FrameGrid.CellCursor.Y:=FrameGrid.CellCursor.Y-1;
    end;
  end;
VK_DOWN: begin
    if ssShift in Shift then begin
   FrameGrid.Offset.Add(Point(0,10));
    end
    else if Shift=[] then begin
     FrameGrid.CellCursor.y:=FrameGrid.CellCursor.y+1;
    end;
  end;
  end;
  Invalidate;
end;

procedure TfrmMain.FramePreviewClick(Sender: TObject);
begin
 sdExportFrameSaveDialog.InitialDir:=GetUserDir;
 sdExportFrameSaveDialog.FileName:=FrameGrid.ActiveFrame;
 if sdExportFrameSaveDialog.Execute then begin
   //save current frame to PNG file by default to user dir and with frame name
   FrameGrid.ExpotPng(sdExportFrameSaveDialog.FileName);
 end;
end;

procedure TfrmMain.FramePreviewPaint(Sender: TObject);
begin
 if Assigned(FrameGrid) then
  FrameGrid.RenderPicture(FramePreview.Canvas);
end;

procedure TfrmMain.miAboutClick(Sender: TObject);
begin
     if not Assigned(frmAbout) then frmAbout:= TfrmAbout.Create(Application);
     frmAbout.ShowModal;
     FreeAndNil(frmAbout);
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
     FgColor.Invalidate;
    end;
    mbRight:begin
     spclBackColor:=Palette.SelectedColor;
     //todo: fix when refactored
     BgColor.Invalidate;
    end;
  end;
  ToolOptions.Color:=Palette.SelectedColor;
   //todo: set this option in settings window
  //pnlPalette.Visible:=False;
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
  if Assigned(DrawTool) and ( FrameGrid.HasCoords(Point(X,Y))) then begin
   if Layers[FrameGrid.ActiveLayer].Locked then Exit;
   p:=FrameGrid.Coords(X,Y);
   DrawTool.MouseMove(p.X,p.Y);
  end;
 end;
 StatusBar1.Panels[0].Text:='x='+IntToStr(x)+'/y='+IntToStr(y);
 pbFrameDraw.Invalidate;
 drwgrdLayers.Invalidate;
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
  pbFrameDraw.Invalidate;
  drwgrdLayers.Invalidate;
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
    FrameGrid.RenderPicture(FramePreview.Canvas);
  end;
  StatusBar1.Panels[2].Text:='w='+IntToStr(pbFrameDraw.ClientWidth)+'/h='+IntToStr(pbFrameDraw.ClientHeight);
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

end.

