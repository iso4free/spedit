{$I     grid.inc}
{$I sizemenu.inc}

Procedure editsize;
Var
   k    : Word;
Begin
  SetColor(Black);
  Grid(1,20,141,160,Step);
  SetColor(White);
  SizeMenu;
  MoveBarX(0,1,getmaxx,16,2,k);
  Case k of
  0:begin
    GridSize := 1;
    Step := 14;
    end;
  1:begin
    GridSize := 1;
    Step := 14;
    end;
  2:begin
    GridSize := 2;
    Step := 7;
    end;
  end;       {case}
  Bar(1,20,141,160);            //Clear old grid place
  Grid(1,20,141,160,Step);       {�뢮� p��⪨ ��� 㢥��祭��� ����p������}
  SetColor(Black);
//  OutTextXY(1,GetMaxY-8,' <Esc> - ��.��H�');
//  SetColor(White);
//  OutTextXY(1,GetMaxY-8,' <Esc> - ��H�');
  MainMenu;
End;
