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
unit udrawtools;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, BGRAGraphicControl, BCGameGrid, uglobals, udraw, Types, BGRABitmap, BGRABitmapTypes;

type

  { TfrmDrawTools }

  TfrmDrawTools = class(TForm)
    bbtnSwapColors: TBitBtn;
    BgColor: TBGRAGraphicControl;
    ColorDialog1: TColorDialog;
    DrawToolsFlowPanel: TFlowPanel;
    FgColor: TBGRAGraphicControl;
    ColorsFlowPanel: TFlowPanel;
    flpnlToolOptions: TFlowPanel;
    gbPalette: TGroupBox;
    PaletteGrid: TBCGameGrid;
    sbEracer: TSpeedButton;
    sbPen: TSpeedButton;
    sbPipette: TSpeedButton;
    ScrollBox5: TScrollBox;
    procedure bbtnSwapColorsClick(Sender: TObject);
    procedure BgColorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BgColorPaint(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure PaletteGridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaletteGridRenderControl(Sender: TObject; Bitmap: TBGRABitmap;
      r: TRect; n, x, y: integer);
  private
    FDrawTool: PSPDrawTool;
    procedure SetDrawTool(AValue: PSPDrawTool);
  public
    property DrawTool : PSPDrawTool read FDrawTool write SetDrawTool;
  end;

var
  frmDrawTools: TfrmDrawTools;

implementation
 uses umain;
 {$R *.frm}

 { TfrmDrawTools }

 procedure TfrmDrawTools.FormCreate(Sender: TObject);
 begin
  BgColor.ShowHint:=true;
  FgColor.ShowHint:=true;
  //TODO: create draw tools

 end;

procedure TfrmDrawTools.BgColorMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    case Button of
    mbLeft:  if ColorDialog1.Execute then begin
                if (Sender as TBGRAGraphicControl).Tag=1 then spclBackColor:=ColorDialog1.Color
                else spclForeColor:=ColorDialog1.Color;
                Palette.AddColor(ColorDialog1.Color);
                frmMain.StatusBar1.Panels[0].Text:='Colors: '+IntToStr(Palette.Count);
                PaletteGrid.RenderAndDrawControl;
              end;
    mbRight:if (Sender as TBGRAGraphicControl).Tag=1 then spclBackColor:=clNone
                else spclForeColor:=clNone;
  end;
  BgColorPaint(Sender);
end;

procedure TfrmDrawTools.bbtnSwapColorsClick(Sender: TObject);
var cl : TColor;
begin
   cl := spclBackColor;
   spclBackColor:=spclForeColor;
   spclForeColor:=cl;
   FgColor.Invalidate;
   BgColor.Invalidate;
end;

procedure TfrmDrawTools.BgColorPaint(Sender: TObject);
var cl : TColor;
begin
  if (Sender as TBGRAGraphicControl).Tag = 1 then cl := spclBackColor
    else cl:=spclForeColor;
  if cl=clNone then begin
   (Sender as TBGRAGraphicControl).Bitmap.DrawCheckers(Rect(2,2,(Sender as TBGRAGraphicControl).Width-2,(Sender as TBGRAGraphicControl).Height-2),
                                              ColorToBGRA($BFBFBF),ColorToBGRA($FFFFFF),4,4);
   (Sender as TBGRAGraphicControl).Bitmap.Rectangle(Rect(0,0,(Sender as TBGRAGraphicControl).Width,(Sender as TBGRAGraphicControl).Height),ColorToBGRA(clBlack));
  end
    else (Sender as TBGRAGraphicControl).Bitmap.FillRect(Rect(2,2,(Sender as TBGRAGraphicControl).Width-2,(Sender as TBGRAGraphicControl).Height-2),ColorToBGRA(cl));
  (Sender as TBGRAGraphicControl).Invalidate;
  frmMain.StatusBar1.Panels[1].Text:='FG: '+IntToHex(spclForeColor)+' / BG: '+IntToHex(spclBackColor);
end;

procedure TfrmDrawTools.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  frmMain.PaintToolPanelVisibleMenuItem.Checked:=False;
end;

procedure TfrmDrawTools.PaletteGridMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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
     FgColor.Invalidate;
    end;
    mbRight:begin
     spclBackColor:=Palette.SelectedColor;
     BgColor.Invalidate;
    end;
  end;
end;

procedure TfrmDrawTools.PaletteGridRenderControl(Sender: TObject;
  Bitmap: TBGRABitmap; r: TRect; n, x, y: integer);
var b, c : TBGRAPixel;
begin
  if (n=0) or (n>Palette.Count-1) then begin
   c:=clNone;
   b:=clNone;
   end  else begin
     c := ColorToBGRA(palette.Color[n]);
     b:=ColorToBGRA(clBlack);
   end;
  Bitmap.Rectangle(r,b,c,dmSet);
end;

procedure TfrmDrawTools.SetDrawTool(AValue: PSPDrawTool);
begin
  if FDrawTool=AValue then Exit;
  FDrawTool:=AValue;
end;

end.

