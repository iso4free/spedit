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

unit uspriteimport;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}

interface

uses
  {$IFDEF DEBUG}LazLoggerBase, {$ENDIF}
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ExtDlgs, Buttons, fgl;

type

  { TfrmImportSheet }

  TSelectionData = class
   private
    fIndex : Integer;
    fRect : TRect;
   public
    property Index : Integer read fIndex write fIndex;
    property Rect : TRect read fRect write fRect;
  end;

  TSelectionList = specialize TFPGObjectList <TSelectionData>;

  TfrmImportSheet = class(TForm)
    BitBtn1: TBitBtn;
    chgrpSelections: TGroupBox;
    imgImported: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    pnlSheet: TPanel;
    pnlLeft: TPanel;
    pnlBottom: TPanel;
    pnlTop: TPanel;
    ScrollBox1: TScrollBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of string);
    procedure imgImportedMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FSelectionsList: TSelectionList;
    procedure LoadSpriteSheet(aFile : TFilename);
  public
    property SelectionsList : TSelectionList read FSelectionsList; //here will be all selected rects
  end;

var
  frmImportSheet: TfrmImportSheet;

implementation

 uses uglobals, umain;
{$R *.lfm}

{ TfrmImportSheet }

procedure TfrmImportSheet.FormCreate(Sender: TObject);
begin
  FSelectionsList:=TSelectionList.Create;
end;

procedure TfrmImportSheet.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FSelectionsList);
end;

procedure TfrmImportSheet.FormDropFiles(Sender: TObject;
  const FileNames: array of string);
begin
  //todo: check file extension (load supported images only) load dropped image
  LoadSpritesheet(FileNames[0]);
end;

procedure TfrmImportSheet.imgImportedMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TfrmImportSheet.LoadSpriteSheet(aFile: TFilename);
var
  ext : String;
begin
  ext:=LowerCase(ExtractFileExt(aFile));
  if ExtensionSupported(ext) then imgImported.Picture.LoadFromFile(aFile);
end;

end.

