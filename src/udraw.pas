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
  {$IFDEF DEBUG}LazLoggerBase,{$ENDIF} Controls,
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
      fstartx,fstarty : Integer;    //coords from start drawing
      fX,fY           : Integer;    //current coords
      prevx, prevy    : Integer;    //previous coords
      FPenSize        : Byte;
      FPrevPoint      : TPoint;
      procedure SetPenSize(AValue: Byte);
      procedure SetPrevPoint(AValue: TPoint);
    public
      constructor Create(aPenSize: Integer = 1);
      destructor Destroy; override;
      procedure StartDraw(x,y : Integer; Shift: TShiftState; aButton : TMouseButton; aColor : TBGRAPixel);virtual;
      procedure MouseMove(x,y : Integer); virtual;
      procedure MouseUp(x,y : Integer; Shift: TShiftState); virtual;
      procedure FinishDraw;virtual;
      property PrevPoint : TPoint read FPrevPoint write SetPrevPoint;
      property PenSize : Byte read FPenSize write SetPenSize;
      property Color : TBGRAPixel read fColor write SetColor;
  end;


  { TSPPen - simple pen tool}

  TSPPen = class(TSPDrawTool)
     procedure StartDraw(x, y: Integer;Shift: TShiftState;aButton: TMouseButton; aColor : TBGRAPixel);override;
     procedure MouseMove(x,y : Integer); override;
  end;


  { TSPLine - draw simple line}

  TSPLine = class(TSPDrawTool)
     procedure StartDraw(x,y : Integer; Shift: TShiftState; aButton : TMouseButton; aColor : TBGRAPixel);override;
     procedure MouseMove(x,y : Integer); override;
  end;

  { TSPRect }

  TSPRect = class(TSPDrawTool)
     procedure StartDraw(x,y : Integer; Shift: TShiftState; aButton : TMouseButton; aColor : TBGRAPixel);override;
     procedure MouseMove(x,y : Integer); override;
  end;

  { TSPEraser }

  TSPEraser = class(TSPDrawTool)
     procedure StartDraw(x,y : Integer; Shift: TShiftState; aButton : TMouseButton; aColor : TBGRAPixel);override;
     procedure MouseMove(x,y : Integer); override;
     procedure MouseUp(x,y : Integer; Shift: TShiftState);override;
     procedure FinishDraw; override;
  end;

  { TSPPipette }

  TSPPipette = class(TSPDrawTool)
   private
    fMainColor : Boolean;
   public
     procedure StartDraw(x,y : Integer; Shift: TShiftState; aButton : TMouseButton; aColor : TBGRAPixel);override;
     procedure MouseMove(x,y : Integer); override;
     procedure MouseUp(x,y : Integer; Shift: TShiftState);override;
     procedure FinishDraw; override;
  end;

implementation
 uses udrawtools;

{ TSPRect }

procedure TSPRect.MouseMove(x, y: Integer);
var
  i: Integer;
begin
  ClearBitmap(Layers[csDRAWLAYER].Drawable);
  prevx:=x+1;
  prevy:=y+1;
  Layers[csDRAWLAYER].Drawable.Canvas.Pen.Color:=fColor;
  Layers[csDRAWLAYER].Drawable.Canvas.Brush.Color:=clNone;
  Layers[csDRAWLAYER].Drawable.Canvas.Pen.Width:=FPenSize;
  //Layers[csDRAWLAYER].Drawable.Canvas.Rectangle(fstartx,fstarty,PrevX+PenSize,PrevY+PenSize);
  if PenSize>1 then
     for i:=0 to PenSize-1 do Layers[csDRAWLAYER].Drawable.Rectangle(fstartx+i,fstarty+i,prevx-i,prevy-i,Color,BGRAPixelTransparent)
    // Layers[csDRAWLAYER].Drawable.FillRect(fstartx+1,fstarty+1,prevx,prevy,BGRAPixelTransparent)
  else
     Layers[csDRAWLAYER].Drawable.Rectangle(fstartx,fstarty,prevx,prevy,Color,BGRAPixelTransparent);
end;

procedure TSPRect.StartDraw(x, y: Integer; Shift: TShiftState;
  aButton: TMouseButton; aColor: TBGRAPixel);
begin
  if (not LayerExists(FrameGrid.ActiveLayer)) or (not LayerExists(csDRAWLAYER)) then Exit;
  Color:=aColor;
  fstartx:=x;
  fstarty:=y;
  prevx:=x;
  prevy:=y;
  Layers[csDRAWLAYER].Drawable.Canvas.Pen.Color:=fColor;
  Layers[csDRAWLAYER].Drawable.Canvas.Brush.Color:=fColor;
  Layers[csDRAWLAYER].Drawable.Canvas.Pen.Width:=FPenSize;
  Layers[csDRAWLAYER].Drawable.Canvas.FillRect(x,y,x+PenSize,y+PenSize);
end;

{ TSPPipette }

procedure TSPPipette.FinishDraw;
begin
  //inherited FinishDraw;
  frmDrawTools.Invalidate;
end;

procedure TSPPipette.MouseMove(x, y: Integer);
begin
  //inherited MouseMove(x, y);
  fX:=x;
  fY:=y;
end;

procedure TSPPipette.MouseUp(x, y: Integer; Shift: TShiftState);
begin
  if fMainColor then spclForeColor:=Layers[FrameGrid.ActiveLayer].Drawable.GetPixel(x,y)
     else spclBackColor:=Layers[FrameGrid.ActiveLayer].Drawable.GetPixel(x,y);
end;

procedure TSPPipette.StartDraw(x, y: Integer; Shift: TShiftState;
  aButton: TMouseButton; aColor: TBGRAPixel);
begin
  fMainColor:=aButton=mbLeft;
end;

{ TSPEraser }

procedure TSPEraser.StartDraw(x, y: Integer; Shift: TShiftState;
  aButton: TMouseButton; aColor: TBGRAPixel);
begin
  inherited StartDraw(x,y,Shift, aButton, BGRAPixelTransparent);
  //if FPenSize=1 then Layers[FrameGrid.ActiveLayer].Drawable.ErasePixel(x,y,0) else begin
     Layers[FrameGrid.ActiveLayer].Drawable.FillRect(x,y,x+PenSize,y+PenSize,BGRAPixelTransparent);
 // end;
end;

procedure TSPEraser.FinishDraw;
begin
  inherited FinishDraw;
end;

procedure TSPEraser.MouseMove(x, y: Integer);
begin
 // if FPenSize=1 then Layers[FrameGrid.ActiveLayer].Drawable.ErasePixel(x,y,0) else begin
     Layers[FrameGrid.ActiveLayer].Drawable.FillRect(x,y,x+PenSize,y+PenSize,BGRAPixelTransparent);
  //end;
end;

procedure TSPEraser.MouseUp(x, y: Integer; Shift: TShiftState);
begin
  //inherited MouseUp(x, y, Shift);
end;

{ TSPLine }

procedure TSPLine.StartDraw(x, y: Integer; Shift: TShiftState;
  aButton: TMouseButton; aColor: TBGRAPixel);
begin
  if (not LayerExists(FrameGrid.ActiveLayer)) or (not LayerExists(csDRAWLAYER)) then Exit;
  Color:=aColor;
  fstartx:=x;
  fstarty:=y;
  prevx:=x;
  prevy:=y;
  Layers[csDRAWLAYER].Drawable.Canvas.Pen.Color:=fColor;
  Layers[csDRAWLAYER].Drawable.Canvas.Brush.Color:=fColor;
  Layers[csDRAWLAYER].Drawable.Canvas.Pen.Width:=FPenSize;
  Layers[csDRAWLAYER].Drawable.Canvas.FillRect(x,y,x+PenSize-1,y+PenSize-1);
end;

procedure TSPLine.MouseMove(x, y: Integer);
begin
  ClearBitmap(Layers[csDRAWLAYER].Drawable);
  prevx:=x;
  prevy:=y;
  Layers[csDRAWLAYER].Drawable.Canvas.Pen.Color:=fColor;
  Layers[csDRAWLAYER].Drawable.Canvas.Brush.Color:=fColor;
  Layers[csDRAWLAYER].Drawable.Canvas.Pen.Width:=FPenSize;
  Layers[csDRAWLAYER].Drawable.Canvas.Line(fstartx,fstarty,PrevX+PenSize-1,PrevY+PenSize-1);
end;

{ TSPPen }

procedure TSPPen.StartDraw(x, y: Integer; Shift: TShiftState;
  aButton: TMouseButton; aColor: TBGRAPixel);
begin
  inherited StartDraw(x,y,Shift,aButton, aColor);
  if FPenSize=1 then Layers[csDRAWLAYER].Drawable.SetPixel(x,y,Color) else begin
     Layers[csDRAWLAYER].Drawable.FillRect(x,y,x+PenSize,y+PenSize,fColor);
  end;
end;

procedure TSPPen.MouseMove(x, y: Integer);
var b : TUniversalBrush;
begin
  //todo: how to change pen size?

  if FPenSize=1 then Layers[csDRAWLAYER].Drawable.DrawLine(prevx,prevy,x,y,fColor,True,dmSet)
   else begin
    Layers[csDRAWLAYER].Drawable.SolidBrush(b,fColor,dmSet);
    Layers[csDRAWLAYER].Drawable.DrawLineAntialias(prevx,prevy,x,y,b,FPenSize);

   end;
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

constructor TSPDrawTool.Create(aPenSize: Integer);
begin
  FPenSize:=aPenSize; //default 1px
end;

destructor TSPDrawTool.Destroy;
begin
  //FinishDraw;
  inherited Destroy;
end;

procedure TSPDrawTool.StartDraw(x, y: Integer; Shift: TShiftState;
  aButton: TMouseButton; aColor: TBGRAPixel);
begin
  fColor:=aColor;
  Layers[csDRAWLAYER].Drawable.Canvas.Pen.Color:=fColor;
  Layers[csDRAWLAYER].Drawable.Canvas.Pen.Width:=FPenSize;
  prevx := x;
  prevy := y;
end;

procedure TSPDrawTool.MouseMove(x, y: Integer);
begin
 Assert(False, rsYouMustOverr2+Self.ClassName);
end;

procedure TSPDrawTool.MouseUp(x, y: Integer; Shift: TShiftState);
begin
 if Self.ClassName='TSPDrawTool' then
 Assert(False, rsYouMustOverr+Self.ClassName);
   if not (ssCtrl in Shift) then FinishDraw;
end;

procedure TSPDrawTool.FinishDraw;
begin
  if (not Assigned(FrameGrid)) or (not LayerExists(FrameGrid.ActiveLayer)) then Exit;

  Layers[FrameGrid.ActiveLayer].Drawable.PutImage(0,0,Layers[csDRAWLAYER].Drawable,dmSetExceptTransparent);
  Layers[csDRAWLAYER].ClearDrawable;
end;


end.

