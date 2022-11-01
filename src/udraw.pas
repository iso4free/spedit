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
  {$IFDEF DEBUG}LazLoggerBase,{$ENDIF}
  Classes, SysUtils, Graphics, uglobals, BGRABitmap, BGRABitmapTypes;

type

  //basic drawing class

  { TSPDrawTool }

 // PSPDrawTool = ^TSPDrawTool;
  TSPDrawTool = class
  private
    fColor: TBGRAPixel;
    procedure SetColor(AValue: TBGRAPixel);
    protected
      fstartx,fstarty : Integer;  //coords from start drawing
      fX,fY          : Integer;  //current coords
      prevx, prevy : Integer;    //previous coords
      fBuffer : TBGRABitmap;
      FMouseDown: Boolean;
      FPenSize: Byte;
      FPrevPoint: TPoint;
      procedure SetPenSize(AValue: Byte);
      procedure SetPrevPoint(AValue: TPoint);
    public
      constructor Create(Width : Integer = 32; Height : Integer = 32);
      destructor Destroy; override;
      procedure StartDraw(x,y : Integer; aColor : TBGRAPixel);virtual;
      procedure MouseMove(x,y : Integer); virtual;
      property PrevPoint : TPoint read FPrevPoint write SetPrevPoint;
      property PenSize : Byte read FPenSize write SetPenSize;
      property Color : TBGRAPixel read fColor write SetColor;
      procedure Render(aBMP : TBGRABitmap);
  end;


  { TSPPen - simple pen tool}

  TSPPen = class(TSPDrawTool)
     procedure StartDraw(x, y: Integer; aColor : TBGRAPixel);override;
     procedure MouseMove(x,y : Integer); override;
  end;


  { TSPLine - draw simple line}

  TSPLine = class(TSPDrawTool)
     procedure StartDraw(x, y: Integer; aColor : TBGRAPixel);override;
     procedure MouseMove(x,y : Integer); override;
  end;

  { TSPEraser }

  TSPEraser = class(TSPDrawTool)
     procedure StartDraw(x, y: Integer; aColor : TBGRAPixel);override;
     procedure MouseMove(x,y : Integer); override;
  end;

implementation

{ TSPEraser }

procedure TSPEraser.StartDraw(x, y: Integer; aColor: TBGRAPixel);
begin
  inherited StartDraw(x, y, aColor);

end;

procedure TSPEraser.MouseMove(x, y: Integer);
begin
  inherited MouseMove(x, y);
end;

{ TSPLine }

procedure TSPLine.StartDraw(x, y: Integer; aColor: TBGRAPixel);
begin
  Color:=aColor;
  fBuffer.Canvas.Pen.Color:=Color;
  fstartx:=x;
  fstarty:=y;
  prevx:=x;
  prevy:=y;

  Layers[FrameGrid.ActiveLayer].Drawable.Canvas.Pen.Color:=Color;
  if FPenSize=1 then fBuffer.SetPixel(x,y,Color) else
     fBuffer.Canvas.FillRect(x,y,x+PenSize,y+PenSize);
end;

procedure TSPLine.MouseMove(x, y: Integer);
var oldPenMode : TPenMode;
begin
  oldPenMode:=fBuffer.Canvas.Pen.Mode;
  Layers[FrameGrid.ActiveLayer].Drawable.Canvas.Pen.Mode:=pmXor;
  Layers[FrameGrid.ActiveLayer].Drawable.Canvas.Line(fstartx,fstarty,PrevX,PrevY);
  fBuffer.Canvas.Pen.Mode:=pmXor;
  fBuffer.Canvas.Line(fstartx,fstarty,PrevX,PrevY);

  prevx:=x;
  prevy:=y;
   Layers[FrameGrid.ActiveLayer].Drawable.Canvas.Pen.Mode:=oldPenMode;
  fBuffer.Canvas.Pen.Mode:=oldPenMode;
  fBuffer.Canvas.Line(fstartx,fstarty,PrevX,PrevY);
end;

{ TSPPen }

procedure TSPPen.StartDraw(x, y: Integer; aColor: TBGRAPixel);
begin
  fColor:=aColor;
  fBuffer.Canvas.Pen.Color:=fColor;
  fBuffer.Canvas.Pen.Width:=FPenSize;
  prevx := x;
  prevy := y;
  if FPenSize=1 then fBuffer.SetPixel(x,y,Color) else
     fBuffer.Canvas.FillRect(x,y,x+PenSize,y+PenSize);
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
  FPenSize:=AValue;
end;

procedure TSPDrawTool.SetColor(AValue: TBGRAPixel);
begin
  if fColor=AValue then Exit;
  fColor:=AValue;
end;

procedure TSPDrawTool.SetPrevPoint(AValue: TPoint);
begin
  if FPrevPoint=AValue then Exit;
  FPrevPoint:=AValue;
end;

constructor TSPDrawTool.Create(Width: Integer; Height: Integer);
begin
  fBuffer:=TBGRABitmap.Create(Width,Height);
  FPenSize:=1; //default 1px
end;

destructor TSPDrawTool.Destroy;
begin
  FreeAndNil(fBuffer);
  inherited Destroy;
end;

procedure TSPDrawTool.StartDraw(x, y: Integer; aColor: TBGRAPixel);
begin
 Assert(False,'You must override StartDraw method!');
end;

procedure TSPDrawTool.MouseMove(x, y: Integer);
begin
 Assert(False,'You must override MouseMove() method!');
end;

procedure TSPDrawTool.Render(aBMP: TBGRABitmap);
begin
 aBMP.PutImage(0,0,fBuffer,dmDrawWithTransparency);
end;


end.

