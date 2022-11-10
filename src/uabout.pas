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

unit uabout;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF DEBUG}LazLoggerBase,{$ENDIF}
  SysUtils, Forms, Graphics, ExtCtrls, StdCtrls, BGRASpriteAnimation,
  BGRALabelFX, Classes;

type

  { TfrmAbout }

  TfrmAbout = class(TForm)
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
  frmAbout: TfrmAbout;

implementation

{$R *.frm}

uses uglobals;

{ TfrmAbout }

procedure TfrmAbout.FormActivate(Sender: TObject);
begin
  ShowSplashCheckBox.Checked:=INI.ReadBool('INTERFACE','SHOWSPLASH',false);
  Timer1.Enabled:=true;
  Timer2.Enabled:=true;
end;

procedure TfrmAbout.FormClick(Sender: TObject);
begin
  Timer1.Enabled:=false;
  Timer2.Enabled:=false;
  INI.WriteBool('INTERFACE','SHOWSPLASH',ShowSplashCheckBox.Checked);
  Close;
end;

procedure TfrmAbout.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  Randomize;
  BgImage:=TImage.Create(frmAbout);
  BgImage.Width:=SkyImage.Width;
  BgImage.Height:=SkyImage.Height;
  for i:= 0 to 300 do  Star(Random(Width),Random(Height),Random(5),GetRandomColor(100));
  fntsize:=8;
  increment:=1;
end;

procedure TfrmAbout.FormDestroy(Sender: TObject);
begin
  FreeAndNil(BgImage);
end;

procedure TfrmAbout.FormKeyPress(Sender: TObject; var Key: char);
begin
  Timer1.Enabled:=false;
  Timer2.Enabled:=false;
end;

procedure TfrmAbout.ShowSplashCheckBoxChange(Sender: TObject);
begin
  INI.WriteBool('INTERFACE','SHOWSPLASH',ShowSplashCheckBox.Checked);
end;

procedure TfrmAbout.Timer1Timer(Sender: TObject);
begin
  Label3.Visible:=not Label3.Visible;
end;

procedure TfrmAbout.Timer2Timer(Sender: TObject);
begin
  SkyImage.Canvas.CopyRect(SkyImage.ClientRect,BgImage.Canvas,BgImage.ClientRect);
  Label1.Font.Size:=fntsize;
  fntsize:=fntsize+increment;
  Application.ProcessMessages;
  if fntsize=40 then increment:=-1 else
     if fntsize=8 then increment:=1;
end;

procedure TfrmAbout.Star(x, y: Integer; Size: Integer; Colour: TColor);
begin
  BgImage.Canvas.Pen.Color:= Colour;
  BgImage.Canvas.Brush.Color:= Colour;
  // drawing star uses coords and size
  BgImage.Canvas.Polygon( [Point(x, y-size),
  Point(x-size div 4, y-size div 4), Point(x-size, y),
  Point(x-size div 4, y+size div 4), Point(x, y+size),
  Point(x+size div 4, y+size div 4), Point(x+size, y),
  Point(x+size div 4, y-size div 4), Point(x, y-size)]);
end;

function TfrmAbout.GetRandomColor(A: Integer): TColor;
begin
 if A > 255 then A := 255;
 // take random color value
 Result := RGBToColor(Random(256-A)+A, Random(256-A)+A, Random(256-A)+A);
end;

end.
