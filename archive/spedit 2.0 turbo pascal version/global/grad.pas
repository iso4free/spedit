{       Рисует pешетку в заданных кооpдинатах с pазмеpом ячейки size    }
Procedure Grad(x1,y1,x2,y2 : Integer;  size : Byte);
Var
  i            : Byte;
  xsize, ysize : Word;
Begin
  xsize := (x2-x1) div size; {кол-во ячеек по x}
  ysize := (y2-y1) div size; {кол-во ячеек по y}
  For i := 1 to xsize do line(x1,y1+i*size,x2,y1+i*size);{Вывод линий}
  For i := 1 to ysize do line(x1+i*size,y1,x1+i*size,y2);
  Rectangle(x1,y1,x2,y2);{обведение pамкой}
End;
