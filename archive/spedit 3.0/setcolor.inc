{$I colormen.inc}
{$I changeco.inc}
Procedure SetColors;
Var c,cc : Word;
Begin               {�롮� 梥⮢}
      ColorMenu;        {���� "����"}
      Movebar(0,1,getmaxx-1,GetMaxColor+1,2,1,c,cc);
      Case c of
      1:ChangeColor(wORD(PrimColor));        {�롮p �������� 梥�}
      2:ChangeColor(Word(SecColor));      {�롮p 䮭����� 梥�}
      end;                                {Case}
      SetColor(Black);
//      OutTextXY(1,GetMaxY-8,' <Esc> - MAIN MENU');
      MainMenu;
end;
