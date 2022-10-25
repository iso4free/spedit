//**********************************************************************
//*    This file is part of GameOver 2D Game Library                   *
//*    Copyright (c) 2004 by ViruZ                                     *
//*                                                                    *
//*    Sprite Editor 3.0                                               *
//*                                                                    *
//*    See the file COPYING.FPC, included in this distribution,        *
//*    for details about the copyright.                                *
//*                                                                    *
//*    This program is distributed in the hope that it will be useful, *
//*    but WITHOUT ANY WARRANTY; without even the implied warranty of  *
//*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.            *
//*                                                                    *
//**********************************************************************

program Spedit3;

uses Graph,
{$ifdef win32}
WINCRT,WinMouse;
{$else}
CRT,MSMouse;
{$endif}


type    TSprite10=array[0..9,0..9] of Word;
TSprite20=array[0..19,0..19] of Word;

var     PrimColor,                      //Main color
SecColor        : Integer;      //Background color

Step            : Byte;         //Grid step
GridSize        : Word;         //10x10 or 20x20

MineX,
MineY           : Word;         //Main window upper left coord's

Tile1           : TSprite10;
Tile2           : TSprite20;

Saved           : Boolean;


{$I grmode.inc}
{$I before.inc}
{$I   Init.inc}
{$I    run.inc}

BEGIN
if MouseFound then begin
GrMode;
Before;
Init;
Repeat
Run;
until false;
end;
Writeln('Can''t find mouse. Press any key...');
Halt(3);
End.

[Project]
FileName=E:\Install\Work\PROJECTS\SPEDIT3\spedit3.dp
Icon=
Name=spedit3
CompilerOptions=
IncludeDirs=
ObjFile=
ResFiles=
NoConsole=0
IsDll=0
