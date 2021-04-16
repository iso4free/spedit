//**********************************************************************
//*    Sprite Editor 4.0                                               *
//*    Copyright (c) 2000-2019 by ViruZ                                *
//*                                                                    *
//*    See the file COPYING.FPC, included in this distribution,        *
//*    for details about the copyright.                                *
//*                                                                    *
//*    This program is distributed in the hope that it will be useful, *
//*    but WITHOUT ANY WARRANTY; without even the implied warranty of  *
//*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.            *
//*                                                                    *
//**********************************************************************
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
    Label1: TBGRALabelFX;
    ShowSplashCheckBox: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure ShowSplashCheckBoxChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private

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
var
  fntsize: Integer;
begin
  //Show random 'stars'
  Randomize;
   fntsize:=1;
   repeat
    Label1.Font.Size:=fntsize;
    Inc(fntsize);
    SkyImage.Canvas.Pixels[Random(Width),Random(Height)]:=Random(MaxInt);
    Application.ProcessMessages;
   until fntsize>=50;
   repeat
    Label1.Font.Size:=fntsize;
    Dec(fntsize);
    SkyImage.Canvas.Pixels[Random(Width),Random(Height)]:=Random(MaxInt);
    Application.ProcessMessages;
   until fntsize<=1;
end;

end.

