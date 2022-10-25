{$I filemenu.inc}
Procedure FileWork;
Var
   c    : Word;
   size : LongInt;
   p    : Pointer;
Begin
      FileMenu;
      Movebarx(0,1,getmaxx-1,16,2,c);
      Case c of
      1:begin
          //DisplayPCX(filename,1);
          SetActivePage(1);
          size := ImageSize(0,0,getmaxx-minex,getmaxy-miney);
          GetMem(p,size);
          GetImage(0,0,getmaxx-minex,getmaxy-miney,p^);
          SetActivePage(0);
          PutImage(minex+1,miney+1,p^,CopyPut);
          FreeMem(p,size);
        end;
      2:begin
          size := ImageSize(minex,miney,getmaxx-1,getmaxy-1);
          GetMem(p,size);
          GetImage(minex,miney,getmaxx-1,getmaxy-1,p);
          SetActivePage(1);
          PutImage(0,0,p,CopyPut);
          FreeMem(p,size);
          //GetPCX(filename,1);
          Saved := True;
          SetActivePage(0);
        end;                                {Case}
       end;
      SetColor(Black);
      OutTextXY(1,GetMaxY-8,' <Esc> - MAIN MENU');
      MainMenu;
End;
