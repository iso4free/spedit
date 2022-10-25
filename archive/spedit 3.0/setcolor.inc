{$I colormen.inc}
{$I changeco.inc}
Procedure SetColors;
Var c,cc : Word;
Begin               {Выбор цветов}
      ColorMenu;        {Меню "Цвет"}
      Movebar(0,1,getmaxx-1,GetMaxColor+1,2,1,c,cc);
      Case c of
      1:ChangeColor(wORD(PrimColor));        {Выбоp главного цвета}
      2:ChangeColor(Word(SecColor));      {Выбоp фонового цвета}
      end;                                {Case}
      SetColor(Black);
//      OutTextXY(1,GetMaxY-8,' <Esc> - MAIN MENU');
      MainMenu;
end;
