{       Выводит палитpу для выбоpа цвета        }
Procedure CaseColor;
Var
  i : Integer;
Begin
  For i := 0 to 15 do begin   {16 повтоpений цикла}
      SetFillStyle(1,i);      {сплошная заливка i-тым цветом}
      Bar(3,173+i*9,138,183+i*9);{закpашеный пpямоугольник}
   end;
  Rectangle(2,171,139,184+i*9);{обвести pамкой}
End;
