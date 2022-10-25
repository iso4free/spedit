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
{*    See the file LICENSE, included in this distribution, for details.    *}                                 *}
{*                                                                         *}
{*    This program is distributed in the hope that it will be useful,      *}
{*    but WITHOUT ANY WARRANTY; without even the implied warranty of       *}
{*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                 *}
{***************************************************************************}
unit umain;

{$mode objfpc}{$H+}

interface

uses
  uglobals, SysUtils, Classes, Forms, Controls, Menus, ExtDlgs, ComCtrls,
  Dialogs, ExtCtrls, Types, Graphics, StdCtrls, Buttons, ValEdit, CheckLst,
  BGRAImageList, BGRAImageManipulation, BCGameGrid, BGRABitmapTypes, BGRABitmap,
  BGRAGraphicControl, ECAccordion, LCLType;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DrawToolsFlowPanel: TFlowPanel;
    LayersCheckListBox: TCheckListBox;
    bbtnAddLayer: TBitBtn;
    bbtnDeleteLayer: TBitBtn;
    bbtnCopyLayer: TBitBtn;
    bbtnMergeLayers: TBitBtn;
    LayersFlowPanel: TFlowPanel;
    LayersGroupBox: TGroupBox;
    FramePreview: TPaintBox;
    RefImageAccordionItem: TAccordionItem;
    PreviewAccordionItem: TAccordionItem;
    BitBtnLayers: TBitBtn;
    ECAccordion1: TECAccordion;
    miPaletteImportFromFile: TMenuItem;
    FrameDrawPanel: TPanel;
    pbFrameDraw: TPaintBox;
    sdExportFrameSaveDialog: TSaveDialog;
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
    AdditionalToolsPanel: TPanel;
    ReferenceImage: TImage;
    ProjectSheet: TBGRAImageManipulation;
    ImportImage: TBGRAImageManipulation;
    ButtonsImageList: TBGRAImageList;
    Label2: TLabel;
    LibImage: TImage;
    LibraryComboBox: TComboBox;
    FrameEditorTabSheet: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    LibraryItemsListBox: TListBox;
    ListBox1: TListBox;
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
    LibraryButtonsPanel: TPanel;
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    ScrollBox3: TScrollBox;
    ScrollBox4: TScrollBox;
    SpeedButton1: TSpeedButton;
    SpeedButtonAutoSelect: TSpeedButton;
    SpeedButtonLoadSpritesheet: TSpeedButton;
    SpeedButtonSaveToLib: TSpeedButton;
    SrcImageButtonsPanel: TPanel;
    SaveSpriteLibMenuItem: TMenuItem;
    SelectSpriteLibMenuItem: TMenuItem;
    MenuItem7: TMenuItem;
    N3: TMenuItem;
    MainPageControl: TPageControl;
    SourceTabSheet: TTabSheet;
    ProjectTabSheet: TTabSheet;
    LibraryTabSheet: TTabSheet;
    ActionsTabSheet: TTabSheet;
    SettingsTabSheet: TTabSheet;
    StaticText1: TStaticText;
    StatusBar1: TStatusBar;
    TimeLineToolVisibleMenuItem: TMenuItem;
    PaintToolPanelVisibleMenuItem: TMenuItem;
    N2: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    SrcImageFramesOptsValueListEditor: TValueListEditor;
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
    procedure bbtnMergeLayersClick(Sender: TObject);
    procedure BitBtnNewFrameClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FramePreviewClick(Sender: TObject);
    procedure LayersToolVisibleMenuItemClick(Sender: TObject);
    procedure miPaletteClearClick(Sender: TObject);
    procedure miPaletteImportFromFileClick(Sender: TObject);
    procedure miPaletteLoadFromFileClick(Sender: TObject);
    procedure miPaletteSaveToFileClick(Sender: TObject);
    procedure FramePreviewPaint(Sender: TObject);
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
    procedure BgColorPaint(Sender: TObject);
    procedure FileLoadSpritesheetMenuItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ImportImageCropAreaAdded(AOwner: TBGRAImageManipulation; CropArea: TCropArea);
    procedure LibImageDblClick(Sender: TObject);
    procedure LibraryComboBoxChange(Sender: TObject);
    procedure LibraryItemsListBoxClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1SelectionChange(Sender: TObject; User: boolean);
    procedure ReferenceImageClick(Sender: TObject);
    procedure SelectSpriteLibMenuItemClick(Sender: TObject);
    procedure SaveSpriteLibMenuItemClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButtonSaveToLibClick(Sender: TObject);
    procedure SrcImageFramesOptsValueListEditorEditingDone(Sender: TObject);
    procedure SrcImageFramesOptsValueListEditorValidate(Sender: TObject; ACol, ARow: longint; const KeyName, KeyValue: string);
    procedure ViewZoomInMenuItemClick(Sender: TObject);
    procedure ViewZoomOutMenuItemClick(Sender: TObject);
    procedure ViewZoomResetMenuItemClick(Sender: TObject);
  private
   DrawGridMode : TDrawGridMode;
    dx,dy : Integer;             //offset to move grid
    startx,starty : Integer;     //start position to move
  public

  end;

var
  frmMain: TfrmMain;


implementation

uses uzastavka, udrawtools, uselsprlib;

{$R *.frm}

{ TfrmMain }

procedure LoadSpriteLib;
var
  i: integer;
  libpath: utf8string;
begin
  if CurrentLibName <> '' then with frmMain do
    begin
      libpath := SpriteLibPath + DirectorySeparator + CurrentLibName + DirectorySeparator;
      LibraryItemsListBox.Clear;
      i := 0;
      while FileExists(libpath + IntToStr(i) + '.png') do
      begin
        LibraryItemsListBox.Items.Add(IntToStr(i) + '.png');
        Inc(i);
      end;
    end;
end;

procedure TfrmMain.AboutMenuItemClick(Sender: TObject);
begin
  frmZastavka.Show;
end;

procedure TfrmMain.bbtnAddLayerClick(Sender: TObject);
begin
 ShowMessage('Not implemented yet! Sorry...');
end;

procedure TfrmMain.bbtnCopyLayerClick(Sender: TObject);
begin
  ShowMessage('Not implemented yet! Sorry...');
end;

procedure TfrmMain.bbtnDeleteLayerClick(Sender: TObject);
begin
  ShowMessage('Not implemented yet! Sorry...');
end;

procedure TfrmMain.bbtnMergeLayersClick(Sender: TObject);
begin
  ShowMessage('Not implemeted yet! Sorry...');
end;

procedure TfrmMain.BitBtnNewFrameClick(Sender: TObject);
begin
  //todo: show dialog to create new frame with default parameters
  FreeAndNil(FrameGrid);
  FrameGrid:=TFrameGrid.Create(32,32);
  FrameGrid.Offset:=Point(0,0);
  dx:=0;
  dy:=0;
  FramePreview.Width:=FrameGrid.FrameWidth;
  FramePreview.Height:=FrameGrid.FrameHeight;
  FrameGrid.ActiveFrame:=Frames.Keys[0];
  FrameGrid.ActiveLayer:=Layers.Keys[0];
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  //save forms size and position
  INI.WriteInteger('FRMMAIN','TOP',frmMain.Top);
  INI.WriteInteger('FRMMAIN','LEFT',frmMain.Left);
  INI.WriteInteger('FRMMAIN','WIDTH',frmMain.Width);
  INI.WriteInteger('FRMMAIN','HEIHFT',frmMain.Height);

  INI.WriteInteger('FRMDRAWTOOLS','TOP',frmDrawTools.Top);
  INI.WriteInteger('FRMDRAWTOOLS','LEFT',frmDrawTools.Left);
  INI.WriteInteger('FRMDRAWTOOLS','WIDTH',frmDrawTools.Width);
  INI.WriteInteger('FRMDRAWTOOLS','HEIHFT',frmDrawTools.Height);
  FreeAndNil(frmDrawTools);
  FreeAndNil(FrameGrid);
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //if in Frame Editor mode
  if MainPageControl.ActivePage.Tag=1 then begin
    //when arrow keys pressed move cell cursor in drawing grid
    case Key of
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
    end;
    pbFrameDraw.Invalidate;
  end;
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

procedure TfrmMain.LayersToolVisibleMenuItemClick(Sender: TObject);
begin
  LayersGroupBox.Visible:=not LayersGroupBox.Visible;
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

procedure TfrmMain.FramePreviewPaint(Sender: TObject);
begin
  if Assigned(FrameGrid) then
  FrameGrid.RenderPicture(FramePreview.Canvas);
end;

procedure TfrmMain.PaintToolPanelVisibleMenuItemClick(Sender: TObject);
begin
  frmDrawTools.Visible:= not frmDrawTools.Visible;
end;

procedure TfrmMain.pbFrameDrawMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case Button of
    mbLeft:begin
        //todo: check wich tool selected for drawing
      {  (DrawTool as TSPPen).StartDraw(FrameGrid.CellCursor.X,FrameGrid.CellCursor.Y,spclForeColor);
        DrawGridMode:=dgmDraw;}
        pbFrameDraw.Invalidate;
    end;
    mbRight:begin
      //todo: check wich tool selected for drawing
      // (DrawTool as TSPPen).StartDraw(FrameGrid.CellCursor.X,FrameGrid.CellCursor.Y,spclBackColor);
       DrawGridMode:=dgmDraw;
    end;
    mbMiddle: begin   //start grid drag
      DrawGridMode:=dgmMove;
      dx:=0;
      dy:=0;
      startx:=x;
      starty:=y;
    end;
  end;
end;

procedure TfrmMain.pbFrameDrawMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   FrameGrid.CellCursor.Coords:=FrameGrid.Coords(x,y);
        StatusBar1.Panels[3].Text:='x='+IntToStr(FrameGrid.CellCursor.X)+'/y='+IntToStr(FrameGrid.CellCursor.y);
   if DrawGridMode=dgmMove then begin //move grid inside paintbox
     dx:=x-startx;
     dy:=y-starty;
     startx:=x;
     starty:=y;
     FrameGrid.Offset:=Point(dx,dy);
   end;
   if DrawGridMode=dgmDraw then begin
    //todo: check which tool selected
    //(DrawTool as TSPPen).MouseMove(FrameGrid.CellCursor.X,FrameGrid.CellCursor.Y);
   end;
   StatusBar1.Panels[0].Text:='x='+IntToStr(x)+'/y='+IntToStr(y);
   pbFrameDraw.Invalidate;
end;

procedure TfrmMain.pbFrameDrawMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DrawGridMode:=dgmNone;
  FramePreview.Invalidate;
end;

procedure TfrmMain.pbFrameDrawMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  if (ssCtrl in Shift) then ViewZoomOutMenuItemClick(Sender);
  if (ssAlt in Shift) then FrameGrid.CheckersSize:=FrameGrid.CheckersSize-1;
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.pbFrameDrawMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  if (ssCtrl in Shift) then ViewZoomInMenuItemClick(Sender);
  if (ssAlt in Shift) then FrameGrid.CheckersSize:=FrameGrid.CheckersSize+1;
  pbFrameDraw.Invalidate;
end;

procedure TfrmMain.pbFrameDrawPaint(Sender: TObject);
begin
   //draw here zoomed frame data
  if Assigned(FrameGrid) then begin
    FrameGrid.RenderAndDraw(pbFrameDraw.Canvas);
    FramePreview.Invalidate;
  end;
  StatusBar1.Panels[2].Text:='w='+IntToStr(pbFrameDraw.ClientWidth)+'/h='+IntToStr(pbFrameDraw.ClientHeight);

end;

procedure TfrmMain.BgColorPaint(Sender: TObject);
var cl : TColor;
begin
  if (Sender as TBGRAGraphicControl).Tag = 1 then cl := spclBackColor
    else cl:=spclForeColor;
  if cl=clNone then begin
   (Sender as TBGRAGraphicControl).Bitmap.DrawCheckers(Rect(2,2,(Sender as TBGRAGraphicControl).Width-2,(Sender as TBGRAGraphicControl).Height-2),
                                              ColorToBGRA($BFBFBF),ColorToBGRA($FFFFFF),4,4);
   (Sender as TBGRAGraphicControl).Bitmap.Rectangle(Rect(0,0,(Sender as TBGRAGraphicControl).Width,(Sender as TBGRAGraphicControl).Height),ColorToBGRA(clBlack));
  end
    else (Sender as TBGRAGraphicControl).Bitmap.FillRect(Rect(2,2,(Sender as TBGRAGraphicControl).Width-2,(Sender as TBGRAGraphicControl).Height-2),ColorToBGRA(cl));
  (Sender as TBGRAGraphicControl).Invalidate;
  StatusBar1.Panels[1].Text:='FG: '+IntToHex(spclForeColor)+' / BG: '+IntToHex(spclBackColor);
end;

procedure TfrmMain.FileLoadSpritesheetMenuItemClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    ImportImage.Bitmap.Bitmap.Clear;
    ImportImage.Bitmap.LoadFromFile(OpenPictureDialog1.FileName);
    ImportImage.Width := ImportImage.Bitmap.Bitmap.Width;
    ImportImage.Height := ImportImage.Bitmap.Bitmap.Height;
    ImportImage.AutoSize := True;
    MainPageControl.ActivePage := SourceTabSheet;
    SpeedButtonSaveToLib.Enabled := True;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  //load form size and position from settings
  frmMain.Top:=INI.ReadInteger('FRMMAIN','TOP',frmMain.Top);
  frmMain.Left:=INI.ReadInteger('FRMMAIN','LEFT',frmMain.Left);
  frmMain.Width:=INI.ReadInteger('FRMMAIN','WIDTH',frmMain.Width);
  frmMain.Height:=INI.ReadInteger('FRMMAIN','HEIHFT',frmMain.Height);

  //create and show if checked splashscreen
  Application.CreateForm(TfrmZastavka, frmZastavka);
  if INI.ReadBool('INTERFACE', 'SHOWSPLASH', true) then frmZastavka.Show;
  //load last sprite library if exists
  LibraryComboBox.Clear;
  LibraryComboBox.Items.Assign(SpriteLibNames);
  LibraryComboBox.ItemIndex := LibraryComboBox.Items.IndexOf(INI.ReadString('INTERFACE', 'SPRITELIB', 'default'));
  LoadSpriteLib;
  MainPageControl.ActivePageIndex := 0;
  //create empty new frame with default params
  BitBtnNewFrameClick(Sender);

  //create tools floating window
  frmDrawTools:=TfrmDrawTools.Create(Self);
//  load tools form size and position
  frmDrawTools.Top:=INI.ReadInteger('FRMDRAWTOOLS','TOP',frmDrawTools.Top);
  frmDrawTools.Left:=INI.ReadInteger('FRMDRAWTOOLS','LEFT',frmDrawTools.Left);
  frmDrawTools.Width:=INI.ReadInteger('FRMDRAWTOOLS','WIDTH',frmDrawTools.Width);
  frmDrawTools.Height:=INI.ReadInteger('FRMDRAWTOOLS','HEIHFT',frmDrawTools.Height);
  frmDrawTools.Show;
end;

procedure TfrmMain.ImportImageCropAreaAdded(AOwner: TBGRAImageManipulation; CropArea: TCropArea);
begin
  ListBox1.AddItem('Frame' + IntToStr(ListBox1.Count + 1), CropArea);
end;

procedure TfrmMain.LibImageDblClick(Sender: TObject);
begin
  ImportImage.Width := LibImage.Width;
  ImportImage.Height := LibImage.Height;
  ImportImage.Bitmap.LoadFromFile(libpath + DirectorySeparator + LibraryItemsListBox.GetSelectedText);
  //todo: load frames description if exists
  MainPageControl.ActivePage := SourceTabSheet;
end;

procedure TfrmMain.LibraryComboBoxChange(Sender: TObject);
begin
  LibraryItemsListBox.Clear;
  LibImage.Picture.Clear;
  CurrentLibName := LibraryComboBox.Text;
  LoadSpriteLib;
end;

procedure TfrmMain.LibraryItemsListBoxClick(Sender: TObject);
begin
  LibImage.Picture.LoadFromFile(libpath + DirectorySeparator + LibraryItemsListBox.GetSelectedText);
end;

procedure TfrmMain.ListBox1Click(Sender: TObject);
begin
  ListBox1SelectionChange(Sender, True);
end;

procedure TfrmMain.ListBox1SelectionChange(Sender: TObject; User: boolean);
begin
  if ListBox1.Count = 0 then Exit;
  with SrcImageFramesOptsValueListEditor do
  begin
    Values['npp'] := IntToStr(ListBox1.ItemIndex);
    Values['x'] := IntToStr(ImportImage.CropAreas[ListBox1.ItemIndex].Area.Left);
    Values['y'] := IntToStr(ImportImage.CropAreas[ListBox1.ItemIndex].Area.Top);
    Values['width'] := IntToStr(ImportImage.CropAreas[ListBox1.ItemIndex].Area.Width);
    Values['height'] := IntToStr(ImportImage.CropAreas[ListBox1.ItemIndex].Area.Height);
  end;
end;

procedure TfrmMain.ReferenceImageClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then begin
   ReferenceImage.Picture.Clear;
   ReferenceImage.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;
end;

procedure TfrmMain.SelectSpriteLibMenuItemClick(Sender: TObject);
begin
  frmSelectSpriteLib.ShowModal;
  LoadSpriteLib;
end;

procedure TfrmMain.SaveSpriteLibMenuItemClick(Sender: TObject);
begin
  if Trim(CurrentLibName) = '' then
    CurrentLibName := InputBox('Please input new library name', CurrentLibName, 'default');
  libpath := SpriteLibPath + DirectorySeparator + CurrentLibName;
end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
begin
  if ListBox1.Count = 0 then Exit;
  ImportImage.delCropArea(ImportImage.CropAreas[ListBox1.ItemIndex]);
  ListBox1.DeleteSelected;
end;

procedure TfrmMain.SpeedButtonSaveToLibClick(Sender: TObject);
var
  i: integer;
begin
  if MessageDlg('Warning!', 'Save this image to ' + QuotedStr(CurrentLibName) + ' library?', mtConfirmation, mbYesNo, '') = mrYes then
  begin
    //add this image to current lib
    for i := 0 to LibraryItemsListBox.Items.Count do
    begin
      if not FileExists(libpath + DirectorySeparator + IntToStr(i) + '.png') then
      begin
        ImportImage.Bitmap.SaveToFile(libpath + DirectorySeparator + IntToStr(i) + '.png');
        LibraryItemsListBox.Items.Add(IntToStr(i) + '.png');
        SpeedButtonSaveToLib.Enabled := False;
        Exit;
      end;
    end;
  end;
end;

procedure TfrmMain.SrcImageFramesOptsValueListEditorEditingDone(Sender: TObject);
var
  Area: TCropArea;
begin

  with ImportImage do
  begin
    SelectedCropArea := CropAreas[ListBox1.ItemIndex];
    Area := SelectedCropArea;
    Area.Left := StrToInt(SrcImageFramesOptsValueListEditor.Values['x']);
    Area.Top := StrToInt(SrcImageFramesOptsValueListEditor.Values['y']);
    Area.Width := StrToInt(SrcImageFramesOptsValueListEditor.Values['width']);
    Area.Height := StrToInt(SrcImageFramesOptsValueListEditor.Values['height']);
    SelectedCropArea := Area;
  end;
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
