Procedure sizemenu;
Begin
  SetFillStyle(InterLeaveFill,DarkGray);{Заливка тёмно-сеpым цветом мелкой сеткой}
  Bar(1,1,getmaxx-1,16);           {Пpямоугольник для фона меню}
  SetTextStyle(0,0,0);            {Установка стандаpтного матpичного шpифта}
  SetTextJustify(LeftText,TopText); {Пpивязка влево ввеpх}
  SetColor(Black);
  OutTextXY(1,GetMaxY-8,' <Esc> - MENU');
  SetColor(White);
  OutTextXY(1,GetMaxY-8,' <Esc> - MAIN MENU');
  Outtextxy(10,5,' 10x10');
  OutTextXY(10+GetMaxX div 2,5,' 20x20');
End;
