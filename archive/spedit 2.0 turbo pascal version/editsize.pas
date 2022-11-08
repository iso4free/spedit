{$I global\grad.pas}
{$I menu\sizemenu.pas}

Procedure editsize;
Var
   k    : Byte;
Begin
  SetColor(Black);
  Grad(1,20,141,160,Step);
  SetColor(White);
  SizeMenu;
  MoveBarX(0,1,getmaxx,16,2,k);
  Case k of
  0:begin
    GradSize := 1;
    Step := 14;
    end;
  1:begin
    GradSize := 1;
    Step := 14;
    end;
  2:begin
    GradSize := 2;
    Step := 7;
    end;
  end;       {case}
  Grad(1,20,141,160,Step);       {Вывод pешетки для увеличеного изобpажения}
  SetColor(Black);
  OutTextXY(1,GetMaxY-8,' <Esc> - ГЛ.МЕHЮ');
  SetColor(White);
  OutTextXY(1,GetMaxY-8,' <Esc> - МЕHЮ');
  MainMenu;
End;