//some drawing tools
unit udraw;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Graphics, uglobals, BGRABitmap, BGRABitmapTypes;

type

  //basic drawing class

  { TSPDrawTool }

  TSPDrawTool = class
    private
      fstartx,starty : Integer;  //coords from start drawing
      fX,fY          : Integer;  //current coords
      fBuffer : TBGRABitmap;
      FColor: TColor;
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
      property Color : TColor read FColor write SetColor;
      property PenSize : Byte read FPenSize write SetPenSize;
      procedure StartDraw(x,y : Integer);virtual;abstract;
      procedure EndDraw(x,y : Integer);virtual;abstract;
      procedure Render(aBMP : TBGRABitmap);

  end;


  { TSPPen - simple pen tool}

  TSPPen = class(TSPDrawTool)
     procedure StartDraw(x, y: Integer); override;
  end;


  TSPLine = class(TSPDrawTool)

  end;


implementation

{ TSPPen }

procedure TSPPen.StartDraw(x, y: Integer);
begin

end;

{ TSPDrawTool }

procedure TSPDrawTool.SetPenSize(AValue: Byte);
begin
  if FPenSize=AValue then Exit;
  if (AValue>1) and (AValue<4) then FPenSize:=AValue;
end;

procedure TSPDrawTool.SetColor(AValue: TColor);
begin
  if FColor=AValue then Exit;
  FColor:=AValue;
end;

procedure TSPDrawTool.SetPrevPoint(AValue: TPoint);
begin
  if FPrevPoint=AValue then Exit;
  FPrevPoint:=AValue;
end;

constructor TSPDrawTool.Create(Width: Integer; Height: Integer);
begin
  fBuffer:=TBGRABitmap.Create(Width,Height,ColorToBGRA(clNone));
  FColor:=clNone;
  FPenSize:=1; //default 1px
end;

destructor TSPDrawTool.Destroy;
begin
  FreeAndNil(fBuffer);
  inherited Destroy;
end;

procedure TSPDrawTool.Render(aBMP: TBGRABitmap);
begin
  fBuffer.Draw(aBMP.Canvas,0,0);
end;


end.

