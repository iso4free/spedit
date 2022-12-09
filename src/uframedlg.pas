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
unit uframedlg;

{$mode ObjFPC}{$H+}

interface

uses
  LResources, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Spin, Buttons;

type

  { TfrmFrameDlg }

  TfrmFrameDlg = class(TForm)
  private
    FisOk: Boolean;
    procedure SetisOk(AValue: Boolean);
  published
    BitBtnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    CheckBox1: TCheckBox;
    edtFrameName: TEdit;
    frmFrameWidth: TLabel;
    lblFrameHeight: TLabel;
    lblFrameName: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    spnedtHeight: TSpinEdit;
    spnedtWidth: TSpinEdit;
    procedure BitBtnOkClick(Sender: TObject);
    property isOk : Boolean read FisOk write SetisOk;
  end;

var
  frmFrameDlg: TfrmFrameDlg;
implementation

{$R *.lfm}

{ TfrmFrameDlg }

procedure TfrmFrameDlg.SetisOk(AValue: Boolean);
begin
  if FisOk=AValue then Exit;
  FisOk:=AValue;
end;

procedure TfrmFrameDlg.BitBtnOkClick(Sender: TObject);
begin
  isOk:=True;
  Close;
end;

end.

