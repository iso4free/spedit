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
  {$IFDEF DEBUG}LazLoggerBase,{$ENDIF} LResources,
  Classes, SysUtils, Graphics, uglobals, BGRABitmap, BGRABitmapTypes, LCLTranslator;

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
      fBuffer         : TBGRABitmap;
      FPenSize        : Byte;
      FPrevPoint      : TPoint;
      procedure SetPenSize(AValue: Byte);
      procedure SetPrevPoint(AValue: TPoint);
    public
      constructor Create(Width : Integer = 32; Height : Integer = 32);
      destructor Destroy; override;
      procedure StartDraw(x,y : Integer; aColor : TBGRAPixel);virtual;
      procedure MouseMove(x,y : Integer); virtual;
      procedure MouseUp(x,y : Integer); virtual;
      procedure FinishDraw;virtual;
      property PrevPoint : TPoint read FPrevPoint write SetPrevPoint;
      property PenSize : Byte read FPenSize write SetPenSize;
      property Color : TBGRAPixel read fColor write SetColor;
  end;


  { TSPPen - simple pen tool}

  TSPPen = class(TSPDrawTool)
     procedure StartDraw(x, y: Integer; aColor : TBGRAPixel);override;
     procedure MouseMove(x,y : Integer); override;
     procedure MouseUp(x, y: Integer); override;
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
//var oldPenMode : TPenMode;
begin
  //oldPenMode:=fBuffer.Canvas.Pen.Mode;
  Layers[FrameGrid.ActiveLayer].Drawable.EraseRect(fBuffer.ClipRect,255);
  Layers[FrameGrid.ActiveLayer].Drawable.Canvas.Line(fstartx,fstarty,PrevX,PrevY);
  //fBuffer.Canvas.Pen.Mode:=pmXor;
  //fBuffer.Canvas.Line(fstartx,fstarty,PrevX,PrevY);

  prevx:=x;
  prevy:=y;
 //  Layers[FrameGrid.ActiveLayer].Drawable.Canvas.Pen.Mode:=oldPenMode;
 // fBuffer.Canvas.Pen.Mode:=oldPenMode;
  fBuffer.Canvas.Line(fstartx,fstarty,PrevX,PrevY);
end;

{ TSPPen }

procedure TSPPen.StartDraw(x, y: Integer; aColor: TBGRAPixel);
begin
  inherited StartDraw(x,y,aColor);
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

procedure TSPPen.MouseUp(x, y: Integer);
begin
  //inherited MouseUp(x, y);
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
  FinishDraw;
  if Layers.IndexOf(fLayerName)<>-1 then begin
   // Layers[fLayerName].Free;
   // Layers[fLayerName] := nil;
    Layers.Remove(fLayerName);
  end;
  FreeAndNil(fBuffer);
  inherited Destroy;
end;

procedure TSPDrawTool.StartDraw(x, y: Integer; aColor: TBGRAPixel);
begin
   fColor:=aColor;
  //create temporary layer
  fLayerName:='Pen layer';
  Layers[fLayerName]:=TSPLayer.Create(fLayerName,FrameGrid.FrameWidth,FrameGrid.FrameHeight);
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

procedure TSPDrawTool.MouseUp(x, y: Integer);
begin
 Assert(False,'You must override MouseUp() method! Class name: '+Self.ClassName);
end;

procedure TSPDrawTool.FinishDraw;
begin
  Layers[FrameGrid.ActiveLayer].Drawable.PutImage(0,0,Layers[fLayerName].Drawable,dmDrawWithTransparency);
  //Frames[FrameGrid.ActiveFrame].DeleteLayer(fLayerName);
  //Layers[fLayerName].DeleteFromFrame(FrameGrid.ActiveFrame);
  //todo: fix draw to active layer and clear tool layer
  //Layers[fLayerName].Drawable:=fBuffer;
end;


end.

