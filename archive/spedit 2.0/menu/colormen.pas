Procedure ColorMenu;
Begin
  SetFillStyle(9,8);
  Bar(1,1,getmaxx-1,16);
  SetTextStyle(0,0,0);
  SetColor(White);
  SetTextJustify(LeftText,TopText);
  SetColor(Black);
  OutTextXY(1,GetMaxY-8,' <Esc> - Œ…Hž');
  SetColor(White);
  OutTextXY(1,GetMaxY-8,' <Esc> - ƒ‹.Œ…Hž');
  Outtextxy(10,5,' ƒ« ¢­ë© æ¢¥â                             ”®­®¢ë© æ¢¥â');
End;
