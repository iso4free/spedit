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
{*    Copyright (c) 2000-2023 by Vadim Vitomsky                            *}
{*                                                                         *}
{*    See the file LICENSE, included in this distribution, for details.    *}
{*                                                                         *}
{*    This program is distributed in the hope that it will be useful,      *}
{*    but WITHOUT ANY WARRANTY; without even the implied warranty of       *}
{*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                 *}
{***************************************************************************}
unit ugridoptions;

{$mode ObjFPC}{$H+}

interface

uses
  {$IFDEF DEBUG}LazLoggerBase, {$ENDIF}
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Spin, Buttons;

type

  { TfrmGridOptions }

  TfrmGridOptions = class(TForm)
    bbOk: TBitBtn;
    gbCell: TGroupBox;
    gbOffset: TGroupBox;
    gbGridSize: TGroupBox;
    gbCrop: TGroupBox;
    lblLeft: TLabel;
    lblRight: TLabel;
    lblTop: TLabel;
    lblBottom: TLabel;
    lblCols: TLabel;
    lblRows: TLabel;
    lblY: TLabel;
    lblX: TLabel;
    lblHeight: TLabel;
    lblWidth: TLabel;
    pnlCenetr: TPanel;
    pnlBottom: TPanel;
    spCols: TSpinEdit;
    spLeft: TSpinEdit;
    spRight: TSpinEdit;
    spTop: TSpinEdit;
    spBottom: TSpinEdit;
    spRows: TSpinEdit;
    spWidth: TSpinEdit;
    spHeight: TSpinEdit;
    spX: TSpinEdit;
    spY: TSpinEdit;
    procedure bbOkClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure spLeftChange(Sender: TObject);
    procedure spWidthChange(Sender: TObject);
  private

  public

  end;

var
  frmGridOptions: TfrmGridOptions;

implementation
  uses uspriteimport;
{$R *.frm}

  { TfrmGridOptions }

procedure TfrmGridOptions.bbOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGridOptions.FormDeactivate(Sender: TObject);
begin
  BringToFront;
end;

procedure TfrmGridOptions.spLeftChange(Sender: TObject);
begin
    frmImportSheet.CroppedRect.Left:=spLeft.Value;
    frmImportSheet.CroppedRect.Top :=spTop.Value;
    frmImportSheet.CroppedRect.Right:=frmImportSheet.imgImported.Width-spRight.Value;
    frmImportSheet.CroppedRect.Bottom:=frmImportSheet.imgImported.Height-spBottom.Value;
    if spCols.Value<>0 then
    spWidth.Value:=(frmImportSheet.CroppedRect.Width-spX.Value) div spCols.Value;
    if spRows.Value<>0 then
    spHeight.Value:=(frmImportSheet.CroppedRect.Height-spY.Value) div spRows.Value;
    frmImportSheet.imgImported.Invalidate;
end;

  procedure TfrmGridOptions.spWidthChange(Sender: TObject);
  begin
    case TComponent(Sender).Tag of
    1: begin
     //cell width change
      spCols.Value:=(frmImportSheet.CroppedRect.Width-spX.Value) div spWidth.Value;
    end;
    2: begin
    //cell height change
      spRows.Value:=(frmImportSheet.CroppedRect.Height-spY.Value) div spHeight.Value;
    //rows change
    end;
    5:begin
      spWidth.Value:=(frmImportSheet.CroppedRect.Width-spX.Value) div spCols.Value;
    //rows change
    end;
    6: begin
      spHeight.Value:=(frmImportSheet.CroppedRect.Height-spY.Value) div spRows.Value;
    end;
   end;
   frmImportSheet.imgImported.Invalidate;
  end;

end.

