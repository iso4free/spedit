{       �p�p�ᮢ뢠�� ������� ����      }
Procedure MainMenu;
var stp : Word;
Begin
  SetFillStyle(InterLeaveFill,DarkGray);{������� �񬭮-�p� 梥⮬ ������ �⪮�}
  Bar(1,1,getmaxx-1,16);           {�pאַ㣮�쭨� ��� 䮭� ����}
  SetTextStyle(0,0,0);            {��⠭���� �⠭��p⭮�� ���p�筮�� �p���}
  SetColor(White);                {���� 梥� �㪢}
  SetTextJustify(LeftText,TopText); {�p��離� ����� ���p�}
  Stp := GetMaxX Div 6;
  Outtextxy(10,5,' File');
  OutTextXY(10+Stp,5,' Edit');
  OutTextXY(10+Stp*2,5,' Color');
  OutTextXY(10+Stp*3,5,' Preview');
  OutTextXY(10+Stp*4,5,' Grid Size');
  OutTextXY(10+Stp*5,5,' Exit');
End;
