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
//Layers tool window for Spedit4
unit ulayers;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, TplPaintGridUnit,
  XGR32_ExtLayers_Panel, igLayersListBox;

type

  { TfrmLayers }

  TfrmLayers = class(TForm)
    ExLayers32Panel1: TExLayers32Panel;
    igLayersListBox1: TigLayersListBox;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  frmLayers: TfrmLayers;

implementation

{$R *.frm}

uses umain, uglobals;

{ TfrmLayers }

procedure TfrmLayers.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  frmMain.LayersToolVisibleMenuItem.Checked:=false;
  Hide;
end;

end.

