//'About' form of Spedit4
unit uzastavka;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Forms, Graphics, ExtCtrls, StdCtrls, BGRASpriteAnimation,
  BGRALabelFX, Classes;

type

  { TfrmZastavka }

  TfrmZastavka = class(TForm)
    BGRASpriteAnimation1: TBGRASpriteAnimation;
    SkyImage: TImage;
    BgImage : TImage;
    Label1: TBGRALabelFX;
    ShowSplashCheckBox: TCheckBox;
    Label2: TBGRALabelFX;
    Label3: TBGRALabelFX;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure ShowSplashCheckBoxChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Star(x,y: Integer; Size: Integer; Colour: TColor);
    function GetRandomColor( A: Integer): TColor;
  private
    fntsize : Integer;
    increment : Integer;
  public
  end;

var
  frmZastavka: TfrmZastavka;

implementation

{$R *.frm}

uses uglobals;

{ TfrmZastavka }

procedure TfrmZastavka.FormActivate(Sender: TObject);
begin
  ShowSplashCheckBox.Checked:=INI.ReadBool('INTERFACE','SHOWSPLASH',false);
  Timer1.Enabled:=true;
  Timer2.Enabled:=true;
end;

procedure TfrmZastavka.FormClick(Sender: TObject);
begin
  Timer1.Enabled:=false;
  Timer2.Enabled:=false;
  INI.WriteBool('INTERFACE','SHOWSPLASH',ShowSplashCheckBox.Checked);
  Close;
end;

procedure TfrmZastavka.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  Randomize;
  BgImage:=TImage.Create(frmZastavka);
  BgImage.Width:=SkyImage.Width;
  BgImage.Height:=SkyImage.Height;
  for i:= 0 to 300 do  Star(Random(Width),Random(Height),Random(5),GetRandomColor(100));
  fntsize:=8;
  increment:=1;
end;

procedure TfrmZastavka.FormDestroy(Sender: TObject);
begin
  FreeAndNil(BgImage);
end;

procedure TfrmZastavka.FormKeyPress(Sender: TObject; var Key: char);
begin
  Timer1.Enabled:=false;
  Timer2.Enabled:=false;
end;

procedure TfrmZastavka.ShowSplashCheckBoxChange(Sender: TObject);
begin
  INI.WriteBool('INTERFACE','SHOWSPLASH',ShowSplashCheckBox.Checked);
end;

procedure TfrmZastavka.Timer1Timer(Sender: TObject);
begin
  Label3.Visible:=not Label3.Visible;
end;

procedure TfrmZastavka.Timer2Timer(Sender: TObject);
begin
  SkyImage.Canvas.CopyRect(SkyImage.ClientRect,BgImage.Canvas,BgImage.ClientRect);
  Label1.Font.Size:=fntsize;
  fntsize:=fntsize+increment;
  Application.ProcessMessages;
  if fntsize=40 then increment:=-1 else
     if fntsize=8 then increment:=1;
end;

procedure TfrmZastavka.Star(x, y: Integer; Size: Integer; Colour: TColor);
begin
  BgImage.Canvas.Pen.Color:= Colour;
  BgImage.Canvas.Brush.Color:= Colour;
  // Рисуем звезду, используя переданные координаты и размер
  BgImage.Canvas.Polygon( [Point(x, y-size),
  Point(x-size div 4, y-size div 4), Point(x-size, y),
  Point(x-size div 4, y+size div 4), Point(x, y+size),
  Point(x+size div 4, y+size div 4), Point(x+size, y),
  Point(x+size div 4, y-size div 4), Point(x, y-size)]);
end;

function TfrmZastavka.GetRandomColor(A: Integer): TColor;
begin
 if A > 255 then A := 255;
 // Получение случайного цвета, в зависимости от значения A
 Result := RGBToColor(Random(256-A)+A, Random(256-A)+A, Random(256-A)+A);
end;

end.

