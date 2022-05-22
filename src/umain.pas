unit umain;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, Forms, Controls, Menus, ExtDlgs, ComCtrls, Dialogs,
  ExtCtrls, Types, Graphics, StdCtrls, Buttons, ValEdit, BGRAImageList,
  BGRAImageManipulation, BCGameGrid, BCToolBar, BGRABitmapTypes, BGRABitmap,
  BGRAGraphicControl;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    miPaletteImportFromFile: TMenuItem;
    SavePaletteDialog: TSaveDialog;
    Separator1: TMenuItem;
    miPaletteClear: TMenuItem;
    miPaletteSaveToFile: TMenuItem;
    miPaletteLoadFromFile: TMenuItem;
    OpenPaletteDialog: TOpenDialog;
    PaletteGrid: TBCGameGrid;
    BgColor: TBGRAGraphicControl;
    SwapBgFg: TBGRAGraphicControl;
    FgColor: TBGRAGraphicControl;
    ColorDialog1: TColorDialog;
    FrameBGRAGraphicControl: TBGRAGraphicControl;
    BitBtnNewFrame: TBitBtn;
    FlowPanel1: TFlowPanel;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    ColorsPanel: TPanel;
    ScrollBox5: TScrollBox;
    ToolsGroupBox: TGroupBox;
    ReferenceGroupBox: TGroupBox;
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
    procedure miPaletteClearClick(Sender: TObject);
    procedure miPaletteLoadFromFileClick(Sender: TObject);
    procedure miPaletteSaveToFileClick(Sender: TObject);
    procedure PaletteGridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaletteGridRenderControl(Sender: TObject; Bitmap: TBGRABitmap;
      r: TRect; n, x, y: integer);
    procedure BgColorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BgColorPaint(Sender: TObject);
    procedure SwapColors(Sender: TObject);
    procedure FileLoadSpritesheetMenuItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FrameBGRAGraphicControlPaint(Sender: TObject);
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
  private
  public

  end;

var
  frmMain: TfrmMain;


implementation

uses uglobals, uzastavka, uselsprlib;

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

procedure TfrmMain.miPaletteClearClick(Sender: TObject);
begin
  if MessageDlg('Warning!','All colors in palette will be deleted! Are You shure?',mtWarning,mbYesNo,'')=mrYes then Palette.Clear;
  PaletteGrid.RenderAndDrawControl;
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
     FgColor.Invalidate;
    end;
    mbRight:begin
     spclBackColor:=Palette.SelectedColor;
     BgColor.Invalidate;
    end;
  end;
end;

procedure TfrmMain.PaletteGridRenderControl(Sender: TObject;
  Bitmap: TBGRABitmap; r: TRect; n, x, y: integer);
var b, c : TBGRAPixel;
begin
  if (n=0) or (n>Palette.Count-1) then begin
   c:=clNone;
   b:=clNone;
   end  else begin
     c := ColorToBGRA(palette.Color[n]);
     b:=ColorToBGRA(clBlack);
   end;
  Bitmap.Rectangle(r,b,c,dmSet);
end;

procedure TfrmMain.BgColorMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case Button of
    mbLeft:  if ColorDialog1.Execute then begin
                if (Sender as TBGRAGraphicControl).Tag=1 then spclBackColor:=ColorDialog1.Color
                else spclForeColor:=ColorDialog1.Color;
                Palette.AddColor(ColorDialog1.Color);
                StatusBar1.Panels[0].Text:='Colors: '+IntToStr(Palette.Count);
                PaletteGrid.RenderAndDrawControl;
              end;
    mbRight:if (Sender as TBGRAGraphicControl).Tag=1 then spclBackColor:=clNone
                else spclForeColor:=clNone;
  end;
  BgColorPaint(Sender);
end;

procedure TfrmMain.BgColorPaint(Sender: TObject);
var cl : TColor;
begin
  if (Sender as TBGRAGraphicControl).Tag = 1 then cl := spclBackColor
    else cl:=spclForeColor;
  if cl=clNone then begin
   (Sender as TBGRAGraphicControl).Bitmap.DrawCheckers(Rect(2,2,(Sender as TBGRAGraphicControl).Width-2,(Sender as TBGRAGraphicControl).Height-2),
                                              ColorToBGRA($BFBFBF),ColorToBGRA($FFFFFF),4,4);
  end
    else (Sender as TBGRAGraphicControl).Bitmap.FillRect(Rect(2,2,(Sender as TBGRAGraphicControl).Width-2,(Sender as TBGRAGraphicControl).Height-2),ColorToBGRA(cl));
  (Sender as TBGRAGraphicControl).Invalidate;
  StatusBar1.Panels[1].Text:='FG: '+IntToHex(spclForeColor)+' / BG: '+IntToHex(spclBackColor);
end;


procedure TfrmMain.SwapColors(Sender: TObject);
var cl : TColor;
begin
   cl := spclBackColor;
   spclBackColor:=spclForeColor;
   spclForeColor:=cl;
   FgColor.Invalidate;
   BgColor.Invalidate;
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
var
  i: integer;
begin
  //create and show if checked splashscreen
  Application.CreateForm(TfrmZastavka, frmZastavka);
  if INI.ReadBool('INTERFACE', 'SHOWSPLASH', False) then frmZastavka.Show;
  //load last sprite library if exists
  LibraryComboBox.Clear;
  LibraryComboBox.Items.Assign(SpriteLibNames);
  LibraryComboBox.ItemIndex := LibraryComboBox.Items.IndexOf(INI.ReadString('INTERFACE', 'SPRITELIB', 'default'));
  LoadSpriteLib;
  MainPageControl.ActivePageIndex := 0;
  BgColor.ShowHint:=true;
  FgColor.ShowHint:=true;
  SwapBgFg.ShowHint:=true;

end;

procedure TfrmMain.FrameBGRAGraphicControlPaint(Sender: TObject);
begin
  FrameBGRAGraphicControl.Bitmap.DrawCheckers(Rect(5,5,FrameBGRAGraphicControl.Width-5,FrameBGRAGraphicControl.Height-5),
                                              ColorToBGRA($BFBFBF),ColorToBGRA($FFFFFF));
  //todo: draw here zoomed frame data
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
var
  i: integer;
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

end.
