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
unit fcolors;

{$mode ObjFPC}{$H+}

interface

uses
  {$IFDEF DEBUG}LazLoggerBase,{$ENDIF}
  Classes, SysUtils, Forms, Controls, ExtCtrls, Buttons, Dialogs,
  BGRAGraphicControl, BCGameGrid, udraw, BGRABitmap, BGRABitmapTypes;

type

  { TfrColors }

  TfrColors = class(TFrame)
    bbtnSwapColors: TBitBtn;
    BgColor: TBGRAGraphicControl;
    ColorDialog1: TColorDialog;
    ColorsFlowPanel: TFlowPanel;
    FgColor: TBGRAGraphicControl;
    procedure bbtnSwapColorsClick(Sender: TObject);
    procedure FgColorPaint(Sender: TObject);
    procedure FrameMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private

  public

  end;

implementation
  uses uglobals, umain;
{$R *.lfm}

{ TfrColors }

procedure TfrColors.FgColorPaint(Sender: TObject);
var cl : TBGRAPixel;
begin
  if (Sender as TBGRAGraphicControl).Tag = 1 then cl := spclBackColor
    else cl:=spclForeColor;
  if cl=BGRAPixelTransparent then begin
   (Sender as TBGRAGraphicControl).Bitmap.DrawCheckers(Rect(2,2,(Sender as TBGRAGraphicControl).Width-2,(Sender as TBGRAGraphicControl).Height-2),
                                              ColorToBGRA($BFBFBF),ColorToBGRA($FFFFFF),4,4);
   (Sender as TBGRAGraphicControl).Bitmap.Rectangle(Rect(2,2,(Sender as TBGRAGraphicControl).Width-2,(Sender as TBGRAGraphicControl).Height-2),ColorToBGRA(clBlackOpaque));
  end
    else (Sender as TBGRAGraphicControl).Bitmap.FillRect(Rect(2,2,(Sender as TBGRAGraphicControl).Width-2,(Sender as TBGRAGraphicControl).Height-2),ColorToBGRA(cl));
  frmMain.StatusBar1.Panels[1].Text:=rsFG+IntToHex(spclForeColor)+rsBG+
    IntToHex(spclBackColor);
  Invalidate;
end;

procedure TfrColors.bbtnSwapColorsClick(Sender: TObject);
var cl : TBGRAPixel;
begin
   cl := spclBackColor;
   spclBackColor:=spclForeColor;
   spclForeColor:=cl;
end;

procedure TfrColors.FrameMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case Button of
  mbLeft: begin
           frmMain.HideWindows;
           if ColorDialog1.Execute then begin
              if (Sender as TBGRAGraphicControl).Tag=1 then spclBackColor:=ColorDialog1.Color
              else spclForeColor:=ColorDialog1.Color;
              Palette.AddColor(ColorDialog1.Color);
              ToolOptions.Color:=ColorDialog1.Color;
              frmMain.StatusBar1.Panels[0].Text:=rsColors+IntToStr(Palette.Count);
              //PaletteGrid.RenderAndDrawControl;
           end;
           frmMain.ShowWindows;
          end;
  mbRight:begin
           if (Sender as TBGRAGraphicControl).Tag=1 then spclBackColor:=BGRAPixelTransparent
              else spclForeColor:=BGRAPixelTransparent;
             ToolOptions.Color:=BGRAPixelTransparent;

  end;
end;

 FgColorPaint(Sender);
//frmMain.SetFocus;
end;

end.

