Procedure ChangeColor(Var color:Word);
Begin
  SetColor(Yellow);
  MoveBarY(2,172,139,318,GetMaxColor,color);
  color := color-1;
  SetColor(White);
End;
