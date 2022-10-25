{$I menu\colormenu.pas}
{$I global\changeco.pas}
Procedure SetColors;
Var c,cc : Byte;
Begin               {Выбор цветов}
      ColorMenu;        {Меню "Цвет"}
      Movebar(0,1,getmaxx-1,16,2,1,c,cc);
      Case c of
      1:ChangeColor(PrimaryColor);        {Выбоp главного цвета}
      2:ChangeColor(SecondaryColor);      {Выбоp фонового цвета}
      end;                                {Case}
      SetColor(Black);
      OutTextXY(1,GetMaxY-8,' <Esc> - ГЛ.МЕHЮ');
      MainMenu;
end;