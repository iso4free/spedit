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

unit uspriteimport;

{$mode ObjFPC}{$H+}

interface

uses
  {$IFDEF DEBUG}LazLoggerBase, {$ENDIF}
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ExtDlgs, Buttons, fgl, Types, Grids, JvMovableBevel, Spin, BGRABitmap,
  BGRABitmapTypes, BGRASpriteAnimation, lazfileutils;

type

  { TSelectionData }

  TSelectionData = class
   private
    fIndex : Integer;
    FKey: String;
    fRect : TRect;
   public
    property Index : Integer read fIndex write fIndex;//ordered index
    property Rect : TRect read fRect write fRect;     //Selected rectangle
    property Key : String read FKey write FKey;       //unique key name (i.e. 'Spritesheet1')
    constructor Create(aidx : Integer; akey : String; aRect : TRect);
    destructor destroy; override;
  end;

  TGenericSelectionList = specialize TFPGMapObject <String,TSelectionData>;

  { TSelectionList }

  TSelectionList = class(TGenericSelectionList)
   private
     FKeynames: TStringList;
     FOnChange: TNotifyEvent;
     FSelected: String;
     function GetCount: Integer;
     procedure SetOnChange(AValue: TNotifyEvent);
     procedure Add(aData : TSelectionData);
   public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;

    procedure NewSelection(const aNameTemplate : String; const aRect : TRect);
    property Keynames : TStringList read FKeynames;
    property Selected : String read FSelected write FSelected;
    property Count : Integer read GetCount;
    property OnChange : TNotifyEvent read FOnChange write SetOnChange;
    procedure RenameKey(const aOldKey, aNewKey : String);
    procedure DrawSelections(aCanvas : TCanvas); //draw all selections with additional data to canvas
    function CheckSelection(Const x, y : Integer; out aIdx : String) : Boolean; //check if any rect contains coords
  end;

  { TfrmImportSheet }

  TfrmImportSheet = class(TForm)
    bbSpritesheetOpen: TBitBtn;
    bbImport: TBitBtn;
    bbCancel: TBitBtn;
    bbAdd: TBitBtn;
    bbDelete: TBitBtn;
    bbClear: TBitBtn;
    anImportedGif: TBGRASpriteAnimation;
    bbAutoFrames: TBitBtn;
    cbGrig: TCheckBox;
    chgrpSelections: TGroupBox;
    cbSizes: TComboBox;
    dgImportedFrames: TDrawGrid;
    edNameTemplate: TEdit;
    gbCell: TGroupBox;
    gbCrop: TGroupBox;
    gbGridSize: TGroupBox;
    gbOffset: TGroupBox;
    imgImported: TImage;
    lblBottom: TLabel;
    lblCols: TLabel;
    lblHeight: TLabel;
    lblLeft: TLabel;
    lblRight: TLabel;
    lblRows: TLabel;
    lblTop: TLabel;
    lblWidth: TLabel;
    lblX: TLabel;
    lblY: TLabel;
    pnlGridOptions: TJvMovablePanel;
    lblNameTemplate: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    pnlSelections: TPanel;
    pnlSheet: TPanel;
    pnlLeft: TPanel;
    pnlBottom: TPanel;
    pnlTop: TPanel;
    ScrollBox1: TScrollBox;
    spBottom: TSpinEdit;
    spCols: TSpinEdit;
    sbCloseOptions: TSpeedButton;
    spHeight: TSpinEdit;
    spLeft: TSpinEdit;
    Splitter1: TSplitter;
    spRight: TSpinEdit;
    spRows: TSpinEdit;
    spTop: TSpinEdit;
    spWidth: TSpinEdit;
    spX: TSpinEdit;
    spY: TSpinEdit;
    procedure bbAddClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure bbSpritesheetOpenClick(Sender: TObject);
    procedure cbGrigChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cbSizesChange(Sender: TObject);
    procedure dgImportedFramesDrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure FormDestroy(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of string);
    procedure imgImportedMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgImportedMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgImportedMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgImportedPaint(Sender: TObject);
    procedure SelectionChange(Sender: TObject);
    procedure spWidthChange(Sender: TObject);
    procedure LoadSpriteSheet(aFile: TFilename);
    procedure LoadFramesFromGif(aGif : TFilename);
  private
    isDown : Boolean; //if mouse left button pressedfor selection
    isSelection : Boolean; //if mouse pressed inside any pravious selected rects
    SelRect : TRect;  //current selection
    pStart,
    pEnd    : TPoint; //points for selection
    FSelectionsList: TSelectionList;
    aImg : TBGRABitmap;
    aBuff : TBGRABitmap;
    Scale : Byte;
    srcFile :TFileName;
    procedure DrawGrid(const aCanvas : TCanvas; const aRect : TRect; cellwidth, cellheight : Integer);
  public
    CroppedRect : TRect;
    property SelectionsList : TSelectionList read FSelectionsList; //here will be all selected rects

  end;



var
  frmImportSheet: TfrmImportSheet;

implementation

 uses uglobals, umain, ugridoptions;
{$R *.lfm}

{ TSelectionList }

constructor TSelectionList.Create;
begin
  inherited Create;
  FKeynames:=TStringList.Create;
end;

procedure TSelectionList.Add(aData: TSelectionData);
begin
  if FKeynames.IndexOf(aData.FKey)<>-1 then begin
   FKeynames.Add(aData.Key);
   Self[aData.Key]:=aData;
  end else FreeAndNil(aData);
  if Assigned(FOnChange) then FOnChange(Self);
end;

function TSelectionList.CheckSelection(const x, y: Integer; out aIdx: String
  ): Boolean;
var
  i: Integer;
begin
  Result := False;
  aIdx:='';
  if Count=0 then Exit;
  for i:=0 to Count-1 do begin
    if Self[FKeynames.Strings[i]].Rect.Contains(Point(x,y)) then begin
     aIdx:=FKeynames.Strings[i];
     Result:=True;
     Exit;
    end;
  end;
end;

procedure TSelectionList.Clear;
begin
  FKeynames.Clear;
  Self.Clear;
end;

destructor TSelectionList.Destroy;
begin
  FreeAndNil(FKeynames);
  inherited Destroy;
end;

procedure TSelectionList.DrawSelections(aCanvas: TCanvas);
var p : TPoint;
  i: Integer;
begin
  if FCount=0 then Exit;
  aCanvas.Pen.Color:=clLime;
  aCanvas.Pen.Mode:=pmXor;
  aCanvas.Font.Color:=clLime;
  aCanvas.Font.Size:=8;
  for i:=0 to FCount-1 do begin
    p:=Self[FKeynames.Strings[i]].Rect.TopLeft;
    aCanvas.Rectangle(Self[FKeynames.Strings[i]].Rect);
    aCanvas.TextOut(p.X,p.Y,IntToStr(Self[FKeynames.Strings[i]].Index));

  end;
end;

function TSelectionList.GetCount: Integer;
begin
  Result:=FKeynames.Count;
end;

procedure TSelectionList.NewSelection(const aNameTemplate: String;
  const aRect: TRect);
var
  aSelData : TSelectionData;
begin
  aSelData:=TSelectionData.Create(FCount,aNameTemplate+IntToStr(FCount),aRect);
  Add(aSelData);
  aSelData:=nil;
end;

procedure TSelectionList.RenameKey(const aOldKey, aNewKey: String);
begin
  Self[aNewKey]:=TSelectionData.Create(Self[aOldKey].Index,aNewKey,Self[aOldKey].Rect);
  Self.Remove(aOldKey);
  FKeynames.Strings[FKeynames.IndexOf(aOldKey)]:=aNewKey;
end;

procedure TSelectionList.SetOnChange(AValue: TNotifyEvent);
begin
  if FOnChange=AValue then Exit;
  FOnChange:=AValue;
end;

{ TSelectionData }

constructor TSelectionData.Create(aidx: Integer; akey: String; aRect: TRect);
begin
  inherited Create;
  fIndex:=aidx;
  FKey:=akey;
  fRect:=aRect;
end;

destructor TSelectionData.destroy;
begin
  inherited destroy;
end;

{ TfrmImportSheet }

procedure TfrmImportSheet.bbSpritesheetOpenClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then begin
    edNameTemplate.Text:=ExtractFileNameWithoutExt(OpenPictureDialog1.FileName);
    if LowerCase(ExtractFileExt(OpenPictureDialog1.FileName))='.gif' then begin
     LoadFramesFromGif(OpenPictureDialog1.FileName);
    end else  LoadSpriteSheet(OpenPictureDialog1.FileName);
    if SelectionsList.Count=0 then dgImportedFrames.RowCount:=1
    else dgImportedFrames.RowCount:=SelectionsList.Count+1;
    dgImportedFrames.Invalidate;
  end;
end;

procedure TfrmImportSheet.bbAddClick(Sender: TObject);
begin

end;

procedure TfrmImportSheet.bbCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmImportSheet.cbGrigChange(Sender: TObject);
begin
  pnlGridOptions.Visible:=cbGrig.Checked;
  imgImported.Invalidate;
end;

procedure TfrmImportSheet.cbSizesChange(Sender: TObject);
var
  tmp : TBGRABitmap;
begin
  case cbSizes.ItemIndex of
  0:Scale:=1;
  1:Scale:=2;
  2:Scale:=4;
  end;
  if srcFile='' then Exit;
  tmp:=TBGRABitmap.Create(srcFile);
  FreeAndNil(aImg);
  aImg:=tmp.Resample(tmp.Width*Scale,tmp.Height*Scale,rmSimpleStretch);
  FreeAndNil(tmp);
  aBuff.SetSize(aImg.Width,aImg.Height);
  imgImported.Picture.Bitmap.Assign(aImg);
end;

procedure TfrmImportSheet.dgImportedFramesDrawCell(Sender: TObject; aCol,
  aRow: Integer; aRect: TRect; aState: TGridDrawState);
var
  s: String;
  ss : TSelectionData;
begin
  if aRow<>0 then ss:=SelectionsList[SelectionsList.FKeynames.Strings[aRow]];
  case aCol of
  0:begin
     if aRow=0 then s:='Idx'
     else s:=IntToStr(ss.Index);

    end;
  1: begin
     if aRow=0 then s:='Name'
     else s:=ss.Key;
    end;
  2:begin
     if aRow=0 then begin
      s:='Preview';
     end
     else begin

     end;
    end;
  end;
end;

procedure TfrmImportSheet.DrawGrid(const aCanvas : TCanvas; const aRect: TRect; cellwidth,
  cellheight: Integer);
var i, xsize, ysize : Integer;
begin
  xsize := (aRect.Right-aRect.Left) div cellheight;
  ysize := (aRect.Bottom-aRect.Top) div cellwidth;
  aCanvas.Pen.Mode:=pmCopy;
  aCanvas.Pen.Color:=clNavy;
  For i := 1 to ysize do aCanvas.Line(aRect.Left,aRect.Top+cellwidth*i,aRect.Right,aRect.Top+cellwidth*i);
  For i := 1 to xsize do aCanvas.Line(aRect.Left+cellheight*i,aRect.Top,aRect.Left+cellheight*i,aRect.Bottom);
  aCanvas.Brush.Style:=bsClear;
  aCanvas.Rectangle(aRect);
end;

procedure TfrmImportSheet.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  frmGridOptions.Hide;
end;

procedure TfrmImportSheet.SelectionChange(Sender: TObject);
begin
  dgImportedFrames.RowCount:=FSelectionsList.Count+1;
  dgImportedFrames.Invalidate;
end;

procedure TfrmImportSheet.spWidthChange(Sender: TObject);
begin
  case TComponent(Sender).Tag of
  1: begin
   //cell width change
    spCols.Value:=(CroppedRect.Width-spX.Value) div spWidth.Value;
  end;
  2: begin
  //cell height change
    spRows.Value:=(CroppedRect.Height-spY.Value) div spHeight.Value;
  //rows change
  end;
  5:begin
    spWidth.Value:=(CroppedRect.Width-spX.Value) div spCols.Value;
  //rows change
  end;
  6: begin
    spHeight.Value:=(CroppedRect.Height-spY.Value) div spRows.Value;
  end;
 end;
 imgImported.Invalidate;
end;

procedure TfrmImportSheet.FormCreate(Sender: TObject);
begin
  FSelectionsList:=TSelectionList.Create;
  FSelectionsList.OnChange:=@SelectionChange;
  aImg:=TBGRABitmap.Create(0,0);
  aBuff:=TBGRABitmap.Create(0,0);
end;

procedure TfrmImportSheet.FormDestroy(Sender: TObject);
begin
  FreeAndNil(aBuff);
  FreeAndNil(aImg);
  FreeAndNil(FSelectionsList);
end;

procedure TfrmImportSheet.FormDropFiles(Sender: TObject;
  const FileNames: array of string);
begin
  //todo: check file extension (load supported images only) load dropped image
  LoadSpritesheet(FileNames[0]);
end;

procedure TfrmImportSheet.imgImportedMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //work if only left button pressed
  if Button<>mbLeft then Exit;
  //if click not in any rect start select new rect
     isDown:=True;
     isSelection:=False;
     pStart.X:=x;
     pEnd.X:=x;
     pStart.Y:=y;
     pEnd.Y:=y;
     SelRect.Left:=x;
     SelRect.Right:=x;
     SelRect.Top:=y;
     SelRect.Bottom:=y;
end;

procedure TfrmImportSheet.imgImportedMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  pEnd.X:=x;
  pEnd.Y:=Y;
  if pStart.X>pEnd.X then SwapInts(pStart.X,pEnd.X);
  if pStart.Y>pEnd.Y then SwapInts(pStart.Y,pEnd.Y);
  SelRect.TopLeft:=pStart;
  SelRect.BottomRight:=pEnd;
end;

procedure TfrmImportSheet.imgImportedMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
function GetCellRect(const x,y : Integer): TRect;
var
  ofx,ofy, cw,ch : Integer;
  posx,posy : Integer;

  function CellCoords(x, y: Integer): TPoint;
  var posx,posy : Integer; //relative grid coordinates
  begin
    Result.X:= posx div cw;
    Result.Y:= posy div ch;
  end;


begin
   ofx:=CroppedRect.Left;
   ofy:=CroppedRect.Top;
   cw:=frmGridOptions.spWidth.Value;
   ch:=frmGridOptions.spHeight.Value;
   posx:=x-ofx;
   posy:=y-ofy;
   Result.Left:= ofx+(posx div cw);
   Result.Top:= ofy+(posy div ch);
   Result.Right:=Result.Left+cw;
   Result.Bottom:=Result.Top+ch;
   {$IFDEF DEBUG}
   DebugLn('In: CetCellRect() Rect:'+Format('x=%d, y=%d, x1=%d, y1=%d',[Result.Left,Result.Top,Result.Right,Result.Bottom]));
   {$ENDIF}
end;

var
  aIdx : String;
begin
  if Button=mbLeft then begin
    //if grid enabled then check click coords and get selected cell rect
  if cbGrig.Checked then begin
    FSelectionsList.NewSelection(edNameTemplate.Text,GetCellRect(x,y));
  end else
  //check if click in any selected rect ten make it active
  if SelectionsList.CheckSelection(x,y,aIdx) then begin
   SelRect:=SelectionsList[aIdx].Rect;

   isSelection:=True;
   //todo: if click not in any rect start select new rect
  end else begin

  end;
     isDown:=False;
   SelectionChange(Sender);
end;
end;

procedure TfrmImportSheet.imgImportedPaint(Sender: TObject);
begin
  aBuff.DrawCheckers(Rect(0,0,aBuff.Width,aBuff.Height),
                       $BFBFBF,
                       $FFFFFF,
                       8, 8);
  aBuff.PutImage(0,0,aImg,dmDrawWithTransparency);
  if cbGrig.Checked then begin
       DrawGrid(aBuff.Canvas,
           CroppedRect,
           frmGridOptions.spHeight.Value,
           frmGridOptions.spWidth.Value)
  end else begin
   //draw all selections as rect
    FSelectionsList.DrawSelections(aBuff.Canvas);
    end;
    //todo: draw current selection as hilighted
    //if not SelRect.IsEmpty then begin
         aBuff.Canvas.Pen.Mode:=pmXor;
         aBuff.Canvas.Pen.Color:=clRed;
         aBuff.Canvas.Pen.Style:=psSolid;
         aBuff.Canvas.Rectangle(SelRect);
         {$IFDEF DEBUG}
         DebugLn('In: ImgImportPaint() SelRect: (',IntToStr(SelRect.Left),', ', IntToStr(SelRect.Top),', ',IntToStr(SelRect.Width),', ',IntToStr(SelRect.Height),')');
         {$ENDIF}
    //end;
   aBuff.Draw(TImage(Sender).Canvas,0,0);
end;

procedure TfrmImportSheet.LoadSpriteSheet(aFile: TFilename);
var
  ext : String;
begin
  ext:=LowerCase(ExtractFileExt(aFile));
  if ExtensionSupported(ext) then begin
   aImg.LoadFromFile(aFile);
   imgImported.SetBounds(0,0,aImg.Width,aImg.Height);
   cbSizes.ItemIndex:=0;
   cbSizesChange(Self);
   srcFile:=aFile;
   edNameTemplate.Text:=ChangeFileExt(ExtractFileName(srcFile),'');
   CroppedRect:=Rect(0,0,aImg.Width,aImg.Height);
   with frmGridOptions do begin
      spBottom.Value:=0;
      spTop.Value:=0;
      spLeft.Value:=0;
      spRight.Value:=0;
   end;
   cbSizesChange(Self);
  end;
end;

procedure TfrmImportSheet.LoadFramesFromGif(aGif: TFilename);
var
  aBmp : TBGRABitmap;
  i: Integer;
begin
  anImportedGif.AnimatedGifToSprite(aGif);
  aBmp:=TBGRABitmap.Create(anImportedGif.Sprite);
  aImg.Assign(aBmp);
  FreeAndNil(aBmp);
  //let`s add every frame to selections
  if anImportedGif.SpriteCount>1 then begin
   for i:=0 to anImportedGif.SpriteCount-1 do begin
    SelectionsList.NewSelection(edNameTemplate.Text,
                                Rect(anImportedGif.Width*(cbSizes.ItemIndex+1)*i,
                                0,
                                anImportedGif.Width*(cbSizes.ItemIndex+1)*(i+1),
                                anImportedGif.Height*(cbSizes.ItemIndex+1)));
   end;
  end else begin
   SelectionsList.NewSelection(edNameTemplate.Text,Rect(0,0,(anImportedGif.Width-1)*(cbSizes.ItemIndex+1),(anImportedGif.Height-1)*(cbSizes.ItemIndex+1)));
  end;
end;

end.

