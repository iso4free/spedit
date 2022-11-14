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
    procedure FormCreate(Sender: TObject);

  end;

var
  frmFrameDlg: TfrmFrameDlg;
implementation

{$R *.lfm}

{ TfrmFrameDlg }

procedure TfrmFrameDlg.FormCreate(Sender: TObject);
begin
  ModalResult:=mrNone;
end;


end.

