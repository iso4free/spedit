Procedure view;
Var
   sz : Word;
   p  : Pointer;
Begin
  sz := ImageSize(minex,miney,minex+320,getmaxy-1);
  GetMem(p,sz);
  GetImage(minex,miney,minex+320,getmaxy-1,p^);
  SetActivePage(1);
  PutImage(0,0,p^,CopyPut);
  SetActivePage(0);
  sz := ImageSize(minex+320,miney,minex+320,getmaxy-1);
  GetMem(p,sz);
  GetImage(minex+320,miney,getmaxx-1,getmaxy-1,p^);
  SetActivePage(1);
  PutImage(320,0,p^,CopyPut);
  SetActivePage(0);
  SetVisualPage(1);
  ReadKey;
  SetVisualPage(0);
  FreeMem(p,sz);
End;