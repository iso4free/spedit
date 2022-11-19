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
      fstartx,fstarty : Integer;    //coords from start drawing
      fX,fY           : Integer;    //current coords
      prevx, prevy    : Integer;    //previous coords
      fLayerName      : String;     //temporary created layer name
      FPenSize        : Byte;
      FPrevPoint      : TPoint;
      procedure SetPenSize(AValue: Byte);
      procedure SetPrevPoint(AValue: TPoint);
    public
      constructor Create(Width : Integer = 32; Height : Integer = 32);
      destructor Destroy; override;
      procedure StartDraw(x,y : Integer; Shift: TShiftState; aColor : TBGRAPixel);virtual;
      procedure MouseMove(x,y : Integer); virtual;
      procedure MouseUp(x,y : Integer; Shift: TShiftState); virtual;
      procedure FinishDraw;virtual;
      property PrevPoint : TPoint read FPrevPoint write SetPrevPoint;
      property PenSize : Byte read FPenSize write SetPenSize;
      property Color : TBGRAPixel read fColor write SetColor;
  end;


  { TSPPen - simple pen tool}

  TSPPen = class(TSPDrawTool)
     procedure StartDraw(x, y: Integer;Shift: TShiftState; aColor : TBGRAPixel);override;
     procedure MouseMove(x,y : Integer); override;
     procedure MouseUp(x, y: Integer;Shift: TShiftState); override;
  end;


  { TSPLine - draw simple line}

  TSPLine = class(TSPDrawTool)
     procedure StartDraw(x, y: Integer; Shift : TShiftState; aColor : TBGRAPixel);override;
     procedure MouseMove(x,y : Integer); override;
  end;

  { TSPEraser }

  TSPEraser = class(TSPDrawTool)
     procedure StartDraw(x, y: Integer; Shift : TShiftState; aColor : TBGRAPixel);override;
     procedure MouseMove(x,y : Integer); override;
  end;

implementation

{ TSPEraser }

procedure TSPEraser.StartDraw(x, y: Integer; Shift: TShiftState;
  aColor: TBGRAPixel);
begin
  inherited StartDraw(x, y, Shift, aColor);

end;

procedure TSPEraser.MouseMove(x, y: Integer);
begin
  inherited MouseMove(x, y);
end;

{ TSPLine }

procedure TSPLine.StartDraw(x, y: Integer; Shift: TShiftState;
  aColor: TBGRAPixel);
begin
  Color:=aColor;
  fstartx:=x;
  fstarty:=y;
  prevx:=x;
  prevy:=y;

  Layers[FrameGrid.ActiveLayer].Drawable.Canvas.Pen.Color:=Color;
  if FPenSize=1 then Layers[fLayerName].Drawable.SetPixel(x,y,Color) else
     Layers[fLayerName].Drawable.Canvas.FillRect(x,y,x+PenSize,y+PenSize);
end;

procedure TSPLine.MouseMove(x, y: Integer);
//var oldPenMode : TPenMode;
begin
  //oldPenMode:=fBuffer.Canvas.Pen.Mode;
  Layers[FrameGrid.ActiveLayer].Drawable.EraseRect(Rect(0,0,FrameGrid.FrameWidth-1,FrameGrid.FrameHeight-1),255);
  Layers[FrameGrid.ActiveLayer].Drawable.Canvas.Line(fstartx,fstarty,PrevX,PrevY);
  //fBuffer.Canvas.Pen.Mode:=pmXor;
  //fBuffer.Canvas.Line(fstartx,fstarty,PrevX,PrevY);

  prevx:=x;
  prevy:=y;
 //  Layers[FrameGrid.ActiveLayer].Drawable.Canvas.Pen.Mode:=oldPenMode;
 // fBuffer.Canvas.Pen.Mode:=oldPenMode;
  Layers[fLayerName].Drawable.Canvas.Line(fstartx,fstarty,PrevX,PrevY);
end;

{ TSPPen }

procedure TSPPen.StartDraw(x, y: Integer; Shift: TShiftState; aColor: TBGRAPixel
  );
begin
  inherited StartDraw(x,y,Shift,aColor);
  if FPenSize=1 then Layers[fLayerName].Drawable.SetPixel(x,y,Color) else begin
     Layers[fLayerName].Drawable.Canvas.Brush.Color:=Color;
     Layers[fLayerName].Drawable.Canvas.FillRect(x,y,x+PenSize,y+PenSize);

  end;
end;

procedure TSPPen.MouseMove(x, y: Integer);
begin
  Layers[fLayerName].Drawable.Canvas.Pen.Color:=fColor;
  Layers[fLayerName].Drawable.Canvas.Pen.Width:=FPenSize;
  Layers[fLayerName].Drawable.Canvas.Line(prevx,prevy,x,y);
  prevx:=x;
  prevy:=y;
end;

procedure TSPPen.MouseUp(x, y: Integer; Shift: TShiftState);
begin
  inherited MouseUp(x, y,Shift);

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
  FPenSize:=1; //default 1px
  fLayerName:='Draw layer';
  Layers[fLayerName]:=TSPLayer.Create(fLayerName,FrameGrid.FrameWidth,FrameGrid.FrameHeight);
end;

destructor TSPDrawTool.Destroy;
begin
  FinishDraw;
  if Layers.IndexOf(fLayerName)<>-1 then begin
     Layers.Delete(Layers.IndexOf(fLayerName));
     Layers.Remove(fLayerName);
  end;
  inherited Destroy;
end;

procedure TSPDrawTool.StartDraw(x, y: Integer; Shift: TShiftState;
  aColor: TBGRAPixel);
begin
   fColor:=aColor;
  //create temporary layer
  Layers[fLayerName].Temporary:=True;
  Layers[fLayerName].AddToFrame(FrameGrid.ActiveFrame);
  Frames[FrameGrid.ActiveFrame].AddLayer(fLayerName);
  Layers[fLayerName].Drawable.Canvas.Pen.Color:=fColor;
  Layers[fLayerName].Drawable.Canvas.Pen.Width:=FPenSize;
  prevx := x;
  prevy := y;
end;

procedure TSPDrawTool.MouseMove(x, y: Integer);
begin
 Assert(False,'You must override MouseMove() method! Class name: '+Self.ClassName);
end;

procedure TSPDrawTool.MouseUp(x, y: Integer; Shift: TShiftState);
begin
 if Self.ClassName='TSPDrawTool' then
 Assert(False,'You must override MouseUp() method! Class name: '+Self.ClassName);
   if not (ssCtrl in Shift) then FinishDraw;
end;

procedure TSPDrawTool.FinishDraw;
begin
  Layers[FrameGrid.ActiveLayer].Drawable.PutImage(0,0,Layers[fLayerName].Drawable,dmSet);
  Layers[fLayerName].Drawable.EraseRect(0,0,FrameGrid.FrameWidth-1,FrameGrid.FrameHeight-1,0);
end;


end.

