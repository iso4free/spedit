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
//Painting tools window for Spedit4
unit utools;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Forms, Controls;

type

  { TfrmTools }

  TfrmTools = class(TForm)
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  frmTools: TfrmTools;

implementation

{$R *.frm}

uses umain;

{ TfrmTools }

procedure TfrmTools.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  frmMain.PaintToolPanelVisibleMenuItem.Checked:=false;
  Hide;
end;

end.

