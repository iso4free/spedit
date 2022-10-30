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
unit udraw;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Graphics, uglobals, BGRABitmap, BGRABitmapTypes;

type

  //basic drawing class

  { TSPDrawTool }

  PSPDrawTool = ^TSPDrawTool;
  TSPDrawTool = class
  private
    fColor: TBGRAPixel;
    procedure SetColor(AValue: TBGRAPixel);
    protected
      fstartx,starty : Integer;  //coords from start drawing
      fX,fY          : Integer;  //current coords
      fBuffer : TBGRABitmap;
      FMouseDown: Boolean;
      FPenSize: Byte;
      FPrevPoint: TPoint;
      procedure SetColor(AValue: TColor);
      procedure SetPenSize(AValue: Byte);
      procedure SetPrevPoint(AValue: TPoint);
    public
      constructor Create(Width : Integer = 32; Height : Integer = 32);
      destructor Destroy; override;
      property PrevPoint : TPoint read FPrevPoint write SetPrevPoint;
      property PenSize : Byte read FPenSize write SetPenSize;
      procedure StartDraw(x,y : Integer);virtual;//abstract;
      procedure MouseMove(x,y : Integer);virtual;//abstract;
      property Color : TBGRAPixel read fColor write SetColor;
      procedure MouseUp(x,y : Integer);virtual;
      procedure Render(aBMP : TBGRABitmap);
  end;


  { TSPPen - simple pen tool}

  TSPPen = class(TSPDrawTool)
     prevx, prevy : Integer;
     procedure StartDraw(x, y: Integer; aColor : TColor);//override;
     procedure MouseMove(x,y : Integer); override;
  end;


  TSPLine = class(TSPDrawTool)

  end;


implementation

{ TSPPen }

procedure TSPPen.StartDraw(x, y: Integer; aColor: TColor);
begin
  fColor:=aColor;
  fBuffer.Canvas.Pen.Color:=fColor;
  fBuffer.Canvas.Pen.Width:=FPenSize;
  prevx := x;
  prevy := y;
end;

procedure TSPPen.MouseMove(x, y: Integer);
begin
  fBuffer.Canvas.Pen.Color:=fColor;
  fBuffer.Canvas.Pen.Width:=FPenSize;
  fBuffer.Canvas.Line(prevx,prevy,x,y);
  prevx:=x;
  prevy:=y;
end;

{ TSPDrawTool }

procedure TSPDrawTool.SetPenSize(AValue: Byte);
begin
  if FPenSize=AValue then Exit;
  if (AValue>1) and (AValue<4) then FPenSize:=AValue;
end;

procedure TSPDrawTool.SetColor(AValue: TBGRAPixel);
begin
  if fColor=AValue then Exit;
  fColor:=AValue;
end;

procedure TSPDrawTool.SetColor(AValue: TColor);
begin
  fColor:=AValue;
end;


procedure TSPDrawTool.SetPrevPoint(AValue: TPoint);
begin
  if FPrevPoint=AValue then Exit;
  FPrevPoint:=AValue;
end;

constructor TSPDrawTool.Create(Width: Integer; Height: Integer);
begin
  fBuffer:=TBGRABitmap.Create(Width,Height,ColorToBGRA(clNone,0));
  FPenSize:=1; //default 1px
end;

destructor TSPDrawTool.Destroy;
begin
  FreeAndNil(fBuffer);
  inherited Destroy;
end;

procedure TSPDrawTool.StartDraw(x, y: Integer);
begin

end;

procedure TSPDrawTool.MouseMove(x, y: Integer);
begin

end;

procedure TSPDrawTool.MouseUp(x, y: Integer);
begin

end;

procedure TSPDrawTool.Render(aBMP: TBGRABitmap);
var ImagePos: TPoint;
  w,h : Integer;
  tmppix : TBGRAPixel;
begin
 //draw all layers to canvas
   for w:=0 to fBuffer.Width-1 do
     for h:=0 to fBuffer.Height-1 do begin
       tmppix := fBuffer.GetPixel(w,h);
       if tmppix.alpha<>0 then aBMP.SetPixel(w,h,tmpPix);
     end;
end;


end.

