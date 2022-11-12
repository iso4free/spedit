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
  Spin, Buttons, LCLTranslator;

type

  { TfrmFrameDlg }

  TfrmFrameDlg = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    edtFrameName: TEdit;
    frmFrameWidth: TLabel;
    lblFrameHeight: TLabel;
    lblFrameName: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    spnedtHeight: TSpinEdit;
    spnedtWidth: TSpinEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    fExecute: Boolean;

  public
    function Execute() : Boolean;
  end;

var
  frmFrameDlg: TfrmFrameDlg;

implementation

{$R *.lfm}

{ TfrmFrameDlg }

procedure TfrmFrameDlg.BitBtn1Click(Sender: TObject);
begin
  fExecute:=True;
end;

procedure TfrmFrameDlg.BitBtn2Click(Sender: TObject);
begin
  fExecute:=False;
end;

procedure TfrmFrameDlg.FormCreate(Sender: TObject);
begin
  fExecute:=False;
end;

function TfrmFrameDlg.Execute(): Boolean;
begin
  fExecute:=False;
  frmFrameDlg.ShowModal;
end;

end.

