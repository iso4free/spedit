{************************************************}
{                                                }
{   Турбо Гамес                                  }
{   Глобальные переменные для TG-файлов          }
{                                                }
{************************************************}

unit TGGlob;

interface

const
  { Страницы }
  ActPg: Integer = 1;
  VisPg: Integer = 0;

  { ViewPort для VPSprite }
  XminSpr: Integer = 0;
  XmaxSpr: Integer = 79;
  YminSpr: Integer = 0;
  YmaxSpr: Integer = 349*80;
  MinSprMap: Byte = 255;
  MaxSprMap: Byte = 255;

  {================================================= ПЕРЕМЕННЫЕ ДЛЯ МЫШКИ }

  { Состояние спрайтовой мышки }
  SprMoOK: Boolean = FALSE;
  SprMoMoves: Boolean = FALSE;

  { ViewPort для SprMo }
  SprMoXmin: Integer = 0;
  SprMoXmax: Integer = 79;
  SprMoYmin: Integer = 0;
  SprMoYmax: Integer = 349*80;
  SprMoMinMap: Byte = 255;
  SprMoMaxMap: Byte = 255;

  { Положение последнего нажатия мышки }
  MoX: Word = 320;
  MoY: Word = 175;

  {================================================= ПЕРЕМЕННЫЕ ДЛЯ ЭКРАНА}
  { Переменная для отсчета времени }
  OScrTime: LongInt = 0;
implementation
end.