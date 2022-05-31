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
      FBrush: TBrush;
      fBuffer : TBGRABitmap;
      FMouseDown: Boolean;
      FPen: TPen;
      FPrevPoint: TPoint;
      procedure SetBrush(AValue: TBrush);
      procedure SetMouseDown(AValue: Boolean);
      procedure SetPen(AValue: TPen);
      procedure SetPrevPoint(AValue: TPoint);
    public
      constructor Create(Width : Integer = 32; Height : Integer = 32);
      destructor Destroy; override;
      property MouseDown : Boolean read FMouseDown write SetMouseDown default False;
      property Pen : TPen read FPen write SetPen;
      property Brush : TBrush read FBrush write SetBrush;
      property PrevPoint : TPoint read FPrevPoint write SetPrevPoint;

  end;


implementation

{ TSPDrawTool }

procedure TSPDrawTool.SetMouseDown(AValue: Boolean);
begin
  if FMouseDown=AValue then Exit;
  FMouseDown:=AValue;
end;

procedure TSPDrawTool.SetBrush(AValue: TBrush);
begin
  if FBrush=AValue then Exit;
  FBrush:=AValue;
end;

procedure TSPDrawTool.SetPen(AValue: TPen);
begin
  if FPen=AValue then Exit;
  FPen:=AValue;
end;

procedure TSPDrawTool.SetPrevPoint(AValue: TPoint);
begin
  if FPrevPoint=AValue then Exit;
  FPrevPoint:=AValue;
end;

constructor TSPDrawTool.Create(Width: Integer; Height: Integer);
begin
  FPen := TPen.Create;
  FBrush := TBrush.Create;
  fBuffer:=TBGRABitmap.Create(Width,Height,ColorToBGRA(clNone));
end;

destructor TSPDrawTool.Destroy;
begin
  FreeAndNil(FBrush);
  FreeAndNil(FPen);
  FreeAndNil(fBuffer);
  inherited Destroy;
end;

end.

