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

  TDrawOptions = record
    PenSize : Byte; //pen width
    Color   : TBGRAPixel;
  end;

  { TSPDrawTool }

 // PSPDrawTool = ^TSPDrawTool;
  TSPDrawTool = class
  private
    FToolName: String;
    protected
      fstartx,fstarty : Integer;    //coords from start drawing
      fX,fY           : Integer;    //current coords
      prevx, prevy    : Integer;    //previous coords
      FPrevPoint      : TPoint;
      procedure SetPrevPoint(AValue: TPoint);
    public
      constructor Create;
      destructor Destroy; override;
      procedure StartDraw(x,y : Integer; Shift: TShiftState; aButton : TMouseButton; aColor : TBGRAPixel);virtual;
      procedure MouseMove(x,y : Integer); virtual;
      procedure MouseUp(x,y : Integer; Shift: TShiftState); virtual;
      procedure FinishDraw;virtual;
      property PrevPoint : TPoint read FPrevPoint write SetPrevPoint;
      property ToolName : String read FToolName;
  end;


  { TSPPen - simple pen tool}

  TSPPen = class(TSPDrawTool)
     constructor Create;
     procedure StartDraw(x, y: Integer;Shift: TShiftState;aButton: TMouseButton; aColor : TBGRAPixel);override;
     procedure MouseMove(x,y : Integer); override;
  end;


  { TSPLine - draw simple line}

  TSPLine = class(TSPDrawTool)
    constructor Create;
     procedure StartDraw(x,y : Integer; Shift: TShiftState; aButton : TMouseButton; aColor : TBGRAPixel);override;
     procedure MouseMove(x,y : Integer); override;
  end;

  { TSPRect }

  TSPRect = class(TSPDrawTool)
     constructor Create;
     procedure StartDraw(x,y : Integer; Shift: TShiftState; aButton : TMouseButton; aColor : TBGRAPixel);override;
     procedure MouseMove(x,y : Integer); override;
  end;

  { TSPFilledRect }

  TSPFilledRect = class(TSPDrawTool)
     constructor Create;
     procedure StartDraw(x,y : Integer; Shift: TShiftState; aButton : TMouseButton; aColor : TBGRAPixel);override;
     procedure MouseMove(x,y : Integer); override;
  end;

  { TSPCircle }

  TSPCircle = class(TSPDrawTool)
   constructor Create;
   procedure StartDraw(x,y : Integer; Shift: TShiftState; aButton : TMouseButton; aColor : TBGRAPixel);override;
   procedure MouseMove(x,y : Integer); override;
  end;

  { TSPEraser }

  TSPEraser = class(TSPDrawTool)
     constructor Create;
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
     constructor Create;
     procedure StartDraw(x,y : Integer; Shift: TShiftState; aButton : TMouseButton; aColor : TBGRAPixel);override;
     procedure MouseMove(x,y : Integer); override;
     procedure MouseUp(x,y : Integer; Shift: TShiftState);override;
     procedure FinishDraw; override;
  end;

  { TSPFloodFill }

  TSPFloodFill = class (TSPDrawTool)
   fColor : TBGRAPixel;
   constructor Create;
    procedure StartDraw(x,y : Integer; Shift: TShiftState; aButton : TMouseButton; aColor : TBGRAPixel);override;
    procedure MouseMove(x,y : Integer); override;
    procedure MouseUp(x,y : Integer; Shift: TShiftState);override;
    procedure FinishDraw; override;
  end;

  var
        DrawTool : TSPDrawTool;
        ToolOptions : TDrawOptions;

implementation

{ TSPFloodFill }

constructor TSPFloodFill.Create;
begin
  FToolName:=rsFloodFill;
  ToolOptions.PenSize:=1;
end;

procedure TSPFloodFill.FinishDraw;
begin
  //inherited FinishDraw;
end;

procedure TSPFloodFill.MouseMove(x, y: Integer);
begin
  //  inherited MouseMove(x, y);
  fx:=x;
  fy:=y;
end;

procedure TSPFloodFill.MouseUp(x, y: Integer; Shift: TShiftState);
var
  aTmpColor: TBGRAPixel;
begin
  //inherited MouseUp(x, y, Shift);
  fx:=x;
  fy:=y;
  aTmpColor := Layers[FrameGrid.ActiveLayer].Drawable.GetPixel(x,y);
  Layers[FrameGrid.ActiveLayer].Drawable.FloodFill(fx,fy,fColor,fmSet,0);
end;

procedure TSPFloodFill.StartDraw(x, y: Integer; Shift: TShiftState;
  aButton: TMouseButton; aColor: TBGRAPixel);
begin
  inherited StartDraw(x, y, Shift, aButton, aColor);
  fColor:=aColor;
end;

{ TSPCircle }

constructor TSPCircle.Create;
begin
  FToolName:=rsCircle;
end;

procedure TSPCircle.MouseMove(x, y: Integer);
  var
  i: Integer;
begin
  ClearBitmap(Layers[csDRAWLAYER].Drawable);
  prevx:=x+1;
  prevy:=y+1;
  Layers[csDRAWLAYER].Drawable.Canvas.Pen.Color:=ToolOptions.Color;
  Layers[csDRAWLAYER].Drawable.Canvas.Pen.Width:=ToolOptions.PenSize;
  if ToolOptions.PenSize>1 then
     for i:=0 to ToolOptions.PenSize-1 do Layers[csDRAWLAYER].Drawable.EllipseInRect(Rect(fstartx+i,fstarty+i,prevx-i,prevy-i),
                                                              ToolOptions.Color,BGRAPixelTransparent)
  else
     Layers[csDRAWLAYER].Drawable.EllipseInRect(Rect(fstartx,fstarty,prevx,prevy),
                                                ToolOptions.Color,BGRAPixelTransparent);
end;

procedure TSPCircle.StartDraw(x, y: Integer; Shift: TShiftState;
  aButton: TMouseButton; aColor: TBGRAPixel);
begin
  inherited StartDraw(x,y,Shift,aButton, aColor);
  Layers[csDRAWLAYER].Drawable.Canvas.Ellipse(x,y,x+ToolOptions.PenSize,y+ToolOptions.PenSize);
end;

{ TSPFilledRect }

constructor TSPFilledRect.Create;
begin
  FToolName:=rsFilledRectan;
end;

procedure TSPFilledRect.MouseMove(x, y: Integer);
begin
  ClearBitmap(Layers[csDRAWLAYER].Drawable);
  prevx:=x+1;
  prevy:=y+1;
  Layers[csDRAWLAYER].Drawable.Canvas.Pen.Color:=ToolOptions.Color;
  Layers[csDRAWLAYER].Drawable.Canvas.Brush.Color:=ToolOptions.Color;
  Layers[csDRAWLAYER].Drawable.Canvas.Pen.Width:=ToolOptions.PenSize;
  Layers[csDRAWLAYER].Drawable.Canvas.FillRect(fstartx,fstarty,x,y);
end;

procedure TSPFilledRect.StartDraw(x, y: Integer; Shift: TShiftState;
  aButton: TMouseButton; aColor: TBGRAPixel);
begin
 inherited StartDraw(x,y,Shift,aButton, aColor);
  Layers[csDRAWLAYER].Drawable.Canvas.FillRect(x,y,x+ToolOptions.PenSize,y+ToolOptions.PenSize);
end;

{ TSPRect }

constructor TSPRect.Create;
begin
  FToolName:=rsRectangle;
end;

procedure TSPRect.MouseMove(x, y: Integer);
var
  i: Integer;
begin
  ClearBitmap(Layers[csDRAWLAYER].Drawable);
  prevx:=x+1;
  prevy:=y+1;
  Layers[csDRAWLAYER].Drawable.Canvas.Pen.Color:=ToolOptions.Color;
  Layers[csDRAWLAYER].Drawable.Canvas.Pen.Width:=ToolOptions.PenSize;
  //Layers[csDRAWLAYER].Drawable.Canvas.Rectangle(fstartx,fstarty,PrevX+PenSize,PrevY+PenSize);
  if ToolOptions.PenSize>1 then
     for i:=0 to ToolOptions.PenSize-1 do Layers[csDRAWLAYER].Drawable.Rectangle(fstartx+i,fstarty+i,prevx-i,prevy-i,ToolOptions.Color,BGRAPixelTransparent)
    // Layers[csDRAWLAYER].Drawable.FillRect(fstartx+1,fstarty+1,prevx,prevy,BGRAPixelTransparent)
  else
     Layers[csDRAWLAYER].Drawable.Rectangle(fstartx,fstarty,prevx,prevy,ToolOptions.Color,BGRAPixelTransparent);
end;

procedure TSPRect.StartDraw(x, y: Integer; Shift: TShiftState;
  aButton: TMouseButton; aColor: TBGRAPixel);
begin
  inherited StartDraw(x,y,Shift,aButton, aColor);
  Layers[csDRAWLAYER].Drawable.Canvas.FillRect(x,y,x+ToolOptions.PenSize,y+ToolOptions.PenSize);
end;

{ TSPPipette }

constructor TSPPipette.Create;
begin
  FToolName:=rsPipette;
  ToolOptions.PenSize:=1;
end;

procedure TSPPipette.FinishDraw;
begin
  //inherited FinishDraw;
end;

procedure TSPPipette.MouseMove(x, y: Integer);
begin
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
     Layers[FrameGrid.ActiveLayer].Drawable.FillRect(x,y,x+ToolOptions.PenSize,y+ToolOptions.PenSize,BGRAPixelTransparent);
end;

constructor TSPEraser.Create;
begin
  FToolName:=rsEraser;
end;

procedure TSPEraser.FinishDraw;
begin
  inherited FinishDraw;
end;

procedure TSPEraser.MouseMove(x, y: Integer);
begin
     Layers[FrameGrid.ActiveLayer].Drawable.FillRect(x,y,x+ToolOptions.PenSize,y+ToolOptions.PenSize,BGRAPixelTransparent);
end;

procedure TSPEraser.MouseUp(x, y: Integer; Shift: TShiftState);
begin
  //inherited MouseUp(x, y, Shift);
end;

{ TSPLine }

procedure TSPLine.StartDraw(x, y: Integer; Shift: TShiftState;
  aButton: TMouseButton; aColor: TBGRAPixel);
begin
  inherited StartDraw(x,y,Shift,aButton, aColor);
  Layers[csDRAWLAYER].Drawable.Canvas.FillRect(x,y,x+ToolOptions.PenSize-1,y+ToolOptions.PenSize-1);
end;

constructor TSPLine.Create;
begin
  FToolName:=rsLine;
end;

procedure TSPLine.MouseMove(x, y: Integer);
begin
  ClearBitmap(Layers[csDRAWLAYER].Drawable);
  prevx:=x;
  prevy:=y;
  Layers[csDRAWLAYER].Drawable.Canvas.Pen.Color:=ToolOptions.Color;
  Layers[csDRAWLAYER].Drawable.Canvas.Brush.Color:=ToolOptions.Color;
  Layers[csDRAWLAYER].Drawable.Canvas.Pen.Width:=ToolOptions.PenSize;
  Layers[csDRAWLAYER].Drawable.Canvas.Line(fstartx,fstarty,PrevX+ToolOptions.PenSize-1,PrevY+ToolOptions.PenSize-1);
end;

{ TSPPen }

procedure TSPPen.StartDraw(x, y: Integer; Shift: TShiftState;
  aButton: TMouseButton; aColor: TBGRAPixel);
begin
  inherited StartDraw(x,y,Shift,aButton, aColor);
  if ToolOptions.PenSize=1 then Layers[csDRAWLAYER].Drawable.SetPixel(x,y,ToolOptions.Color) else begin
     Layers[csDRAWLAYER].Drawable.FillRect(x,y,x+ToolOptions.PenSize,y+ToolOptions.PenSize,ToolOptions.Color);
  end;
end;

constructor TSPPen.Create;
begin
  FToolName:=rsPen;
end;

procedure TSPPen.MouseMove(x, y: Integer);
var b : TUniversalBrush;
begin
  if ToolOptions.PenSize=1 then Layers[csDRAWLAYER].Drawable.DrawLine(prevx,prevy,x,y,ToolOptions.Color,True,dmSet)
   else begin
    Layers[csDRAWLAYER].Drawable.SolidBrush(b,ToolOptions.Color,dmSet);
    Layers[csDRAWLAYER].Drawable.DrawLineAntialias(prevx,prevy,x,y,b,ToolOptions.PenSize);

   end;
  prevx:=x;
  prevy:=y;
end;

{ TSPDrawTool }

procedure TSPDrawTool.SetPrevPoint(AValue: TPoint);
begin
  if FPrevPoint=AValue then Exit;
  FPrevPoint:=AValue;
end;

constructor TSPDrawTool.Create;
begin
  FToolName:=rsGenericTool;
end;

destructor TSPDrawTool.Destroy;
begin
  //FinishDraw;
  inherited Destroy;
end;

procedure TSPDrawTool.StartDraw(x, y: Integer; Shift: TShiftState;
  aButton: TMouseButton; aColor: TBGRAPixel);
begin
  if (not LayerExists(FrameGrid.ActiveLayer)) or (not LayerExists(csDRAWLAYER)) then Exit;
  UndoRedoManager.SaveState;
  ToolOptions.Color:=aColor;
  Layers[csDRAWLAYER].Drawable.Canvas.Pen.Color:=ToolOptions.Color;
  Layers[csDRAWLAYER].Drawable.Canvas.Brush.Color:=ToolOptions.Color;
  Layers[csDRAWLAYER].Drawable.Canvas.Pen.Width:=ToolOptions.PenSize;
  fstartx:=x;
  fstarty:=y;
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

