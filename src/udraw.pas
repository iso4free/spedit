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
      fBuffer : TBGRABitmap;
      FColor: TColor;
      FMouseDown: Boolean;
      FPrevPoint: TPoint;
      procedure SetColor(AValue: TColor);
      procedure SetMouseDown(AValue: Boolean);
      procedure SetPrevPoint(AValue: TPoint);
    public
      constructor Create(Width : Integer = 32; Height : Integer = 32);
      destructor Destroy; override;
      property MouseDown : Boolean read FMouseDown write SetMouseDown default False;
      property PrevPoint : TPoint read FPrevPoint write SetPrevPoint;
      property Color : TColor read FColor write SetColor;
  end;


implementation

{ TSPDrawTool }

procedure TSPDrawTool.SetMouseDown(AValue: Boolean);
begin
  if FMouseDown=AValue then Exit;
  FMouseDown:=AValue;
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
end;

destructor TSPDrawTool.Destroy;
begin
  FreeAndNil(fBuffer);
  inherited Destroy;
end;

end.

