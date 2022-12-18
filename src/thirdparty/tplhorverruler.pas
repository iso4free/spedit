{*************************************************************************
                Copyright (c) PilotLogic Software House

  Package pl_ExControls
  This file is part of CodeTyphon Studio (https://www.pilotlogic.com/)

 ***** BEGIN LICENSE BLOCK *****
 * Version: LGPL-2.1 with link exception (Modified LGPL)
 *
 * The contents of this file are subject to the
 * GNU LIBRARY GENERAL PUBLIC LICENSE Version 2.1 (the "License")
 * with the following modification:
 *
 * As a special exception, the copyright holders of this library give you
 * permission to link this library with independent modules to produce an
 * executable, regardless of the license terms of these independent modules,
 * and to copy and distribute the resulting executable under terms of your choice,
 * provided that you also meet, for each linked independent module, the terms
 * and conditions of the license of that module. An independent module is a
 * module which is not derived from or based on this library. If you modify this
 * library, you may extend this exception to your version of the library, but
 * you are not obligated to do so. If you do not wish to do so, delete this
 * exception statement from your version.
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * ***** END LICENSE BLOCK *****

***************************************************************************}

unit TplHorVerRulersUnit;

interface

{$mode objfpc}{$H+}

uses
  LCLIntf, LCLType, LMessages,
  SysUtils, Classes, Controls, Graphics, Forms;

type
  TCSSMeasureUnit = (muCentimeters, muMilimeters, muInches, muPixels, muPoints, muPicas);
  THorRulerPosition = (rpTop, rpBottom);
  TVerRulerPosition = (rpLeft, rpRight);

  TPaintLabelEvent = procedure(LabelFont: TFont; var LabelText: string) of object;

  TplHorizontalRuler = class(TCustomControl)
  private
    FSOffset, FEOffset, FVOffset: integer;
    FUnits: TCSSMeasureUnit;
    FWholeSkip, FHalfSkip, FQuartSkip, FOneUnit: Extended;
    R: TRect;
    FieldLength: integer;
    FStartAt, FSkipUnits: Extended;
    mx: integer;
    FPos: THorRulerPosition;
    FMLeft, FMRight: integer;
    FScale: integer;
    FOuterCl, FInnerCl, FLineCl, FMarkCl: TColor;
    FOnPaint: TNotifyEvent;
    FCustomDPI: integer;
    FOnPaintLabel: TPaintLabelEvent;
    FShowFirst, FShowLast: boolean;
    FAddaptRectLeft, FAddaptRectRight: boolean;

    function GetMaxWidth: integer;
    procedure SetShowFirst(Value: boolean);
    procedure SetShowLast(Value: boolean);
    procedure SetAddaptRectLeft(Value: boolean);
    procedure SetAddaptRectRight(Value: boolean);
    procedure SetCustomDPI(Value: integer);
    procedure SetOuterCl(c: TColor);
    procedure SetInnerCl(c: TColor);
    procedure SetLineCl(c: TColor);
    procedure SetMarkCl(c: TColor);
    procedure SetScale(s: integer);
    procedure SetPos(p: THorRulerPosition);
    procedure SetSkipUnits(s: Extended);
    procedure SetStartAt(s: Extended);
    procedure SetUnit(u: TCSSMeasureUnit);
    procedure SetSOffset(o: integer);
    procedure SetEOffset(o: integer);
    procedure SetVOffset(o: integer);
  protected
    procedure Paint; override;
    procedure DrawWholeLines;
    procedure DrawHalfLines;
    procedure DrawQuarterLines;
  public
    constructor Create(AOwner: TComponent); override;
    procedure UpdateDisplay(x: integer);
    procedure MarkFragment(ALeft, ARight: integer);
    function GetPosition(x: integer): Extended;

    property MarkLeft: integer read FMLeft;
    property MarkRight: integer read FMRight;
    property Canvas;
  published
    property OffsetLeft: integer read FSOffset write SetSOffset default 23;
    property OffsetRight: integer read FEOffset write SetEOffset default 23;
    property VerticalOffset: integer read FVOffset write SetVOffset default 5;
    property Units: TCSSMeasureUnit read FUnits write SetUnit default muPixels;
    property StartAt: Extended read FStartAt write SetStartAt;
    property SkipUnits: Extended read FSkipUnits write SetSkipUnits;
    property RulerPosition: THorRulerPosition read FPos write SetPos default rpTop;
    property ZoomPercent: integer read FScale write SetScale default 100;
    property OuterColor: TColor read FOuterCl write SetOuterCl default clBtnFace;
    property InnerColor: TColor read FInnerCl write SetInnerCl default clWindow;
    property LineColor: TColor read FLineCl write SetLineCl default clBtnShadow;
    property MarkedColor: TColor read FMarkCl write SetMarkCl default clHighlight;
    property CustomDPI: integer read FCustomDPI write SetCustomDPI default 0;
    property ShowFirst: boolean read FShowFirst write SetShowFirst default False;
    property ShowLast: boolean read FShowLast write SetShowLast default False;
    property AddaptRectLeft: boolean read FAddaptRectLeft write SetAddaptRectLeft default False;
    property AddaptRectRight: boolean read FAddaptRectRight write SetAddaptRectRight default False;
    property Align;
    property Anchors;
    property Enabled;
    property Constraints;
    property Hint;
    property Font;
    property ShowHint;
    property ParentShowHint;
    property PopupMenu;
    property Visible;

    property OnContextPopup;
    property OnMouseMove;
    property OnMouseDown;
    property OnMouseUp;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
    property OnPaintLabelText: TPaintLabelEvent read FOnPaintLabel write FOnPaintLabel;
  end;

  TplVerticalRuler = class(TCustomControl)
  private
    FSOffset, FEOffset, FHOffset: integer;
    FUnits: TCSSMeasureUnit;
    FWholeSkip, FHalfSkip, FQuartSkip, FOneUnit: Extended;
    R: TRect;
    FieldLength: integer;
    FStartAt, FSkipUnits: Extended;
    my: integer;
    FPos: TVerRulerPosition;
    FMTop, FMBottom: integer;
    FScale: integer;
    FOuterCl, FInnerCl, FMarkCl, FLineCl: TColor;
    FOnPaint: TNotifyEvent;
    FCustomDPI: integer;
    FOnPaintLabel: TPaintLabelEvent;
    FShowFirst, FShowLast: boolean;
    FAddaptRectLeft, FAddaptRectRight: boolean;

    function GetMaxWidth: integer;
    procedure SetShowFirst(Value: boolean);
    procedure SetShowLast(Value: boolean);
    procedure SetAddaptRectLeft(Value: boolean);
    procedure SetAddaptRectRight(Value: boolean);
    procedure SetCustomDPI(Value: integer);
    procedure SetScale(s: integer);
    procedure SetPos(p: TVerRulerPosition);
    procedure SetSkipUnits(s: Extended);
    procedure SetStartAt(s: Extended);
    procedure SetUnit(u: TCSSMeasureUnit);
    procedure SetSOffset(o: integer);
    procedure SetEOffset(o: integer);
    procedure SetHOffset(o: integer);
    procedure SetOuterCl(c: TColor);
    procedure SetInnerCl(c: TColor);
    procedure SetLineCl(c: TColor);
    procedure SetMarkCl(c: TColor);
  protected
    procedure Paint; override;
    procedure DrawWholeLines;
    procedure DrawHalfLines;
    procedure DrawQuarterLines;
  public
    constructor Create(AOwner: TComponent); override;
    procedure UpdateDisplay(y: integer);
    procedure MarkFragment(ATop, ABottom: integer);
    function GetPosition(y: integer): Extended;

    property MarkTop: integer read FMTop;
    property MarkBottom: integer read FMBottom;
    property Canvas;
  published
    property OffsetTop: integer read FSOffset write SetSOffset default 0;
    property OffsetBottom: integer read FEOffset write SetEOffset default 23;
    property HorizontalOffset: integer read FHOffset write SetHOffset default 5;
    property Units: TCSSMeasureUnit read FUnits write SetUnit default muPixels;
    property StartAt: Extended read FStartAt write SetStartAt;
    property SkipUnits: Extended read FSkipUnits write SetSkipUnits;
    property RulerPosition: TVerRulerPosition read FPos write SetPos default rpLeft;
    property ZoomPercent: integer read FScale write SetScale default 100;
    property OuterColor: TColor read FOuterCl write SetOuterCl default clBtnFace;
    property InnerColor: TColor read FInnerCl write SetInnerCl default clWindow;
    property LineColor: TColor read FLineCl write SetLineCl default clBtnShadow;
    property MarkedColor: TColor read FMarkCl write SetMarkCl default clHighlight;
    property CustomDPI: integer read FCustomDPI write SetCustomDPI default 0;
    property ShowFirst: boolean read FShowFirst write SetShowFirst default False;
    property ShowLast: boolean read FShowLast write SetShowLast default False;
    property AddaptRectLeft: boolean read FAddaptRectLeft write SetAddaptRectLeft default False;
    property AddaptRectRight: boolean read FAddaptRectRight write SetAddaptRectRight default False;
    property Align;
    property Anchors;
    property Enabled;
    property Constraints;
    property Hint;
    property Font;
    property ShowHint;
    property ParentShowHint;
    property PopupMenu;
    property Visible;

    property OnContextPopup;
    property OnMouseMove;
    property OnMouseDown;
    property OnMouseUp;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
    property OnPaintLabelText: TPaintLabelEvent read FOnPaintLabel write FOnPaintLabel;
  end;


implementation


procedure DrawRotatedText(aCanvas: TCanvas; R: TRect; const Angle: integer; const aText: string);
var
  lf: TLogFont;
  tf: TFont;
  ts: TTextStyle;
  Fs: integer;
begin
  Fs := aCanvas.Font.Height;
  aCanvas.Brush.Style := bsClear;
  tf := TFont.Create;
  try
    tf.Assign(aCanvas.Font);
    GetObject(tf.Handle, sizeof(lf), @lf);
    lf.lfEscapement := Angle * 10;
    lf.lfOrientation := Angle * 10;
    tf.Handle := CreateFontIndirect(lf);
    aCanvas.Font.Assign(tf);

    if Fs = 0 then
      aCanvas.Font.Height := -12
    else
      aCanvas.Font.Height := Fs;

  finally
    tf.Free;
  end;

  if Angle = 90 then
  begin
    R.Left := R.Left + ((R.Right - R.Left) - aCanvas.TextHeight(aText)) div 2;
    R.Right := R.Left + aCanvas.TextHeight(aText);

    ts.Clipping := False;
    ts.SingleLine := True;
    //acanvas.TextRect(R,0,0,Text,ts);     // ct9999

    DrawText(aCanvas.Handle, PChar(aText), Length(aText), R, DT_SINGLELINE or DT_NOCLIP);
  end;
  if Angle = 270 then
  begin
    R := Rect(R.Right, R.Bottom, R.Left, R.Top);
    R.Right := R.Right + ((R.Left - R.Right) - aCanvas.TextHeight(aText)) div 2;
    R.Left := R.Right + aCanvas.TextHeight(aText);

    ts.Clipping := False;
    ts.SingleLine := True;
    // acanvas.TextRect(R,0,0,Text,ts);    // ct9999

    DrawText(aCanvas.Handle, PChar(aText), Length(aText), R, DT_SINGLELINE or DT_NOCLIP);
  end;

end;
//=========================== TplHorizontalRuler =============================================

constructor TplHorizontalRuler.Create(AOwner: TComponent);
begin
  inherited;
  // DoubleBuffered := true;
  ControlStyle := ControlStyle - [csAcceptsControls] + [csOpaque];
  FSOffset := 23;
  FEOffset := 23;
  FVOffset := 5;
  Width := 23;
  Height := 23;
  FUnits := muPixels;
  Align := alTop;
  FStartAt := 0;
  FSkipUnits := 50;
  mx := -1;
  FPos := rpTop;
  FMLeft := 0;
  FMRight := 0;
  FScale := 100;
  FCustomDPI := 0;
  FOneUnit := FScale / 100;
  FOuterCl := clBtnFace;
  FInnerCl := clWindow;
  FLineCl := clBtnShadow;
  FMarkCl := clHighlight;
  FShowFirst := False;
  FShowLast := False;
  FAddaptRectLeft := False;
  FAddaptRectRight := False;
end;

procedure TplHorizontalRuler.Paint;
var
  markL, markR, max: integer;
  ppi: integer;
begin
  R := ClientRect;
  //paint back rect
  Canvas.Brush.Color := FOuterCl;
  Canvas.FillRect(R);
  //set field rect
  Inc(R.Left, FSOffset);
  Dec(R.Right, FEOffset);
  InflateRect(R, 0, -FVOffset);
  //paint field rect
  Canvas.Brush.Color := FInnerCl;
  //calc max
  if FWholeSkip = 0 then FWholeSkip := FSkipUnits;
  max := Round(FieldLength / FWholeSkip);
  //Addapt the rect for the first number
  if FShowFirst and FAddaptRectLeft then Dec(R.Left, Canvas.TextWidth(IntToStr(FSOffset)) div 2);
  //now for the last number
  if FShowLast and FAddaptRectRight then Inc(R.Right, Canvas.TextWidth(IntToStr(max)) div 2);
  //paint the inner area
  Canvas.FillRect(R);
  //restore the rect
  if FShowFirst and FAddaptRectLeft then Inc(R.Left, Canvas.TextWidth(IntToStr(FSOffset)) div 2);
  if FShowLast and FAddaptRectRight then Dec(R.Right, Canvas.TextWidth(IntToStr(max)) div 2);
  // set pixels per inch
  if FCustomDPI > 0 then
    ppi := FCustomDPI
  else
    ppi := Screen.PixelsPerInch;
  // set measures
  case FUnits of
    muCentimeters: FOneUnit := ppi / 2.54;
    muMilimeters: FOneUnit := ppi / 25.4;
    muInches: FOneUnit := ppi;
    muPixels: FOneUnit := 1;
    muPoints: FOneUnit := ppi / 72;
    muPicas: FOneUnit := (ppi / 72) * 12;
  end;
  FOneUnit := FOneUnit * (FScale / 100);
  if FOneUnit = 0 then FOneUnit := 1 / 100;
  // calc vars
  FieldLength := R.Right - R.Left;
  FWholeSkip := FOneUnit * FSkipUnits;
  FHalfSkip := FWholeSkip / 2;
  FQuartSkip := FHalfSkip / 2;
  //mark fragment
  Canvas.Brush.Color := FMarkCl;
  markL := FMLeft;
  markR := FMRight;
  if FMLeft < R.Left then
    markL := R.Left;
  if FMLeft > R.Right then
    markL := R.Right;
  if FMRight > R.Right then
    markR := R.Right;
  if FMRight < R.Left then
    markR := R.Left;
  Canvas.FillRect(Rect(markL, R.Top, markR, R.Bottom));
  //paint ticks & text
  Canvas.Pen.Color := FLineCl;
  DrawWholeLines;
  if Assigned(FOnPaint) then
    FOnPaint(Self);
end;

function TplHorizontalRuler.GetMaxWidth: integer;
var
  i, max: integer;
begin
  max := 0;
  for i := 1 to Round(FieldLength / FWholeSkip) do
    if Canvas.TextWidth(FloatToStr(i * FSkipUnits + FStartAt)) > max then
      max := Canvas.TextWidth(FloatToStr(i * FSkipUnits + FStartAt));
  Result := max;
end;

procedure TplHorizontalRuler.DrawWholeLines;
var
  i, x, l, maxwidth, s: integer;
  TR: TRect;
  lblText: string;
begin
  maxwidth := GetMaxWidth;
  if FShowFirst then
    s := 0
  else
    s := 1;
  for i := s to Round(FieldLength / FWholeSkip) do
  begin
    x := R.Left + Round(i * FWholeSkip);
    if (x < R.Right - FQuartSkip / 2) or ((x <= R.Right) and FShowLast) then
    begin
      //draw whole unit lines if they fit
      if FWholeSkip > 1 then
        case FPos of
          rpTop:
          begin
            Canvas.MoveTo(x, R.Bottom);
            Canvas.LineTo(x, Height);
          end;
          rpBottom:
          begin
            Canvas.MoveTo(x, 0);
            Canvas.LineTo(x, R.Top);
          end;
        end;
      Canvas.Font := Font;
      lblText := FloatToStr(i * FSkipUnits + FStartAt);
      if Assigned(FOnPaintLabel) then FOnPaintLabel(Canvas.Font, lblText);
      //draw the numbers if they fit
      if maxwidth < FWholeSkip then
      begin
        l := Round(x - (Canvas.TextWidth(lblText) / 2)) + 1;
        TR := Rect(l, R.Top, l + Canvas.TextWidth(lblText), R.Bottom);
        Canvas.Brush.Style := bsClear;
        if (TR.Right < R.Right) or ((TR.Right < R.Right + Canvas.TextWidth(lblText) / 2) and FShowLast) then
          DrawText(Canvas.Handle, PChar(lblText), Length(lblText), TR, DT_SINGLELINE or DT_CENTER or DT_VCENTER);
        Canvas.Brush.Style := bsSolid;
      end;
    end;
  end;
  // draw the half & quarter lines
  //if the numbers fit
  if maxwidth < FWholeSkip then
  begin
    if (FWholeSkip - maxwidth) / 2 > 2 then
    begin
      DrawHalfLines;
      if (FWholeSkip / 2 - maxwidth) > 5 then
        DrawQuarterLines;
    end;
  end
  else
  // if the numbers don't fit
  if FHalfSkip > 2 then
  begin
    DrawHalfLines;
    if FQuartSkip > 2 then
      DrawQuarterLines;
  end;
  //draw the mouse coord line
  if (mx > R.Left - 1) and (mx < R.Right + 1) then
  begin
    Canvas.Pen.Color := FLineCl;
    Canvas.MoveTo(mx, R.Top);
    Canvas.LineTo(mx, R.Bottom);
  end;
end;

procedure TplHorizontalRuler.DrawHalfLines;
var
  i, x: integer;
begin
  for i := 1 to Round(FieldLength / FHalfSkip) - 1 do
    if i mod 2 <> 0 then
    begin
      x := R.Left + Round(i * FHalfSkip);
      if x < R.Right - FQuartSkip / 2 then
      begin
        Canvas.MoveTo(x, R.Top + 2);
        Canvas.LineTo(x, R.Bottom - 2);
      end;
    end;
end;

procedure TplHorizontalRuler.DrawQuarterLines;
var
  i, x: integer;
begin
  for i := 1 to Round(FieldLength / FQuartSkip) - 1 do
    if i mod 2 <> 0 then
    begin
      x := R.Left + Round(i * FQuartSkip);
      Canvas.MoveTo(x, R.Top + 4);
      Canvas.LineTo(x, R.Bottom - 4);
    end;
end;

procedure TplHorizontalRuler.SetSOffset(o: integer);
begin
  if FSOffset <> o then
  begin
    FSOffset := o;
    invalidate;
  end;
end;

procedure TplHorizontalRuler.SetEOffset(o: integer);
begin
  if FEOffset <> o then
  begin
    FEOffset := o;
    invalidate;
  end;
end;

procedure TplHorizontalRuler.SetVOffset(o: integer);
begin
  if FVOffset <> o then
  begin
    FVOffset := o;
    invalidate;
  end;
end;

procedure TplHorizontalRuler.SetUnit(u: TCSSMeasureUnit);
begin
  if FUnits <> u then
  begin
    FUnits := u;
    invalidate;
  end;
end;

procedure TplHorizontalRuler.SetStartAt(s: Extended);
begin
  if FStartAt <> s then
  begin
    FStartAt := s;
    invalidate;
  end;
end;

procedure TplHorizontalRuler.SetSkipUnits(s: Extended);
begin
  if FSkipUnits <> s then
  begin
    FSkipUnits := s;
    invalidate;
  end;
end;

procedure TplHorizontalRuler.UpdateDisplay(x: integer);
begin
  mx := x;
  invalidate;
end;

procedure TplHorizontalRuler.SetPos(p: THorRulerPosition);
begin
  if FPos <> p then
  begin
    FPos := p;
    invalidate;
  end;
end;

procedure TplHorizontalRuler.MarkFragment(ALeft, ARight: integer);
begin
  FMLeft := ALeft;
  FMRight := ARight;
  invalidate;
end;

function TplHorizontalRuler.GetPosition(x: integer): Extended;
begin
  if x > Width - FEOffset then
    x := Width - FEOffset;
  if x < FSOffset then
    x := FSOffset;
  Result := (x - FSOffset) / FOneUnit;
end;

procedure TplHorizontalRuler.SetScale(s: integer);
begin
  if s < 1 then s := 1;
  if FScale <> s then
  begin
    FScale := s;
    invalidate;
  end;
end;

procedure TplHorizontalRuler.SetOuterCl(c: TColor);
begin
  if FOuterCl <> c then
  begin
    FOuterCl := c;
    invalidate;
  end;
end;

procedure TplHorizontalRuler.SetInnerCl(c: TColor);
begin
  if FInnerCl <> c then
  begin
    FInnerCl := c;
    invalidate;
  end;
end;

procedure TplHorizontalRuler.SetLineCl(c: TColor);
begin
  if FLineCl <> c then
  begin
    FLineCl := c;
    invalidate;
  end;
end;

procedure TplHorizontalRuler.SetMarkCl(c: TColor);
begin
  if FMarkCl <> c then
  begin
    FMarkCl := c;
    invalidate;
  end;
end;

procedure TplHorizontalRuler.SetCustomDPI(Value: integer);
begin
  if FCustomDPI <> Value then
  begin
    FCustomDPI := Value;
    Invalidate;
  end;
end;

procedure TplHorizontalRuler.SetShowFirst(Value: boolean);
begin
  if FShowFirst <> Value then
  begin
    FShowFirst := Value;
    invalidate;
  end;
end;

procedure TplHorizontalRuler.SetShowLast(Value: boolean);
begin
  if FShowLast <> Value then
  begin
    FShowLast := Value;
    invalidate;
  end;
end;

procedure TplHorizontalRuler.SetAddaptRectLeft(Value: boolean);
begin
  if FAddaptRectLeft <> Value then
  begin
    FAddaptRectLeft := Value;
    invalidate;
  end;
end;

procedure TplHorizontalRuler.SetAddaptRectRight(Value: boolean);
begin
  if FAddaptRectRight <> Value then
  begin
    FAddaptRectRight := Value;
    invalidate;
  end;
end;

//========================================================================

constructor TplVerticalRuler.Create(AOwner: TComponent);
begin
  inherited;
  // DoubleBuffered := true;
  ControlStyle := ControlStyle - [csAcceptsControls] + [csOpaque];
  FSOffset := 0;
  FEOffset := 23;
  FHOffset := 5;
  Width := 23;
  Height := 23;
  FUnits := muPixels;
  Align := alLeft;
  FStartAt := 0;
  FSkipUnits := 50;
  my := -1;
  FPos := rpLeft;
  FMTop := 0;
  FMBottom := 0;
  FScale := 100;
  FOneUnit := 1 * (FScale / 100);
  FCustomDPI := 0;
  //set colors
  FOuterCl := clBtnFace;
  FInnerCl := clWindow;
  FLineCl := clBtnShadow;
  FMarkCl := clHighlight;
  FShowFirst := False;
  FShowLast := False;
  FAddaptRectLeft := False;
  FAddaptRectRight := False;
  Font.Name := 'MS Shell Dlg 2';
end;

procedure TplVerticalRuler.Paint;
var
  markT, markB, max: integer;
  ppi: integer;
begin
  R := ClientRect;
  //paint back rect
  Canvas.Brush.Color := FOuterCl;
  Canvas.FillRect(R);
  //set field rect
  Inc(R.Top, FSOffset);
  Dec(R.Bottom, FEOffset);
  InflateRect(R, -FHOffset, 0);
  //paint field rect
  Canvas.Brush.Color := FInnerCl;
  //calc max
  if FWholeSkip = 0 then FWholeSkip := FSkipUnits;
  max := Round(FieldLength / FWholeSkip);
  //Addapt the rect for the first number
  if FShowFirst and FAddaptRectLeft then Dec(R.Top, Canvas.TextWidth(IntToStr(FSOffset)) div 2);
  //now for the last number
  if FShowLast and FAddaptRectRight then Inc(R.Bottom, Canvas.TextWidth(IntToStr(max)) div 2);
  //paint the inner area
  Canvas.FillRect(R);
  //restore the rect
  if FShowFirst and FAddaptRectLeft then Inc(R.Top, Canvas.TextWidth(IntToStr(FSOffset)) div 2);
  if FShowLast and FAddaptRectRight then Dec(R.Bottom, Canvas.TextWidth(IntToStr(max)) div 2);
  // set pixels per inch
  if FCustomDPI > 0 then
    ppi := FCustomDPI
  else
    ppi := Screen.PixelsPerInch;
  //set measures
  case FUnits of
    muCentimeters: FOneUnit := ppi / 2.54;
    muMilimeters: FOneUnit := ppi / 25.4;
    muInches: FOneUnit := ppi;
    muPixels: FOneUnit := 1;
    muPoints: FOneUnit := ppi / 72;
    muPicas: FOneUnit := (ppi / 72) * 12;
  end;
  FOneUnit := FOneUnit * (FScale / 100);
  if FOneUnit = 0 then FOneUnit := 1 / 100;
  // calc vars
  FieldLength := R.Bottom - R.Top;
  FWholeSkip := FOneUnit * FSkipUnits;
  FHalfSkip := FWholeSkip / 2;
  FQuartSkip := FHalfSkip / 2;
  //mark fragment
  Canvas.Brush.Color := FMarkCl;
  markT := FMTop;
  markB := FMBottom;
  if FMTop < R.Top then
    markT := R.Top;
  if FMTop > R.Bottom then
    markT := R.Bottom;
  if FMBottom > R.Bottom then
    markB := R.Bottom;
  if FMBottom < R.Top then
    markB := R.Top;
  Canvas.FillRect(Rect(R.Left, markT, R.Right, markB));
  //paint ticks & text
  Canvas.Pen.Color := FLineCl;
  DrawWholeLines;
  if Assigned(FOnPaint) then
    FOnPaint(Self);
end;

function TplVerticalRuler.GetMaxWidth: integer;
var
  i, max: integer;
begin
  max := 0;
  for i := 1 to Round(FieldLength / FWholeSkip) do
    if Canvas.TextWidth(FloatToStr(i * FSkipUnits + FStartAt)) > max then
      max := Canvas.TextWidth(FloatToStr(i * FSkipUnits + FStartAt));
  Result := max;
end;

procedure TplVerticalRuler.DrawWholeLines;
var
  FAngle, i, y, t, maxwidth, s: integer;
  TR: TRect;
  lblText: string;
begin
  FAngle := 90;
  maxwidth := GetMaxWidth;
  if FShowFirst then
    s := 0
  else
    s := 1;
  for i := s to Round(FieldLength / FWholeSkip) do
  begin
    y := R.Top + Round(i * FWholeSkip);
    if (y < R.Bottom - FQuartSkip / 2) or ((y <= R.Bottom) and FShowLast) then
    begin
      //draw whole unit lines if they fit
      if FWholeSkip > 1 then
        case FPos of
          rpLeft:
          begin
            Canvas.MoveTo(R.Right, y);
            Canvas.LineTo(Width, y);
          end;
          rpRight:
          begin
            Canvas.MoveTo(0, y);
            Canvas.LineTo(R.Left, y);
          end;
        end;
      Canvas.Font := Font;
      lblText := FloatToStr(i * FSkipUnits + FStartAt);
      if Assigned(FOnPaintLabel) then FOnPaintLabel(Canvas.Font, lblText);
      //draw the numbers if they fit
      if maxwidth < FWholeSkip then
      begin
        t := Round(y - (Canvas.TextWidth(lblText) / 2));
        TR := Rect(R.Left, t + Canvas.TextWidth(lblText), R.Right, t);

        case FPos of
          rpLeft: FAngle := 90;
          rpRight: FAngle := 270;
        end;

        if (TR.Bottom < R.Bottom) or ((TR.Bottom < R.Bottom + Canvas.TextWidth(lblText) / 2) and FShowLast) then
          DrawRotatedText(Canvas, TR, FAngle, lblText);

        Canvas.Brush.Style := bsSolid;
      end;
    end;
  end;
  // draw the half & quarter lines
  //if the numbers fit
  if maxwidth < FWholeSkip then
  begin
    if (FWholeSkip - maxwidth) / 2 > 2 then
    begin
      DrawHalfLines;
      if (FWholeSkip / 2 - maxwidth) > 5 then
        DrawQuarterLines;
    end;
  end
  else
  // if the numbers don't fit
  if FHalfSkip > 2 then
  begin
    DrawHalfLines;
    if FQuartSkip > 2 then
      DrawQuarterLines;
  end;
  //draw the mouse coord line
  if (my > R.Top - 1) and (my < R.Bottom + 1) then
  begin
    Canvas.Pen.Color := FLineCl;
    Canvas.MoveTo(R.Left, my);
    Canvas.LineTo(R.Right, my);
  end;
end;

procedure TplVerticalRuler.DrawHalfLines;
var
  i, y: integer;
begin
  for i := 1 to Round(FieldLength / FHalfSkip) - 1 do
    if i mod 2 <> 0 then
    begin
      y := R.Top + Round(i * FHalfSkip);
      if y < R.Bottom - FQuartSkip / 2 then
      begin
        Canvas.MoveTo(R.Left + 2, y);
        Canvas.LineTo(R.Right - 2, y);
      end;
    end;
end;

procedure TplVerticalRuler.DrawQuarterLines;
var
  i, y: integer;
begin
  for i := 1 to Round(FieldLength / FQuartSkip) - 1 do
    if i mod 2 <> 0 then
    begin
      y := R.Top + Round(i * FQuartSkip);
      Canvas.MoveTo(R.Left + 4, y);
      Canvas.LineTo(R.Right - 4, y);
    end;
end;

procedure TplVerticalRuler.SetSOffset(o: integer);
begin
  if FSOffset <> o then
  begin
    FSOffset := o;
    invalidate;
  end;
end;

procedure TplVerticalRuler.SetEOffset(o: integer);
begin
  if FEOffset <> o then
  begin
    FEOffset := o;
    invalidate;
  end;
end;

procedure TplVerticalRuler.SetHOffset(o: integer);
begin
  if FHOffset <> o then
  begin
    FHOffset := o;
    invalidate;
  end;
end;

procedure TplVerticalRuler.SetUnit(u: TCSSMeasureUnit);
begin
  if FUnits <> u then
  begin
    FUnits := u;
    invalidate;
  end;
end;

procedure TplVerticalRuler.SetStartAt(s: Extended);
begin
  if FStartAt <> s then
  begin
    FStartAt := s;
    invalidate;
  end;
end;

procedure TplVerticalRuler.SetSkipUnits(s: Extended);
begin
  if FSkipUnits <> s then
  begin
    FSkipUnits := s;
    invalidate;
  end;
end;

procedure TplVerticalRuler.UpdateDisplay(y: integer);
begin
  my := y;
  invalidate;
end;

procedure TplVerticalRuler.SetPos(p: TVerRulerPosition);
begin
  if FPos <> p then
  begin
    FPos := p;
    invalidate;
  end;
end;

procedure TplVerticalRuler.MarkFragment(ATop, ABottom: integer);
begin
  FMTop := ATop;
  FMBottom := ABottom;
  invalidate;
end;

function TplVerticalRuler.GetPosition(y: integer): Extended;
begin
  if y > Height - FEOffset then
    y := Height - FEOffset;
  if y < FSOffset then
    y := FSOffset;
  Result := (y - FSOffset) / FOneUnit;
end;

procedure TplVerticalRuler.SetScale(s: integer);
begin
  if s < 1 then s := 1;
  if FScale <> s then
  begin
    FScale := s;
    invalidate;
  end;
end;

procedure TplVerticalRuler.SetOuterCl(c: TColor);
begin
  if FOuterCl <> c then
  begin
    FOuterCl := c;
    invalidate;
  end;
end;

procedure TplVerticalRuler.SetInnerCl(c: TColor);
begin
  if FInnerCl <> c then
  begin
    FInnerCl := c;
    invalidate;
  end;
end;

procedure TplVerticalRuler.SetLineCl(c: TColor);
begin
  if FLineCl <> c then
  begin
    FLineCl := c;
    invalidate;
  end;
end;

procedure TplVerticalRuler.SetMarkCl(c: TColor);
begin
  if FMarkCl <> c then
  begin
    FMarkCl := c;
    invalidate;
  end;
end;

procedure TplVerticalRuler.SetCustomDPI(Value: integer);
begin
  if FCustomDPI <> Value then
  begin
    FCustomDPI := Value;
    Invalidate;
  end;
end;

procedure TplVerticalRuler.SetShowFirst(Value: boolean);
begin
  if FShowFirst <> Value then
  begin
    FShowFirst := Value;
    invalidate;
  end;
end;

procedure TplVerticalRuler.SetShowLast(Value: boolean);
begin
  if FShowLast <> Value then
  begin
    FShowLast := Value;
    invalidate;
  end;
end;

procedure TplVerticalRuler.SetAddaptRectLeft(Value: boolean);
begin
  if FAddaptRectLeft <> Value then
  begin
    FAddaptRectLeft := Value;
    invalidate;
  end;
end;

procedure TplVerticalRuler.SetAddaptRectRight(Value: boolean);
begin
  if FAddaptRectRight <> Value then
  begin
    FAddaptRectRight := Value;
    invalidate;
  end;
end;


end.
