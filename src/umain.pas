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
  BGRAImageList, BGRAImageManipulation, BGRABitmapTypes, BGRABitmap,
  LCLType;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DrawToolsFlowPanel: TFlowPanel;
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
    sbEracer: TSpeedButton;
    sbPen: TSpeedButton;
    sbPipette: TSpeedButton;
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
    StaticText1: TStaticText;
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
    procedure BitBtnNewFrameClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FramesMenuItemClick(Sender: TObject);
    procedure LayersToolVisibleMenuItemClick(Sender: TObject);
    procedure miPaletteClearClick(Sender: TObject);
    procedure miPaletteImportFromFileClick(Sender: TObject);
    procedure miPaletteLoadFromFileClick(Sender: TObject);
    procedure miPaletteSaveToFileClick(Sender: TObject);
    procedure PaintToolPanelVisibleMenuItemClick(Sender: TObject);
    procedure pbFrameDrawDblClick(Sender: TObject);
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
    procedure PreviewMenuItemClick(Sender: TObject);
    procedure ReferenseImageMenuItemClick(Sender: TObject);
    procedure SaveSpriteLibMenuItemClick(Sender: TObject);
    procedure SrcImageFramesOptsValueListEditorValidate(Sender: TObject; ACol, ARow: longint; const KeyName, KeyValue: string);
    procedure ViewZoomInMenuItemClick(Sender: TObject);
    procedure ViewZoomOutMenuItemClick(Sender: TObject);
    procedure ViewZoomResetMenuItemClick(Sender: TObject);
  private
   fDrawGridMode : TDrawGridMode;
   dx,dy : Integer;             //offset to move grid
   startx,starty : Integer;     //start position to move
  end;

var
  frmMain: TfrmMain;


implementation

uses uzastavka, uframedlg, udrawtools, ulayers, uframes, upreview, ureferense, udraw;

{$R *.frm}

{ TfrmMain }

procedure TfrmMain.AboutMenuItemClick(Sender: TObject);
begin
  if not Assigned(frmZastavka) then frmZastavka:= TfrmZastavka.Create(Application);
     frmZastavka.ShowModal;
end;

procedure TfrmMain.BitBtnNewFrameClick(Sender: TObject);
var
  i: Integer;
begin
  //todo: show dialog to create new frame with default parameters
  frmFrameDlg:=TfrmFrameDlg.Create(Self);
  if Assigned(FrameGrid) then begin
   frmFrameDlg.spnedtHeight.Value:=FrameGrid.FrameHeight;
   frmFrameDlg.spnedtWidth.Value:=FrameGrid.FrameWidth;
   frmFrameDlg.edtFrameName.Text:=FrameGrid.ActiveFrame;
  end;
  if frmFrameDlg.Execute then begin
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
   //todo: copy all layers to new frame if option checked
   for i:=0 to Layers.Count-1 do Layers.Data[i].Resize(FrameGrid.FrameWidth,FrameGrid.FrameHeight);
   FrameGrid.ActiveFrame:=Frames.Keys[0];
   FrameGrid.ActiveLayer:=Layers.Keys[0];
   if Assigned(frmDrawTools.trkbrPenSize) then frmDrawTools.trkbrPenSize.Max:=(FrameGrid.FrameWidth+FrameGrid.FrameHeight) div 4;
   pbFrameDraw.Invalidate;
  end;
  FreeAndNil(frmFrameDlg);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  //save forms size and position
  INI.WriteInteger('FRMMAIN','TOP',frmMain.Top);
  INI.WriteInteger('FRMMAIN','LEFT',frmMain.Left);
  INI.WriteInteger('FRMMAIN','WIDTH',frmMain.Width);
  INI.WriteInteger('FRMMAIN','HEIGHT',frmMain.Height);

  if Assigned(frmDrawTools) then begin
   INI.WriteInteger('FRMDRAWTOOLS','TOP',frmDrawTools.Top);
   INI.WriteInteger('FRMDRAWTOOLS','LEFT',frmDrawTools.Left);
   INI.WriteInteger('FRMDRAWTOOLS','WIDTH',frmDrawTools.Width);
   INI.WriteInteger('FRMDRAWTOOLS','HEIGHT',frmDrawTools.Height);
   FreeAndNil(frmDrawTools);
  end;

  if Assigned(frmFrames) then begin
   INI.WriteInteger('FRMFRAMES','TOP',frmFrames.Top);
   INI.WriteInteger('FRMFRAMES','LEFT',frmFrames.Left);
   INI.WriteInteger('FRMFRAMES','WIDTH',frmFrames.Width);
   INI.WriteInteger('FRMFRAMES','HEIGHT',frmFrames.Height);
   FreeAndNil(frmFrames);
  end;

  if Assigned(frmLayers) then begin
   INI.WriteInteger('FRMLAYERS','TOP',frmLayers.Top);
   INI.WriteInteger('FRMLAYERS','LEFT',frmLayers.Left);
   INI.WriteInteger('FRMLAYERS','WIDTH',frmLayers.Width);
   INI.WriteInteger('FRMLAYERS','HEIGHT',frmLayers.Height);
   FreeAndNil(frmLayers);
  end;

  if Assigned(FrmPreview) then begin
   INI.WriteInteger('FRMPREVIEW','TOP',FrmPreview.Top);
   INI.WriteInteger('FRMPREVIEW','LEFT',FrmPreview.Left);
   INI.WriteInteger('FRMPREVIEW','WIDTH',FrmPreview.Width);
   INI.WriteInteger('FRMPREVIEW','HEIGHT',FrmPreview.Height);
   INI.WriteBool('FRMPREVIEW','VISIBLE',PreviewMenuItem.Checked);
   FreeAndNil(FrmPreview);
  end;

  if Assigned(frmReferense) then begin
   INI.WriteInteger('FRMREFERENSE','TOP',frmReferense.Top);
   INI.WriteInteger('FRMREFERENSE','LEFT',frmReferense.Left);
   INI.WriteInteger('FRMREFERENSE','WIDTH',frmReferense.Width);
   INI.WriteInteger('FRMREFERENSE','HEIGHT',frmReferense.Height);
   FreeAndNil(frmReferense);
  end;

  if Assigned(frmZastavka) then FreeAndNil(frmZastavka);

  FreeAndNil(FrameGrid);
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //if in Frame Editor mode
  if MainPageControl.ActivePage.Tag=1 then begin
    case Key of
     //when arrow keys pressed move cell cursor in drawing grid
      VK_LEFT : begin
        if FrameGrid.CellCursor.X=0 then FrameGrid.CellCursor.X:=FrameGrid.FrameWidth-1 else
           FrameGrid.CellCursor.X:=FrameGrid.CellCursor.X-1;
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
      end;
      VK_DOWN : begin
        if FrameGrid.CellCursor.Y=(FrameGrid.FrameHeight-1) then FrameGrid.CellCursor.Y:=0 else
        FrameGrid.CellCursor.Y:=FrameGrid.CellCursor.Y+1;
      end;
      //next keys can be used to drawing
       VK_SPACE : begin
      //draw pixels depends on selected cursor size - first color
        Layers[FrameGrid.ActiveLayer].Drawable.DrawPixel(FrameGrid.CellCursor.Coords.X,FrameGrid.CellCursor.Coords.Y,ColorToBGRA(spclForeColor,255));
      end;
       VK_RETURN : begin
      //draw pixels depends on selected cursor size - second color
        Layers[FrameGrid.ActiveLayer].Drawable.DrawPixel(FrameGrid.CellCursor.Coords.X,FrameGrid.CellCursor.Coords.Y,ColorToBGRA(spclBackColor,255));
      end;
       //just set pixel to background by setting opacity to 0
       VK_DELETE : begin
      //erace pixel to transparent
        Layers[FrameGrid.ActiveLayer].Drawable.ErasePixel(FrameGrid.CellCursor.Coords.X,FrameGrid.CellCursor.Coords.Y,255);
     end;
     //swap colors
     VK_X: begin
       frmDrawTools.bbtnSwapColorsClick(Sender);
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

procedure TfrmMain.FramesMenuItemClick(Sender: TObject);
begin
 frmFrames.Show;
end;

procedure TfrmMain.LayersToolVisibleMenuItemClick(Sender: TObject);
begin
 frmLayers.Show;
end;

procedure TfrmMain.miPaletteClearClick(Sender: TObject);
begin
  if MessageDlg('Warning!','Palette will be resetted to default colors! Are You shure?',mtWarning,mbYesNo,'')=mrYes then Palette.Reset;
  frmDrawTools.PaletteGrid.RenderAndDrawControl;
end;

procedure TfrmMain.miPaletteImportFromFileClick(Sender: TObject);
label stop;
var
    img : TBGRABitmap;
    w,h , i, j: Integer;
begin
  if OpenPictureDialog1.Execute then begin
   img:=TBGRABitmap.Create(OpenPictureDialog1.FileName);
   w:=img.Width-1;
   h:=img.Height-1;
   Palette.Clear;
   for i :=0 to w do
     for j:=0 to h do begin
       if Palette.AddColor(FPColorToTColor(img.Colors[i,j]))=-1 then begin
        ShowMessage('Image has too many colors!');
        Palette.Reset;
        goto stop;
       end;
     end;
stop:
   FreeAndNil(img);
  frmDrawTools.PaletteGrid.RenderAndDrawControl;
  end;
end;

procedure TfrmMain.miPaletteLoadFromFileClick(Sender: TObject);
begin
  if OpenPaletteDialog.Execute then begin
    Palette.LoadFromFile(OpenPaletteDialog.FileName);
  end;
 frmDrawTools.PaletteGrid.RenderAndDrawControl;
end;

procedure TfrmMain.miPaletteSaveToFileClick(Sender: TObject);
begin
  if SavePaletteDialog.Execute then begin
    Palette.SaveToFile(SavePaletteDialog.FileName);
  end;
end;

procedure TfrmMain.PaintToolPanelVisibleMenuItemClick(Sender: TObject);
begin
  frmDrawTools.Visible:= not frmDrawTools.Visible;
end;

procedure TfrmMain.pbFrameDrawDblClick(Sender: TObject);
begin

end;

procedure TfrmMain.pbFrameDrawMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 var p : TPoint;
begin
  if not Assigned(FrameGrid) then Exit;
  case Button of
    mbLeft,mbRight:begin
     if Assigned(frmDrawTools.DrawTool) and (FrameGrid.HasCoords(Point(x,y))) then begin
      fDrawGridMode:=dgmDraw;
      p:=FrameGrid.Coords(x,y);
       frmDrawTools.DrawTool.PenSize:=frmDrawTools.trkbrPenSize.Position;
       if Button=mbLeft then
          frmDrawTools.DrawTool.StartDraw(p.X,p.Y,spclForeColor)
       else
          frmDrawTools.DrawTool.StartDraw(p.X,p.Y,spclBackColor);
       {
        {$IFDEF DEBUG}
        DebugLn('Layers in active frame: ',Frames[FrameGrid.ActiveFrame].FLayersList.Text,' in: pbFrameDrawMouseDown();');
        {$ENDIF}
       }
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
   if fDrawGridMode=dgmDraw then begin

    if Assigned(frmDrawTools.DrawTool) and ( FrameGrid.HasCoords(Point(X,Y))) then begin
     p:=FrameGrid.Coords(X,Y);
     frmDrawTools.DrawTool.MouseMove(p.X,p.Y);
     pbFrameDraw.Invalidate;

    end;
   end;
   StatusBar1.Panels[0].Text:='x='+IntToStr(x)+'/y='+IntToStr(y);
   pbFrameDraw.Invalidate;
end;

procedure TfrmMain.pbFrameDrawMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if not Assigned(FrameGrid) then Exit;
  fDrawGridMode:=dgmNone;
  if Assigned(frmDrawTools.DrawTool) then frmDrawTools.DrawTool.FinishDraw;
  if Assigned(FrmPreview) then FrmPreview.FramePreview.Invalidate;
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

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  //if checked create and  show  splashscreen
   if INI.ReadBool('INTERFACE', 'SHOWSPLASH', true) then begin
     frmZastavka:= TfrmZastavka.Create(Application);
     frmZastavka.Show;
   end;

  //load form size and position from settings
  frmMain.Top:=INI.ReadInteger('FRMMAIN','TOP',frmMain.Top);
  frmMain.Left:=INI.ReadInteger('FRMMAIN','LEFT',frmMain.Left);
  frmMain.Width:=INI.ReadInteger('FRMMAIN','WIDTH',frmMain.Width);
  frmMain.Height:=INI.ReadInteger('FRMMAIN','HEIGHT',frmMain.Height);

  //create tools floating window and set size and position
  frmDrawTools:=TfrmDrawTools.Create(Self);
  frmDrawTools.Top:=INI.ReadInteger('FRMDRAWTOOLS','TOP',frmDrawTools.Top);
  frmDrawTools.Left:=INI.ReadInteger('FRMDRAWTOOLS','LEFT',frmDrawTools.Left);
  frmDrawTools.Width:=INI.ReadInteger('FRMDRAWTOOLS','WIDTH',frmDrawTools.Width);
  frmDrawTools.Height:=INI.ReadInteger('FRMDRAWTOOLS','HEIGHT',frmDrawTools.Height);
  frmDrawTools.Show;

  //frames floating window
  frmFrames:=TfrmFrames.Create(Self);
  frmFrames.Top:=INI.ReadInteger('FRMFRAMES','TOP',frmFrames.Top);
  frmFrames.Left:=INI.ReadInteger('FRMFRAMES','LEFT',frmFrames.Left);
  frmFrames.Width:=INI.ReadInteger('FRMFRAMES','WIDTH',frmFrames.Width);
  frmFrames.Height:=INI.ReadInteger('FRMFRAMES','HEIGHT',frmFrames.Height);
  frmFrames.Show;

  //create Layers floating window and set size and position
  frmLayers:=TfrmLayers.Create(Self);
  frmLayers.Top:=INI.ReadInteger('FRMLAYERS','TOP',frmLayers.Top);
  frmLayers.Left:=INI.ReadInteger('FRMLAYERS','LEFT',frmLayers.Left);
  frmLayers.Width:=INI.ReadInteger('FRMLAYERS','WIDTH',frmLayers.Width);
  frmLayers.Height:=INI.ReadInteger('FRMLAYERS','HEIGHT',frmLayers.Height);
  frmLayers.Show;

  if INI.ReadBool('FRMPREVIEW','VISIBLE',False) then PreviewMenuItemClick(Sender)
     else PreviewMenuItem.Checked:=False;

  MainPageControl.ActivePageIndex := 0;
  //create empty new frame with default params
  //BitBtnNewFrameClick(Sender);
end;

procedure TfrmMain.PreviewMenuItemClick(Sender: TObject);
begin
  //preview form
 if not Assigned(FrmPreview) then begin
  FrmPreview:=TFrmPreview.Create(frmMain);
  FrmPreview.Top:=INI.ReadInteger('FRMPREVIEW','TOP',FrmPreview.Top);
  FrmPreview.Left:=INI.ReadInteger('FRMPREVIEW','LEFT',FrmPreview.Left);
  FrmPreview.Width:=INI.ReadInteger('FRMPREVIEW','WIDTH',FrmPreview.Width);
  FrmPreview.Height:=INI.ReadInteger('FRMPREVIEW','HEIGHT',FrmPreview.Height);
 end;
 FrmPreview.Visible:=not FrmPreview.Visible;
 PreviewMenuItem.Checked:=FrmPreview.Visible;
end;

procedure TfrmMain.ReferenseImageMenuItemClick(Sender: TObject);
begin
 if not Assigned(frmReferense) then begin
  //referense image form
  frmReferense:=TfrmReferense.Create(frmMain);
  frmReferense.Top:=INI.ReadInteger('FRMREFERENSE','TOP',frmReferense.Top);
  frmReferense.Left:=INI.ReadInteger('FRMREFERENSE','LEFT',frmReferense.Left);
  frmReferense.Width:=INI.ReadInteger('FRMREFERENSE','WIDTH',frmReferense.Width);
  frmReferense.Height:=INI.ReadInteger('FRMREFERENSE','HEIGHT',frmReferense.Height);
 end;
 frmReferense.Show;
end;

procedure TfrmMain.SaveSpriteLibMenuItemClick(Sender: TObject);
begin
  if Trim(CurrentLibName) = '' then
    CurrentLibName := InputBox('Please input new library name', CurrentLibName, 'default');
  libpath := SpriteLibPath + DirectorySeparator + CurrentLibName;
end;

procedure TfrmMain.SrcImageFramesOptsValueListEditorValidate(Sender: TObject; ACol, ARow: longint; const KeyName, KeyValue: string);
begin
  if KeyValue <> '' then
    if not IsDigits(KeyValue) then
    begin
      ShowMessage(QuotedStr(KeyName) + ' has non-integer value!');
    end;
end;

procedure TfrmMain.ViewZoomInMenuItemClick(Sender: TObject);
begin
  FrameGrid.FrameZoom:=FrameGrid.FrameZoom+1;
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.ViewZoomOutMenuItemClick(Sender: TObject);
begin
  FrameGrid.FrameZoom:=FrameGrid.FrameZoom-1;
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.ViewZoomResetMenuItemClick(Sender: TObject);
begin
  FrameGrid.FrameZoom:=0;
  pbFrameDraw.Invalidate;
end;

end.
