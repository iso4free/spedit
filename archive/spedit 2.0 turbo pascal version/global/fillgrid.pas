Procedure FillGrid;
Var
   i,j : Byte;
Begin
  Case GradSize of
   1:begin
     For i := 0 to 9 do
      For j := 0 to 9 do begin
          SetFillStyle(solidfill,Tile1[i,j]);
          Bar(1+14*i+3,20+14*j+2,1+14*(i+1)-1,20+14*(j+1)-1);
      end;
    end;
   2:begin
     For i := 0 to 19 do
      For j := 0 to 19 do begin
          SetFillStyle(solidfill,Tile2[i,j]);
          Bar(1+7*i+3,20+7*j+2,1+7*(i+1)-1,20+7*(j+1)-1);
      end;
    end;
   end;
End;

Procedure ClearGrid;
Var
   i,j : Byte;
Begin
  SetFillStyle(solidfill,0);
  Case GradSize of
   1:begin
     For i := 0 to 9 do
      For j := 0 to 9 do
          Bar(1+14*i+3,20+14*j+2,1+14*(i+1)-1,20+14*(j+1)-1);
     end;
   2:begin
     For i := 0 to 19 do
      For j := 0 to 19 do
          Bar(1+7*i+3,20+7*j+2,1+7*(i+1)-1,20+7*(j+1)-1);
     end;
   end;
End;