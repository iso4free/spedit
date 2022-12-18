unit FamesView;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs,
  fgl, BGRABitmap;



type

  TItemSelectEvent = procedure(aName : String) of object;

  { TFrameItem }

  TFrameItem = class
  private
    FFrameName: String;
    FImage: TBGRABitmap;
  published
    property Image : TBGRABitmap read FImage;
    property FrameName : String read FFrameName;
  end;

  TFrameItems = specialize TFPGObjectList<TFrameItem>;

  { TFamesView }

  TFamesView = class(TScrollBox)
  private
    FFrameHeight: Integer;
    FFrames: TFrameItems;
    FFrameWidth: Integer;
    FOnItemSelect: TItemSelectEvent;
    function GetCount(): Integer; inline;
    procedure SetOnItemSelect(AValue: TItemSelectEvent);
  protected

  public
    constructor Create(AOwner : TComponent);override;
    procedure CreateWnd; override;
    destructor Destroy; override;

    function AddFrame(aName : String; aImg : TBGRABitmap) : Integer;

        //dimensions for all frames for display by default 32x32 px
    property FrameWidth : Integer read FFrameWidth default 32;
    property FrameHeight : Integer read FFrameHeight default 32;
    property Count : Integer read GetCount;

  published
    property Frames : TFrameItems read FFrames;

    property OnItemSelect : TItemSelectEvent read FOnItemSelect write SetOnItemSelect;
  end;

procedure Register;

implementation

procedure Register;
begin
  {$I famesview_icon.lrs}
  RegisterComponents('SPEdit components',[TFamesView]);
end;

{ TFamesView }

constructor TFamesView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFrames:= TFrameItems.Create(true);
end;

function TFamesView.AddFrame(aName: String; aImg: TBGRABitmap): Integer;
begin
 //todo: add frame name and frame image
  if FFrameHeight<aImg.Height then FFrameHeight:=aImg.Height;
  if FFrameWidth<aImg.Width then FFrameWidth:=aImg.Width;
end;

procedure TFamesView.CreateWnd;
begin
  inherited CreateWnd;
end;

destructor TFamesView.Destroy;
begin
  FreeAndNil(FFrames);
  inherited Destroy;
end;

function TFamesView.GetCount: Integer;
begin
  Result:=Frames.Count;
end;

procedure TFamesView.SetOnItemSelect(AValue: TItemSelectEvent);
begin
  if FOnItemSelect=AValue then Exit;
  FOnItemSelect:=AValue;
end;

end.
