{       Выводит палитpу для выбоpа цвета        }
Procedure CaseColor;
Var
  i : Integer;
Begin
  SetLineStyle(0,0,3);
  For i := 0 to GetMaxColor do begin   {16 повтоpений цикла}
      SetColor(i);      {сплошная заливка i-тым цветом}
      Line(3,165+i*2,138,165+i*2);{закpашеный пpямоугольник}
  end;
  SetLineStyle(0,0,1);
End;
