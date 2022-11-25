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
  LCLType, DefaultTranslator, gettext, Translations;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    BitBtnImportFrame: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DrawToolsFlowPanel: TFlowPanel;
    opndlgLocalization: TOpenDialog;
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
    procedure BitBtnImportFrameClick(Sender: TObject);
    procedure BitBtnNewFrameClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FramesMenuItemClick(Sender: TObject);
    procedure LanguageMenuItemClick(Sender: TObject);
    procedure LayersToolVisibleMenuItemClick(Sender: TObject);
    procedure miPaletteClearClick(Sender: TObject);
    procedure miPaletteImportFromFileClick(Sender: TObject);
    procedure miPaletteLoadFromFileClick(Sender: TObject);
    procedure miPaletteSaveToFileClick(Sender: TObject);
    procedure PaintToolPanelVisibleMenuItemClick(Sender: TObject);
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

uses uabout, uframedlg, udrawtools, ulayers, uframes, upreview,
  ureferense;

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.AboutMenuItemClick(Sender: TObject);
begin
  if not Assigned(frmAbout) then frmAbout:= TfrmAbout.Create(Application);
  frmMain.HideWindows;
     frmAbout.Show;
  frmMain.ShowWindows;
  FreeAndNil(frmAbout);
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
  frmFrameDlg.ShowModal;
  ShowWindows;
  if frmFrameDlg.ModalResult=mrOK then begin
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
   Frames[frmFrameDlg.edtFrameName.Text].AddLayer(frmFrameDlg.edtFrameName.Text);
   Layers[cINTERNALLAYERANDFRAME].AddToFrame(frmFrameDlg.edtFrameName.Text);
   //todo: copy all layers to new frame if option checked
   for i:=0 to Layers.Count-1 do Layers.Data[i].Resize(FrameGrid.FrameWidth,FrameGrid.FrameHeight);
   FrameGrid.ActiveFrame:=frmFrameDlg.edtFrameName.Text;
   FrameGrid.ActiveLayer:=cINTERNALLAYERANDFRAME;
   if Assigned(frmDrawTools.trkbrPenSize) then frmDrawTools.trkbrPenSize.Max:=(FrameGrid.FrameWidth+FrameGrid.FrameHeight) div 4;
   pbFrameDraw.Invalidate;
  end;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
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
  if FrameGrid.CellCursor.Cells=1 then begin
     if ErasePixels then Layers[FrameGrid.ActiveLayer].Drawable.ErasePixel(FrameGrid.CellCursor.Coords.X,FrameGrid.CellCursor.Coords.Y,255)
                    else Layers[FrameGrid.ActiveLayer].Drawable.DrawPixel(FrameGrid.CellCursor.Coords.X,FrameGrid.CellCursor.Coords.Y,aColor);
 end else begin
  for i:= 0 to FrameGrid.CellCursor.Cells-1 do
    for j:=0 to FrameGrid.CellCursor.Cells-1 do begin
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
       frmDrawTools.bbtnSwapColorsClick(Sender);
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

procedure TfrmMain.FramesMenuItemClick(Sender: TObject);
begin
 frmFrames.Show;
end;

procedure TfrmMain.HideWindows;
begin
  frmDrawTools.Hide;
  FrmPreview.Hide;
  frmFrames.Hide;
  frmLayers.Hide;
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

procedure TfrmMain.LayersToolVisibleMenuItemClick(Sender: TObject);
begin
 frmLayers.Show;
end;

procedure TfrmMain.miPaletteClearClick(Sender: TObject);
begin
  if MessageDlg(rsWarning, rsPaletteWillB, mtWarning, mbYesNo, '')=mrYes
    then Palette.Reset;
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
       if Palette.AddColor(FPColorToBGRA(img.Colors[i,j]))=-1 then begin
        ShowMessage(rsImageHasTooM);
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
          frmDrawTools.DrawTool.StartDraw(p.X,p.Y,Shift,spclForeColor)
       else if Button=mbRight then
          frmDrawTools.DrawTool.StartDraw(p.X,p.Y,Shift,spclBackColor);
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
  if Assigned(frmDrawTools.DrawTool) then begin
   frmDrawTools.DrawTool.MouseUp(x,y,Shift);
  end;
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
   if Assigned(frmLayers) then begin
      //todo: after tests change to active frame layers count
    frmLayers.drwgrdLayers.RowCount:=Layers.Count+1;
    frmLayers.Invalidate;
   end;
  end;
  StatusBar1.Panels[2].Text:='w='+IntToStr(pbFrameDraw.ClientWidth)+'/h='+IntToStr(pbFrameDraw.ClientHeight);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
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

procedure TfrmMain.ShowWindows;
begin
  if PaintToolPanelVisibleMenuItem.Checked then frmDrawTools.Show;
  if PreviewMenuItem.Checked then FrmPreview.Show;
  if FramesMenuItem.Checked then frmFrames.Show;
  if LayersToolVisibleMenuItem.Checked then frmLayers.Show;
  if ReferenseImageMenuItem.Checked then frmReferense.Show;
end;

procedure TfrmMain.SrcImageFramesOptsValueListEditorValidate(Sender: TObject; ACol, ARow: longint; const KeyName, KeyValue: string);
begin
  if KeyValue <> '' then
    if not IsDigits(KeyValue) then
    begin
      ShowMessage(QuotedStr(KeyName) + rsHasNonIntege);
    end;
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
  FrameGrid.FrameZoom:=FrameGrid.FrameZoom-1;
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.ViewZoomResetMenuItemClick(Sender: TObject);
begin
  if not Assigned(FrameGrid) then Exit;
  FrameGrid.FrameZoom:=0;
  pbFrameDraw.Invalidate;
end;

end.
