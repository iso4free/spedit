//Timeline tool window for Spedit4
unit utimeline;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type

  { TfrmTimeLine }

  TfrmTimeLine = class(TForm)
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  frmTimeLine: TfrmTimeLine;

implementation

{$R *.frm}

uses uglobals, umain;

{ TfrmTimeLine }

procedure TfrmTimeLine.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  Hide;
end;

end.

