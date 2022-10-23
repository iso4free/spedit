//some drawing tools
unit udraw;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Graphics, uglobals, ustuff, BGRABitmap, BGRABitmapTypes;

type

  //basic drawing class

  { TSPDrawTool }

  PSPDrawTool = ^TSPDrawTool;
  TSPDrawTool = class
    protected
      FParameters: TSTaticDic;
      fstartx,starty : Integer;  //coords from start drawing
      fX,fY          : Integer;  //current coords
      fBuffer : TBGRABitmap;
      FMouseDown: Boolean;
      FPenSize: Byte;
      FPrevPoint: TPoint;
      procedure SetColor(AValue: TColor);
      procedure SetParameters(AValue: TSTaticDic);
      procedure SetPenSize(AValue: Byte);
      procedure SetPrevPoint(AValue: TPoint);
    public
      constructor Create(Width : Integer = 32; Height : Integer = 32);
      destructor Destroy; override;
      property PrevPoint : TPoint read FPrevPoint write SetPrevPoint;
      property PenSize : Byte read FPenSize write SetPenSize;
      procedure StartDraw(x,y : Integer);virtual;//abstract;
      procedure MouseMove(x,y : Integer);virtual;//abstract;
      procedure Render(aBMP : TBGRABitmap);
      property Parameters : TSTaticDic read FParameters write SetParameters;
  end;


  { TSPPen - simple pen tool}

  TSPPen = class(TSPDrawTool)
     prevx, prevy : Integer;
     procedure StartDraw(x, y: Integer; Color : TColor);//override;
     procedure MouseMove(x,y : Integer); override;
  end;


  TSPLine = class(TSPDrawTool)

  end;


implementation

{ TSPPen }

procedure TSPPen.StartDraw(x, y: Integer; Color: TColor);
begin
  fBuffer.Canvas.Pen.Color:=Color;
  prevx := x;
  prevy := y;
  fBuffer.Pixels[x,y]:=Color;
end;

procedure TSPPen.MouseMove(x, y: Integer);
begin
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

procedure TSPDrawTool.SetColor(AValue: TColor);
begin

end;

procedure TSPDrawTool.SetParameters(AValue: TSTaticDic);
begin
  if FParameters=AValue then Exit;
  FParameters:=AValue;
end;

procedure TSPDrawTool.SetPrevPoint(AValue: TPoint);
begin
  if FPrevPoint=AValue then Exit;
  FPrevPoint:=AValue;
end;

constructor TSPDrawTool.Create(Width: Integer; Height: Integer);
begin
  fBuffer:=TBGRABitmap.Create(Width,Height,ColorToBGRA(clNone));
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

procedure TSPDrawTool.Render(aBMP: TBGRABitmap);
begin
  fBuffer.Draw(aBMP.Canvas,0,0);
end;


end.

