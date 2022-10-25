{       Рисует звёздное небо со stars звёздами          }
{       Звёзды - случайные точки случайным цветом       }
Procedure sky(stars:Integer);
Var
   i : Integer;
Begin
  for i := 0 to stars do putpixel(Random(getmaxx),Random(getmaxy),Random(Getmaxcolor));
End;