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

unit TplGalleryUnit;

{$mode objfpc}{$H+}

interface

uses
  LCLType, LCLProc, LMessages, LCLIntf,
  Classes, Controls, Graphics, ExtCtrls, Forms, Math;

type

  TplGallery = class;

  TGalleryItem = class(TCollectionItem)
  private
    DisplayRect: TRect;
    FTag: integer;
    FPicture: TPicture;
    FHint: string;
    function GetGallery: TplGallery;
    procedure PictureChange(Sender: TObject);
    procedure SetPicture(Value: TPicture);
  public
    constructor Create(ACollection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property Gallery: TplGallery read GetGallery;
  published
    property Tag: integer read FTag write FTag;
    property Hint: string read FHint write FHint;
    property Picture: TPicture read FPicture write SetPicture;
  end;

  TGalleryItems = class(TCollection)
  private
    FGallery: TplGallery;
    function GetItem(Index: integer): TGalleryItem;
    procedure SetItem(Index: integer; Value: TGalleryItem);
  protected
    function GetOwner: TPersistent; override;
    procedure Update(Item: TCollectionItem); override;
  public
    constructor Create(AGallery: TplGallery);
    property Gallery: TplGallery read FGallery;
    property Items[Index: integer]: TGalleryItem read GetItem write SetItem; default;
    function Add: TGalleryItem;
    function AddItem(Item: TGalleryItem; Index: integer): TGalleryItem;
    function Insert(Index: integer): TGalleryItem;
  end;

  TGalleryEvent = procedure(Sender: TObject; Index: integer) of object;

  TplGallery = class(TCustomControl)
  private
    FBuffer: TPicture;
    LScroller: TRect;
    RScroller: TRect;
    LArrow, RArrow: array of TPoint;
    LScrollerVisible: boolean;
    RScrollerVisible: boolean;
    Delta: integer;
    MaxDelta: integer;
    LastHover: integer;
    HoverIndex: integer;
    RgnL, RgnR: HRGN;
    MustScrollLeft, MustScrollRight: boolean;
    AutoScroll: boolean;
    CanScroll: boolean;
    FScrollerSize: integer;
    FScrollerArrowColor: TColor;
    FScrollerColor: TColor;
    FScrollerHoverArrowColor: TColor;
    FScrollerHoverColor: TColor;
    FHandPointCursor: boolean;
    FSelectionColor: TColor;
    FItems: TGalleryItems;
    FTimer: TTimer;
    FOnHover: TGalleryEvent;
    FOnClick: TGalleryEvent;
    FLargeChange: integer;
    FSmallChange: integer;
    FActive: boolean;
    FInterval: cardinal;
    function CreateItem: TGalleryItem;
    procedure UpdateItem(Index: integer);
    procedure UpdateItems;
    procedure Recalculate;
    procedure CheckScroller;
    procedure DrawItem(aIndex: integer);
    function GetItemAtXY(X, Y: integer): integer;
    procedure TimerTimer(Sender: TObject);
    procedure CMColorChanged(var Msg: TLMessage); message CM_COLORCHANGED;
    procedure CMMouseLeave(var Msg: TLMessage); message CM_MouseLeave;
    procedure WMSize(var Msg: TLMSize); message LM_SIZE;
    procedure WMEraseBkgnd(var Msg: TLMEraseBkgnd); message LM_ERASEBKGND;
    procedure SetItems(Value: TGalleryItems);
    procedure SetScrollerSize(Value: integer);
    procedure SetScrollerColor(Value: TColor);
    procedure SetScrollerArrowColor(Value: TColor);
    procedure SetActive(const Value: boolean);
    procedure SetInterval(Value: cardinal);
  protected
    procedure Paint; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: integer); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Active: boolean read FActive write SetActive default False;
    property Items: TGalleryItems read FItems write SetItems;
    property Interval: cardinal read FInterval write SetInterval;
    property ScrollerSize: integer read FScrollerSize write SetScrollerSize default 25;
    property ScrollerArrowColor: TColor read FScrollerArrowColor write SetScrollerArrowColor default clWhite;
    property ScrollerColor: TColor read FScrollerColor write SetScrollerColor default clBlack;
    property ScrollerHoverArrowColor: TColor read FScrollerHoverArrowColor write FScrollerHoverArrowColor default clYellow;
    property ScrollerHoverColor: TColor read FScrollerHoverColor write FScrollerHoverColor default clBlack;
    property HandPointCursor: boolean read FHandPointCursor write FHandPointCursor default True;
    property SelectionColor: TColor read FSelectionColor write FSelectionColor default clRed;
    property SmallChange: integer read FSmallChange write FSmallChange default 3;
    property LargeChange: integer read FLargeChange write FLargeChange default 30;
    property OnHover: TGalleryEvent read FOnHover write FOnHover;
    property OnClick: TGalleryEvent read FOnClick write FOnClick;
    property Color;
    property TabStop;
    property TabOrder;
    property Anchors;
    property Align;
    property ShowHint;

    Property OnDblClick;
    Property OnPaint;
    Property OnResize;
    Property OnChangeBounds;
    Property OnContextPopup;
    Property OnEndDrag;
    Property OnMouseDown;
    Property OnMouseUp;
    Property OnMouseEnter;
    Property OnMouseLeave;
    Property OnMouseMove;
    Property OnMouseWheel;
    Property OnMouseWheelDown;
    Property OnMouseWheelUp;
    Property OnMouseWheelHorz;
    Property OnMouseWheelLeft;
    Property OnMouseWheelRight;
    Property OnDragDrop;
    Property OnDragOver;
    Property OnStartDrag;
    Property OnStartDock;
    Property OnEndDock;
  end;


implementation


const
  SCLEFTINDEX = -2147483647;
  SCRIGHTINDEX = -2147483646;


//======================= TplGallery ============================================

constructor TplGallery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Delta := 0;
  MaxDelta := 0;
  HoverIndex := -1;
  LastHover := -1;
  LScrollerVisible := False;
  RScrollerVisible := False;
  MustScrollLeft := True;
  MustScrollRight := False;
  AutoScroll := True;
  CanScroll := False;
  Align := alTop;
  Height := 130;

 { Color := clWhite;  //give error
   }

  FActive := False;
  FScrollerSize := 25;
  FScrollerArrowColor := clWhite;
  FScrollerColor := clBlack;
  FScrollerHoverArrowColor := clYellow;
  FScrollerHoverColor := clBlack;
  FHandPointCursor := True;
  FSelectionColor := clRed;
  FLargeChange := 30;
  FSmallChange := 3;
  FInterval := 100;

  FItems := TGalleryItems.Create(self);
  FTimer := TTimer.Create(self);

  with FTimer do
  begin
    Interval := FInterval;
    FTimer.OnTimer := @TimerTimer;
    Enabled := False;
  end;

  FBuffer := TPicture.Create;
  FBuffer.Bitmap.PixelFormat := pf24bit;

end;

destructor TplGallery.Destroy;
begin
  FTimer.Enabled := False;
  FTimer.Free;
  DeleteObject(RgnL);
  DeleteObject(RgnR);

  if assigned(FBuffer) then
  begin
    FBuffer.Free;
    FBuffer := nil;
  end;

  inherited Destroy;
end;

function TplGallery.CreateItem: TGalleryItem;
begin
  Result := TGalleryItem.Create(FItems);
end;

procedure TplGallery.UpdateItem(Index: integer);
begin
  paint;
end;

procedure TplGallery.UpdateItems;
begin
  Recalculate;
  paint;
end;

procedure TplGallery.Recalculate;
var
  x, n: integer;
  h, w: integer;
  mx: integer;
  f: integer;
  Rc: TRect;

begin

  FTimer.Enabled := False;
  n := 0;
  h := 0;
  for x := 0 to FItems.Count - 1 do
  begin
    case (x mod 3) of
      0: h := Round(Height * 0.6);
      1: h := Round(Height * 0.85);
      2: h := Height;
    end;
    with FItems[x] do
    begin

      if (FPicture.Height > 0) then
        w := Round((FPicture.Width / FPicture.Height) * h)
      else
        w := 0;

      DisplayRect := Rect(n, 0, n + w, h);
    end;
    Inc(n, w);
  end;

  MaxDelta := Max(0, n - Width);
  CanScroll := MaxDelta > 0;

  LScroller := Rect(10, Height - FScrollerSize - 10, 10 + FScrollerSize, Height - 10);
  RScroller := Rect(Width - FScrollerSize - 10, Height - FScrollerSize - 10, Width - 10, Height - 10);

  with LScroller do
  begin
    f := FScrollerSize div 6;
    mx := Left + (3 * f);
    SetLength(LArrow, 7);
    LArrow[0] := Point(Left + f, Top + (3 * f));
    LArrow[1] := Point(mx, Top + f);
    LArrow[2] := Point(mx, Top + (2 * f));
    LArrow[3] := Point(Left + Round(4.5 * f), Top + (2 * f));
    LArrow[4] := Point(Left + Round(4.5 * f), Top + (4 * f));
    LArrow[5] := Point(mx, Top + (4 * f));
    LArrow[6] := Point(mx, Top + (5 * f));
  end;

  with RScroller do
  begin
    f := FScrollerSize div 6;
    mx := Left + (3 * f);
    SetLength(RArrow, 7);
    RArrow[0] := Point(Left + Round(1.5 * f), Top + (4 * f));
    RArrow[1] := Point(Left + Round(1.5 * f), Top + (2 * f));
    RArrow[2] := Point(mx, Top + (2 * f));
    RArrow[3] := Point(mx, Top + f);
    RArrow[4] := Point(Left + (5 * f), Top + (3 * f));
    RArrow[5] := Point(mx, Top + (5 * f));
    RArrow[6] := Point(mx, Top + (4 * f));
  end;

  DeleteObject(RgnL);
  DeleteObject(RgnR);

  Rc := LScroller;
  Rc.Right := Rc.Right + 1;
  Rc.Bottom := Rc.Bottom + 1;
  RgnL := CreateEllipticRgnIndirect(Rc);

  Rc := RScroller;
  Rc.Right := Rc.Right + 1;
  Rc.Bottom := Rc.Bottom + 1;
  RgnR := CreateEllipticRgnIndirect(Rc);

  CheckScroller;

  if not (csDesigning in ComponentState) then
    FTimer.Enabled := FActive;

end;

procedure TplGallery.CheckScroller;
begin
  LScrollerVisible := Delta > 0;
  RScrollerVisible := Delta < MaxDelta;
end;

procedure TplGallery.DrawItem(aIndex: integer);
var
  Rgn: HRGN;
  Dummy, Rc, Rc2: TRect;
  LVis, RVis: boolean;
begin
  case aIndex of
    -1: Exit;
    //.............................................
    SCLEFTINDEX:
      if LScrollerVisible then
      begin
        with FBuffer.Bitmap.Canvas do
        begin
          Brush.Style := bsSolid;
          if (HoverIndex = aIndex) then
          begin
            Brush.Color := FScrollerHoverColor;
            Pen.Color := FScrollerHoverColor;
          end
          else
          begin
            Brush.Color := FScrollerColor;
            Pen.Color := FScrollerColor;
          end;
          Ellipse(LScroller);
          if (HoverIndex = aIndex) then
          begin
            Brush.Color := FScrollerHoverArrowColor;
            Pen.Color := FScrollerHoverArrowColor;
          end
          else
          begin
            Brush.Color := FScrollerArrowColor;
            Pen.Color := FScrollerArrowColor;
          end;
          Polygon(LArrow);
        end;
      end;
    //................................................
    SCRIGHTINDEX:
      if RScrollerVisible then
      begin
        with FBuffer.Bitmap.Canvas do
        begin
          Brush.Style := bsSolid;
          if (HoverIndex = aIndex) then
          begin
            Brush.Color := FScrollerHoverColor;
            Pen.Color := FScrollerHoverColor;
          end
          else
          begin
            Brush.Color := FScrollerColor;
            Pen.Color := FScrollerColor;
          end;
          Ellipse(RScroller);
          if (HoverIndex = aIndex) then
          begin
            Brush.Color := FScrollerHoverArrowColor;
            Pen.Color := FScrollerHoverArrowColor;
          end
          else
          begin
            Brush.Color := FScrollerArrowColor;
            Pen.Color := FScrollerArrowColor;
          end;
          Polygon(RArrow);
        end;
      end;

    else
      //.......................................................
    begin
      Rc := FItems[aIndex].DisplayRect;
      OffsetRect(Rc, -Delta, 0);
      if not IntersectRect(Dummy, Rc, ClientRect) then
        Exit;
      Rc2 := Rc;
      Rc2.Bottom := Height;
      LVis := LScrollerVisible and IntersectRect(Dummy, Rc2, LScroller);
      RVis := RScrollerVisible and IntersectRect(Dummy, Rc2, RScroller);
      Rgn := CreateRectRgnIndirect(Rc2);

      if LVis then
        CombineRgn(Rgn, Rgn, RgnL, RGN_DIFF);
      if RVis then
        CombineRgn(Rgn, Rgn, RgnR, RGN_DIFF);
      SelectClipRgn(Canvas.Handle, Rgn);

      with FBuffer.Bitmap.Canvas do
      begin
        Rc2 := Rc;
        Brush.Style := bsClear;
        Pen.Color := Color;
        Rectangle(Rc2);
        Rc2.Top := Rc.Bottom;
        Rc2.Bottom := Height;
        Brush.Style := bsSolid;
        Brush.Color := Color;
        FillRect(Rc2);

        if (aIndex = HoverIndex) then
        begin
          Brush.Style := bsClear;
          Pen.Color := FSelectionColor;
          Rectangle(Rc);
        end;

        InflateRect(Rc, -1, -1);
        StretchDraw(Rc, FItems[aIndex].FPicture.Graphic);
      end;
      DeleteObject(Rgn);
      SelectClipRgn(Canvas.Handle, 0);
    end;
      //.......................................................
  end;
end;

procedure TplGallery.Paint;
var
  x: integer;
  n: integer;
  Rc: TRect;
begin
  inherited Paint;

  if (FBuffer.Width <> Width) or (FBuffer.Height <> Height) then
    FBuffer.Bitmap.SetSize(Width, Height);

  //.... clear Buffer .....
  FBuffer.Bitmap.Canvas.Brush.Style := bsSolid;
  FBuffer.Bitmap.Canvas.Brush.Color := Color;
  FBuffer.Bitmap.Canvas.FillRect(ClientRect);

  //.... draw items ...........................
  n := 0;

  if (FItems.Count > 0) then
  begin
    for x := 0 to FItems.Count - 1 do
      DrawItem(x);

    n := FItems[FItems.Count - 1].DisplayRect.Right;
  end;

  if (n < Width) then
  begin
    Rc := Rect(n, 0, Width, Height);

    with FBuffer.Bitmap.Canvas do
    begin
      Brush.Style := bsSolid;
      Brush.Color := Color;
      FillRect(Rc);
    end;
  end;
  //.... Draw Scrollers ........................

  if LScrollerVisible then
    DrawItem(SCLEFTINDEX);
  if RScrollerVisible then
    DrawItem(SCRIGHTINDEX);

  //...Finally draw .............

  Self.Canvas.Draw(0, 0, FBuffer.Bitmap);

end;

function TplGallery.GetItemAtXY(X, Y: integer): integer;
var
  P: TPoint;
  i: integer;
begin
  Result := -1;
  p := Point(X, Y);
  if LScrollerVisible and PtInRect(LScroller, p) then
    Result := SCLEFTINDEX
  else
  if RScrollerVisible and PtInRect(RScroller, p) then
    Result := SCRIGHTINDEX
  else
  begin
    p := Point(X + Delta, Y);
    if (FItems.Count > 0) then
    begin
      for i := 0 to FItems.Count - 1 do
      begin
        if PtInRect(FItems[i].DisplayRect, p) then
        begin
          Result := i;
          Break;
        end;
      end;
    end;
  end;
end;

procedure TplGallery.TimerTimer(Sender: TObject);
begin
  if (FItems.Count = 0) then
    Exit;
  if not CanScroll then
    Exit;

  if MustScrollLeft then
  begin
    Delta := Max(0, Delta - FSmallChange);
    CheckScroller;
    paint;
    if (Delta = 0) then
    begin
      MustScrollLeft := False;
      if AutoScroll then
        MustScrollRight := True;
    end;
  end
  else
  if MustScrollRight then
  begin
    Delta := Min(MaxDelta, Delta + FSmallChange);
    CheckScroller;
    paint;
    if (Delta = MaxDelta) then
    begin
      MustScrollRight := False;
      if AutoScroll then
        MustScrollLeft := True;
    end;
  end;
end;

procedure TplGallery.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: integer);
var
  i: integer;
begin
  i := GetItemAtXY(X, Y);
  case i of
    SCLEFTINDEX:
    begin
      Delta := Max(0, Delta - FLargeChange);
      CheckScroller;
      paint;
    end;
    SCRIGHTINDEX:
    begin
      Delta := Min(MaxDelta, Delta + FLargeChange);
      CheckScroller;
      paint;
    end;
    else
    begin
      if Assigned(FOnClick) then
        FOnClick(Self, i);
    end;
  end;
  inherited;
end;

procedure TplGallery.MouseMove(Shift: TShiftState; X, Y: integer);
var
  i: integer;
  IsItem: boolean;
begin

  i := GetItemAtXY(X, Y);

  AutoScroll := False;

  MustScrollLeft := i = SCLEFTINDEX;
  MustScrollRight := i = SCRIGHTINDEX;
  IsItem := (i <> -1) and (i <> SCLEFTINDEX) and (i <> SCRIGHTINDEX);
  if FHandPointCursor then
  begin
    case i of
      SCLEFTINDEX, SCRIGHTINDEX, -1:
        Cursor := crDefault;
      else
        Cursor := crHandPoint;
    end;
  end;
  if (i <> HoverIndex) then
  begin
    HoverIndex := i;
    DrawItem(LastHover);
    DrawItem(i);
    // Partial draw...
    if LScrollerVisible then
      DrawItem(SCLEFTINDEX);
    if RScrollerVisible then
      DrawItem(SCRIGHTINDEX);
    Self.Canvas.Draw(0, 0, FBuffer.Bitmap);
    //................
    LastHover := i;
    if Assigned(FOnHover) then
    begin
      if IsItem then
        FOnHover(Self, i)
      else
        FOnHover(Self, -1);
    end;
    if ShowHint then
    begin
      if IsItem then
      begin
        Hint := FItems[i].FHint;
        // TODO : Stefanos Fix This 9999
        // Application.ActivateHint(Mouse.CursorPos);
      end
      else
        Application.HideHint;
    end;
  end;
end;

procedure TplGallery.SetItems(Value: TGalleryItems);
begin
  Delta := 0;
  FItems.Assign(Value);
end;

procedure TplGallery.CMColorChanged(var Msg: TLMessage);
begin
  paint;
end;

procedure TplGallery.WMSize(var Msg: TLMSize);
begin
  FBuffer.Bitmap.SetSize(Width, Height);
  Delta := 0;
  Recalculate;
  paint;
end;

procedure TplGallery.WMEraseBkgnd(var Msg: TLMEraseBkgnd);
begin
  Msg.Result := 1;
end;

procedure TplGallery.CMMouseLeave(var Msg: TLMessage);
begin
  HoverIndex := -1;
  DrawItem(LastHover);
  if FHandPointCursor then
    Cursor := crDefault;
  AutoScroll := True;
  MustScrollLeft := True;
  inherited;
end;

procedure TplGallery.SetScrollerSize(Value: integer);
begin
  if (FScrollerSize = Value) then
    exit;

  FScrollerSize := Value;
  Recalculate;
  paint;
end;

procedure TplGallery.SetScrollerColor(Value: TColor);
begin
  if (FScrollerColor = Value) then
    exit;

  FScrollerColor := Value;
  paint;
end;

procedure TplGallery.SetScrollerArrowColor(Value: TColor);
begin
  if (FScrollerArrowColor = Value) then
    exit;

  FScrollerArrowColor := Value;
  paint;
end;

procedure TplGallery.SetActive(const Value: boolean);
begin
  if (FActive <> Value) then
  begin
    FActive := Value;
    if not (csDesigning in ComponentState) then
      FTimer.Enabled := Value;
    if not Value then
      Delta := 0;
  end;
  paint;
end;

procedure TplGallery.SetInterval(Value: cardinal);
begin
  if (Value = FInterval) then
    exit;
  if Value < 10 then
    exit;

  FInterval := Value;
  Ftimer.Interval := FInterval;
end;

//==================== TGalleryItem ========================================

constructor TGalleryItem.Create(ACollection: TCollection);
begin
  FPicture := TPicture.Create;
  FPicture.OnChange := @PictureChange;
  inherited Create(ACollection);
end;

destructor TGalleryItem.Destroy;
begin
  FPicture.Free;
  inherited Destroy;
end;

function TGalleryItem.GetGallery: TplGallery;
begin
  Result := TGalleryItems(Collection).FGallery;
end;

procedure TGalleryItem.Assign(Source: TPersistent);
begin
  if (Source is TGalleryItem) then
  begin
    FTag := TGalleryItem(Source).Tag;
    FHint := TGalleryItem(Source).Hint;
    FPicture.Assign(TGalleryItem(Source).Picture);
    //Changed(True);
  end;
end;

procedure TGalleryItem.SetPicture(Value: TPicture);
begin
  FPicture.Assign(Value);
end;

procedure TGalleryItem.PictureChange(Sender: TObject);
begin
  Changed(True);
end;


//===================== TGalleryItems =====================================================

constructor TGalleryItems.Create(AGallery: TplGallery);
begin
  inherited Create(TGalleryItem);
  FGallery := AGallery;
end;

function TGalleryItems.Add: TGalleryItem;
begin
  Result := TGalleryItem(inherited Add);
end;

function TGalleryItems.AddItem(Item: TGalleryItem; Index: integer): TGalleryItem;
begin
  if (Item = nil) then
    Result := FGallery.CreateItem
  else
  begin
    Result := Item;
    if Assigned(Item) then
    begin
      Result.Collection := Self;
      if (Index < 0) then
        Index := Count - 1;
      Result.Index := Index;
    end;
  end;
end;

function TGalleryItems.GetItem(Index: integer): TGalleryItem;
begin
  Result := TGalleryItem(inherited GetItem(Index));
end;

procedure TGalleryItems.SetItem(Index: integer; Value: TGalleryItem);
begin
  inherited SetItem(Index, Value);
end;

function TGalleryItems.GetOwner: TPersistent;
begin
  Result := FGallery;
end;

function TGalleryItems.Insert(Index: integer): TGalleryItem;
begin
  Result := AddItem(nil, Index);
end;

procedure TGalleryItems.Update(Item: TCollectionItem);
begin
  if (Item <> nil) then
    FGallery.UpdateItem(Item.Index)
  else
    FGallery.UpdateItems;
end;


end.
