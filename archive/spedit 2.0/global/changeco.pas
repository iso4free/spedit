Procedure ChangeColor(Var color:Byte);
Begin
  SetColor(Yellow);
  MoveBarY(2,172,139,318,16,color);
  color := color-1;
  SetColor(White);
End;
