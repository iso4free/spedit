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

unit uresizedlg;

{$mode ObjFPC}{$H+}

interface

uses
  {$IFDEF DEBUG}LazLoggerBase, {$ENDIF}
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, Spin;

type

  { TfrmResize }

  TfrmResize = class(TForm)
    bbtnOk: TBitBtn;
    bbtnCancel: TBitBtn;
    cbKeepProportions: TCheckBox;
    cbStretch: TCheckBox;
    grpbResize: TGroupBox;
    lblHeight: TLabel;
    lblWidth: TLabel;
    pnlButtons: TPanel;
    spnHeight: TSpinEdit;
    spnWidth: TSpinEdit;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure spnWidthChange(Sender: TObject);
  private

  public
    procedure CheckSettings; //load previous resize options
  end;

var
  frmResize: TfrmResize;

implementation
 uses uglobals;
{$R *.lfm}

 { TfrmResize }

 procedure TfrmResize.CheckSettings;
 begin
  cbStretch.Checked:=INI.ReadBool('RESIZE','STRETCH',False);
  cbKeepProportions.Checked:=INI.ReadBool('RESIZE','KEEP PROPORTIONS',True);
  spnWidth.Value:=FrameGrid.FrameWidth;
  spnHeight.Value:=FrameGrid.FrameHeight;
 end;

procedure TfrmResize.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    INI.WriteBool('RESIZE','STRETCH',cbStretch.Checked);
    INI.WriteBool('RESIZE','KEEP PROPORTIONS',cbKeepProportions.Checked);
end;

procedure TfrmResize.spnWidthChange(Sender: TObject);
var
  k : Double;
begin
 if cbKeepProportions.Checked and TSpinEdit(Sender).Focused then begin
   case TSpinEdit(Sender).Tag of
  1:begin
     k:=TSpinEdit(Sender).Value / FrameGrid.FrameWidth;
     spnHeight.Value:=Round(FrameGrid.FrameHeight*k);
    end;
  2:begin
     k:=TSpinEdit(Sender).Value / FrameGrid.FrameHeight;
     spnWidth.Value:=Round(FrameGrid.FrameWidth*k);
    end;
  end;

 end;
end;

end.

