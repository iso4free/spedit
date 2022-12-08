unit ftoolopions;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ExtCtrls,ComCtrls;

type

  { TFrToolOptions }

  TFrToolOptions = class(TFrame)
    trkbrPenSize: TTrackBar;
    procedure trkbrPenSizeChange(Sender: TObject);
  private

  public

  end;

implementation
  uses uglobals,udraw;
{$R *.lfm}

{ TFrToolOptions }

procedure TFrToolOptions.trkbrPenSizeChange(Sender: TObject);
begin
  FrameGrid.CellCursor.CursorSize:=trkbrPenSize.Position;
end;

end.

