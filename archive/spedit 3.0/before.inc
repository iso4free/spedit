Procedure Before;
{$I sky.inc}
var cnt : Integer;
Begin
  Sky(5000);
  SetTextStyle(5,0,9);
  SetTextJustify(CenterText,CenterText);
  SetColor(Yellow);
  OutTextXY(GetMaxX div 2,(GetMaxY div 3)-10,'Sprite Editor');
  SetTextStyle(3,0,2);
  SetColor(Green);
  OutTextXY(GetMaxX div 2,(GetMaxY div 2)+10,'Version 3.0');
  SetTextStyle(1,0,2);
  SetColor(Cyan);
  OutTextXY(GetMaxX div 2,GetMaxY-50,'Copyright (c) by CyberSoft, 2004');
  SetColor(Red);
  OutTextXY(GetMaxX div 2,GetMaxY-25,'ALL RIGHTS RESERVED!!!');
  SetTextStyle(7,0,4);
  cnt := 0;
  REPEAT
  SetColor(LightRed);
  OutTextXY(GetMaxX div 2,GetMaxY-130,'PRESS ANY KEY');
  Delay(250);
  SetColor(0);
  OutTextXY(GetMaxX div 2,GetMaxY-130,'PRESS ANY KEY');
  Delay(250);
  cnt :=cnt+5000;
  until  (cnt <> 20000);
End;
