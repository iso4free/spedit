Procedure ColorMenu;
Begin
  SetFillStyle(9,8);
  Bar(1,1,getmaxx-1,16);
  SetTextStyle(0,0,0);
  SetColor(White);
  SetTextJustify(LeftText,TopText);
  SetColor(Black);
  OutTextXY(1,GetMaxY-8,' <Esc> - MENU');
  SetColor(White);
  OutTextXY(1,GetMaxY-8,' <Esc> - MAIN MENU');
  Outtextxy(10,5,' Main color');
  OutTextXY(10+GetMaxX div 2,5,' Background color');
End;
