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

  PSPDrawTool = ^TSPDrawTool;
  TSPDrawTool = class
  private
    fColor: TBGRAPixel;
    procedure SetColor(AValue: TBGRAPixel);
    protected
      fstartx,fstarty : Integer;  //coords from start drawing
      fX,fY          : Integer;  //current coords
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
     prevx, prevy : Integer;
     procedure StartDraw(x, y: Integer; aColor : TBGRAPixel);override;
     procedure MouseMove(x,y : Integer); override;
  end;


  { TSPLine - draw simple line}

  TSPLine = class(TSPDrawTool)
     prevx, prevy : Integer;
     procedure StartDraw(x, y: Integer; aColor : TBGRAPixel);override;
     procedure MouseMove(x,y : Integer); override;
  end;


implementation

{ TSPLine }

procedure TSPLine.StartDraw(x, y: Integer; aColor: TBGRAPixel);
begin
  Color:=aColor;
  //fBuffer.EraseRect(fBuffer.ClipRect,0);
  fstartx:=x;
  fstarty:=y;
  prevx:=x;
  prevy:=y;
  fBuffer.Canvas.FillRect(x,y,x+PenSize-1,y+PenSize-1);
end;

procedure TSPLine.MouseMove(x, y: Integer);
begin
  fBuffer.EraseLine(fstartx,fstarty,PrevX,PrevY,0,True);
  prevx:=x;
  prevy:=y;
  fBuffer.DrawLine(fstartx,fstarty,PrevX,PrevY,fColor,True);
end;

{ TSPPen }

procedure TSPPen.StartDraw(x, y: Integer; aColor: TBGRAPixel);
begin
  fColor:=aColor;
  fBuffer.Canvas.Pen.Color:=fColor;
  fBuffer.Canvas.Pen.Width:=FPenSize;
  prevx := x;
  prevy := y;
  fBuffer.Canvas.FillRect(x,y,x+PenSize-1,y+PenSize-1);
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
 Exception.Create('You must override StartDraw() method!');
end;

procedure TSPDrawTool.MouseMove(x, y: Integer);
begin
 Exception.Create('You must override MouseMove() method!');
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

