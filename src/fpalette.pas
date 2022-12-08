unit fpalette;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Types,
  BGRABitmap, BCGameGrid, BGRABitmapTypes;

type

  { TFrPalette }

  TFrPalette = class(TFrame)
    PaletteGrid: TBCGameGrid;
    procedure PaletteGridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaletteGridRenderControl(Sender: TObject; Bitmap: TBGRABitmap;
      r: TRect; n, x, y: integer);
  private

  public

  end;

implementation
uses uglobals, udraw;
{$R *.lfm}

{ TFrPalette }

procedure TFrPalette.PaletteGridRenderControl(Sender: TObject;
  Bitmap: TBGRABitmap; r: TRect; n, x, y: integer);
var c : TBGRAPixel;
begin
  if (n>Palette.Count-1) then begin
   c:=BGRAPixelTransparent;
   end  else begin
     c := palette.Color[n];
   end;
  Bitmap.Rectangle(r,c,c,dmSet);
end;

procedure TFrPalette.PaletteGridMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var xx,yy,n : Integer;
begin
  xx:=x div PaletteGrid.BlockWidth+1;
  yy:=y div PaletteGrid.BlockHeight+1;
  n := xx-PaletteGrid.GridWidth+yy*PaletteGrid.GridWidth-1;
  if n>Palette.Count then Exit;
  Palette.SelectColor(n);
  case Button of
    mbLeft:begin
     spclForeColor:=Palette.SelectedColor;
     //todo: fix when refactored
     //FgColor.Invalidate;
    end;
    mbRight:begin
     spclBackColor:=Palette.SelectedColor;
     //todo: fix when refactored
     //BgColor.Invalidate;
    end;
  end;
  ToolOptions.Color:=Palette.SelectedColor;
end;

end.

