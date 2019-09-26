unit umain;

{$mode objfpc}{$H+}

interface

uses
  sysutils, Classes, Forms, Controls, Menus, ExtDlgs, ComCtrls, Dialogs,
  ExtCtrls, BCListBox, BGRABitmap, BGRABitmapTypes, cyPageControl, GR32_Image,
  TplGalleryUnit, igBase;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    BCPaperPanel1: TBCPaperPanel;
    Editor: TTabSheet;
    SrcImage: TImage;
    MainMenu1: TMainMenu;
    FileMenuItem: TMenuItem;
    EditMenuItem: TMenuItem;
    FileNewSpriteMenuItem: TMenuItem;
    FileLoadSpriteMenuItem: TMenuItem;
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
    SaveSpriteLibMenuItem: TMenuItem;
    SelectSpriteLibMenuItem: TMenuItem;
    MenuItem7: TMenuItem;
    N3: TMenuItem;
    PageControl1: TcyPageControl;
    SpriteLibraryGallery: TplGallery;
    ResultSheet: TTabSheet;
    ScrollBox1: TScrollBox;
    SourceImageTabSheet: TTabSheet;
    LibrarySheet: TTabSheet;
    TimeLineToolVisibleMenuItem: TMenuItem;
    PaintToolPanelVisibleMenuItem: TMenuItem;
    N2: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    ViewZoomResetMenuItem: TMenuItem;
    ViewZoomOutMenuItem: TMenuItem;
    ViewZoomInMenuItem: TMenuItem;
    N1: TMenuItem;
    ViewMenuItem: TMenuItem;
    procedure AboutMenuItemClick(Sender: TObject);
    procedure FileLoadSpriteMenuItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure LayersToolVisibleMenuItemClick(Sender: TObject);
    procedure SelectSpriteLibMenuItemClick(Sender: TObject);
    procedure SaveSpriteLibMenuItemClick(Sender: TObject);
    procedure PaintToolPanelVisibleMenuItemClick(Sender: TObject);
    procedure SpriteLibraryGalleryClick(Sender: TObject; Index: integer);
    procedure SpriteLibraryGalleryHover(Sender: TObject; Index: integer);
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

procedure TfrmMain.AboutMenuItemClick(Sender: TObject);
begin
  frmZastavka.Show;
end;

procedure TfrmMain.FileLoadSpriteMenuItemClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then begin
    SpriteLibraryGallery.Items.Add;
    SpriteLibraryGallery.Items[SpriteLibraryGallery.Items.Count-1].Picture.LoadFromFile(OpenPictureDialog1.FileName);
    LibraryChanged:=true;
    PageControl1.ActivePage:=LibrarySheet;
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if LibraryChanged then begin
   if MessageDlg('Sprite library '+QuotedStr(CurrentLibName)+' was changed! Save changes?',mtWarning,mbYesNo,-1)=mrYes
     then SaveSpriteLibMenuItemClick(Sender);
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  i: Integer;
  libpath: UTF8String;
begin
  //create and show if checked splashscreen
  Application.CreateForm(TfrmZastavka,frmZastavka);
  if INI.ReadBool('INTERFACE','SHOWSPLASH',false) then frmZastavka.Show;
  //Create and show tools form and set position on screen
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
  frmTimeLine.Show;
  //load last sprite library if exists
  i:=0;
  if CurrentLibName<>'' then begin
   libpath:=SpriteLibPath+DirectorySeparator+CurrentLibName+DirectorySeparator;
   while FileExists(libpath+IntToStr(i)+'.png') do begin
    SpriteLibraryGallery.Items.Add;
    SpriteLibraryGallery.Items[SpriteLibraryGallery.Items.Count-1].Picture.LoadFromFile(libpath+IntToStr(i)+'.png');
    Inc(i);
   end;
  end;
  ShowMessage(SpriteLibNames.Text);
end;

procedure TfrmMain.LayersToolVisibleMenuItemClick(Sender: TObject);
begin
 LayersToolVisibleMenuItem.Checked:= not LayersToolVisibleMenuItem.Checked;
 frmLayers.Visible:=LayersToolVisibleMenuItem.Checked;
end;

procedure TfrmMain.SelectSpriteLibMenuItemClick(Sender: TObject);
begin
  frmSelectSpriteLib.ShowModal;
  ShowMessage(CurrentLibName);
end;

procedure TfrmMain.SaveSpriteLibMenuItemClick(Sender: TObject);
var
  i: Integer;
  libpath : UTF8String;
begin
  if Trim(CurrentLibName)='' then
   CurrentLibName:=InputBox('Please input new library name',CurrentLibName,'default');

   libpath:=SpriteLibPath+DirectorySeparator+CurrentLibName;
   for i:=0 to SpriteLibraryGallery.Items.Count-1 do begin
     //save every image in library dir
     //todo: delete previous files
     ForceDirectories(libpath);
     SpriteLibraryGallery.Items[i].Picture.SaveToFile(libpath+DirectorySeparator+IntToStr(i)+'.png','.png');
     LibraryChanged:=false;
   end;
end;

procedure TfrmMain.PaintToolPanelVisibleMenuItemClick(Sender: TObject);
begin
 PaintToolPanelVisibleMenuItem.Checked:= not PaintToolPanelVisibleMenuItem.Checked;
 frmTools.Visible:=PaintToolPanelVisibleMenuItem.Checked;
end;

procedure TfrmMain.SpriteLibraryGalleryClick(Sender: TObject; Index: integer);
begin
 if SpriteLibraryGallery.Items.Count=-1 then Exit;
 SrcImage.Picture.Assign(SpriteLibraryGallery.Items[Index].Picture);
 PageControl1.ActivePage:=SourceImageTabSheet;
end;

procedure TfrmMain.SpriteLibraryGalleryHover(Sender: TObject; Index: integer);
begin

end;

procedure TfrmMain.TimeLineToolVisibleMenuItemClick(Sender: TObject);
begin
 TimeLineToolVisibleMenuItem.Checked:= not TimeLineToolVisibleMenuItem.Checked;
 frmTimeLine.Visible:=TimeLineToolVisibleMenuItem.Checked;
end;

end.

