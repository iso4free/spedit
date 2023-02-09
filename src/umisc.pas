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
unit umisc;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, uglobals, BGRABitmap, BGRAPalette;

type

  { TSPDither }

  TSPDither = class
    private
      fImg : TBGRABitmap;
      fPal : TBGRAPalette;
    public
      constructor Create(srcimg : TBGRABitmap; dstPalette : TPalette);
      destructor Destroy; override;
      procedure Execute;
  end;

  function CalcColorDistance(const Color1, Color2: TBGRAPixel): Integer;

implementation

function CalcColorDistance(const Color1, Color2: TBGRAPixel): Integer;
var
  DistR, DistG, DistB: Integer;
begin
  DistR := Color1.red - Color2.red;
  DistG := Color1.green - Color2.green;
  DistB := Color1.blue - Color2.blue;

  Result := DistR * DistR + DistG * DistG + DistB * DistB;
end;


{ TSPDither }

constructor TSPDither.Create(srcimg: TBGRABitmap; dstPalette: TPalette);
begin

end;

destructor TSPDither.Destroy;
begin
  inherited Destroy;
end;

procedure TSPDither.Execute;
begin

end;

end.

