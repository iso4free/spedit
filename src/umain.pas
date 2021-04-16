unit umain;

{$mode objfpc}{$H+}

interface

uses
  sysutils, Classes, Forms, Controls, Menus, ExtDlgs, ComCtrls, Dialogs,
  ExtCtrls, Grids, Types, Graphics, StdCtrls, Buttons, ValEdit;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    ButtonsImageList: TImageList;
    ImportImage: TImage;
    Label2: TLabel;
    LibImage: TImage;
    LibraryComboBox: TComboBox;
    DrawGrid1: TDrawGrid;
    FrameEditorTabSheet: TTabSheet;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Label1: TLabel;
    LibraryItemsListBox: TListBox;
    ListBox1: TListBox;
    Panel1: TPanel;
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
    FramesButtonsPanel: TPanel;
    LibraryButtonsPanel: TPanel;
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    ScrollBox3: TScrollBox;
    SpeedButtonAutoSelect: TSpeedButton;
    SpeedButtonLoadSpritesheet: TSpeedButton;
    SpeedButtonSaveToLib: TSpeedButton;
    SrcImageButtonsPanel: TPanel;
    SaveSpriteLibMenuItem: TMenuItem;
    SelectSpriteLibMenuItem: TMenuItem;
    MenuItem7: TMenuItem;
    N3: TMenuItem;
    PageControl1: TPageControl;
    SourceTabSheet: TTabSheet;
    ProjectTabSheet: TTabSheet;
    LibraryTabSheet: TTabSheet;
    ActionsTabSheet: TTabSheet;
    SettingsTabSheet: TTabSheet;
    TimeLineToolVisibleMenuItem: TMenuItem;
    PaintToolPanelVisibleMenuItem: TMenuItem;
    N2: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    SrcImageFramesOptsValueListEditor: TValueListEditor;
    ViewZoomResetMenuItem: TMenuItem;
    ViewZoomOutMenuItem: TMenuItem;
    ViewZoomInMenuItem: TMenuItem;
    N1: TMenuItem;
    ViewMenuItem: TMenuItem;
    procedure AboutMenuItemClick(Sender: TObject);
    procedure DrawGrid1DrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure DrawGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DrawGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure DrawGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FileLoadSpritesheetMenuItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure LayersToolVisibleMenuItemClick(Sender: TObject);
    procedure LibImageDblClick(Sender: TObject);
    procedure LibraryComboBoxChange(Sender: TObject);
    procedure LibraryItemsListBoxClick(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure Panel1Paint(Sender: TObject);
    procedure SelectSpriteLibMenuItemClick(Sender: TObject);
    procedure SaveSpriteLibMenuItemClick(Sender: TObject);
    procedure PaintToolPanelVisibleMenuItemClick(Sender: TObject);
    procedure SpeedButtonSaveToLibClick(Sender: TObject);
    procedure TimeLineToolVisibleMenuItemClick(Sender: TObject);
  private

  public

  end;

var
  frmMain: TfrmMain;


implementation

uses uglobals, uzastavka, utools, ulayers, utimeline, uselsprlib;
{$R *.frm}

{ TfrmMain }

procedure LoadSpriteLib;
var
  i: Integer;
  libpath: UTF8String;
begin
  if CurrentLibName<>'' then with frmMain do begin
   libpath:=SpriteLibPath+DirectorySeparator+CurrentLibName+DirectorySeparator;
   LibraryItemsListBox.Clear;
   i:=0;
   while FileExists(libpath+IntToStr(i)+'.png') do begin
    LibraryItemsListBox.Items.Add(IntToStr(i)+'.png');
    Inc(i);
   end;
  end;
end;

procedure TfrmMain.AboutMenuItemClick(Sender: TObject);
begin
  frmZastavka.Show;
end;

procedure TfrmMain.DrawGrid1DrawCell(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
begin
  DrawGrid1.Canvas.Brush.Color:=Image1.Picture.PNG.Canvas.Pixels[aCol,aRow];
  DrawGrid1.Canvas.FillRect(aRect);
end;

procedure TfrmMain.DrawGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //todo: check pressed key to start draw
end;

procedure TfrmMain.DrawGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   //todo: check unpressed key to start draw
end;

procedure TfrmMain.DrawGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Image1.Canvas.Pixels[x div 10,y div 10]:=clRed;
  Application.ProcessMessages;
end;

procedure TfrmMain.FileLoadSpritesheetMenuItemClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then begin
    ImportImage.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    PageControl1.ActivePage:=SourceTabSheet;
    SpeedButtonSaveToLib.Enabled:=true;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  //create and show if checked splashscreen
  Application.CreateForm(TfrmZastavka,frmZastavka);
  if INI.ReadBool('INTERFACE','SHOWSPLASH',false) then frmZastavka.Show;
 { //Create and show tools form and set position on screen
  Application.CreateForm(TfrmTools,frmTools);
  frmTools.Left:=Screen.WorkAreaLeft+10;
  frmTools.Top:=Screen.WorkAreaTop+10;
  Left := frmTools.Left+frmTools.Width+20;
  Top := frmTools.Top;
  frmTools.Show;
  //Create and show layers form and set position on screen
  Application.CreateForm(TfrmLayers,frmLayers);
  frmLayers.Top:=Top;
  frmLayers.Left:=Left+Width+20;
  frmLayers.Show;
  //Create and show timeline form and set position on screen
  Application.CreateForm(TfrmTimeLine,frmTimeLine);
  frmTimeLine.Top:=frmMain.Top+frmMain.Height+50;
  frmTimeLine.Left:=Left;
  frmTimeLine.Width:=Width;
  frmTimeLine.Show; }
  //load last sprite library if exists
  LibraryComboBox.Clear;
  LibraryComboBox.Items.Assign(SpriteLibNames);
  LibraryComboBox.ItemIndex:=LibraryComboBox.Items.IndexOf(INI.ReadString('INTERFACE','SPRITELIB','default'));
  LoadSpriteLib;
  PageControl1.ActivePageIndex:=0;
end;

procedure TfrmMain.Image1Click(Sender: TObject);
begin
  DrawGrid1.ColCount:=Image1.Width;
  DrawGrid1.RowCount:=Image1.Height;
  DrawGrid1.Width:=Image1.Width*10+5;
  DrawGrid1.Height:=Image1.Height*10+5;
end;

procedure TfrmMain.LayersToolVisibleMenuItemClick(Sender: TObject);
begin
 LayersToolVisibleMenuItem.Checked:= not LayersToolVisibleMenuItem.Checked;
 frmLayers.Visible:=LayersToolVisibleMenuItem.Checked;
end;

procedure TfrmMain.LibImageDblClick(Sender: TObject);
begin
  ImportImage.Picture.Assign(LibImage.Picture);
  PageControl1.ActivePage:=SourceTabSheet;
end;

procedure TfrmMain.LibraryComboBoxChange(Sender: TObject);
begin
  LibraryItemsListBox.Clear;
  LibImage.Picture.Clear;
  CurrentLibName:=LibraryComboBox.Text;
  LoadSpriteLib;
end;

procedure TfrmMain.LibraryItemsListBoxClick(Sender: TObject);
begin
  LibImage.Picture.LoadFromFile(libpath+DirectorySeparator+LibraryItemsListBox.GetSelectedText);
end;

procedure TfrmMain.MenuItem7Click(Sender: TObject);
begin
  //todo: add new library name and set it to active, create dir
end;

procedure TfrmMain.Panel1Paint(Sender: TObject);
begin
 //todo:  show grid, draw part of image
end;

procedure TfrmMain.SelectSpriteLibMenuItemClick(Sender: TObject);
begin
  frmSelectSpriteLib.ShowModal;
  LoadSpriteLib;
end;

procedure TfrmMain.SaveSpriteLibMenuItemClick(Sender: TObject);
var
  i: Integer;
begin
  if Trim(CurrentLibName)='' then
   CurrentLibName:=InputBox('Please input new library name',CurrentLibName,'default');
   libpath:=SpriteLibPath+DirectorySeparator+CurrentLibName;
end;

procedure TfrmMain.PaintToolPanelVisibleMenuItemClick(Sender: TObject);
begin
 PaintToolPanelVisibleMenuItem.Checked:= not PaintToolPanelVisibleMenuItem.Checked;
 frmTools.Visible:=PaintToolPanelVisibleMenuItem.Checked;
end;

procedure TfrmMain.SpeedButtonSaveToLibClick(Sender: TObject);
var
  i: Integer;
begin
  if MessageDlg('Warning!','Save this image to '+QuotedStr(CurrentLibName)+' library?',mtConfirmation,mbYesNo,'')=mrYes then begin
   //add this image to current lib
   for i:=0 to LibraryItemsListBox.Items.Count do begin
    if not FileExists(libpath+DirectorySeparator+IntToStr(i)+'.png') then begin
     ImportImage.Picture.SaveToFile(libpath+DirectorySeparator+IntToStr(i)+'.png','png');
     LibraryItemsListBox.Items.Add(IntToStr(i)+'.png');
     SpeedButtonSaveToLib.Enabled:=false;
     Exit;
    end;
   end;
  end;
end;

procedure TfrmMain.TimeLineToolVisibleMenuItemClick(Sender: TObject);
begin
 TimeLineToolVisibleMenuItem.Checked:= not TimeLineToolVisibleMenuItem.Checked;
 frmTimeLine.Visible:=TimeLineToolVisibleMenuItem.Checked;
end;

end.

