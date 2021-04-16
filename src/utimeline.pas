//**********************************************************************
//*    Sprite Editor 4.0                                               *
//*    Copyright (c) 2000-2019 by ViruZ                                *
//*                                                                    *
//*    See the file COPYING.FPC, included in this distribution,        *
//*    for details about the copyright.                                *
//*                                                                    *
//*    This program is distributed in the hope that it will be useful, *
//*    but WITHOUT ANY WARRANTY; without even the implied warranty of  *
//*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.            *
//*                                                                    *
//**********************************************************************
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

