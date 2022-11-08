unit CS_graph;

interface

uses Crt, Graph;

const
  { Страницы }
  ActPg: Integer = 1;
  VisPg: Integer = 0;

  { ViewPort для VPSprite
  XminSpr: Integer = 0;
  XmaxSpr: Integer = 79;
  YminSpr: Integer = 0;
  YmaxSpr: Integer = 349*80;
  MinSprMap: Byte = 255;
  MaxSprMap: Byte = 255;

  {Гpафические pежимы}
  VGA_320x200x256: Word = $0013;
  VGA_640x480x16 : Word = $0012;
  VGA_640x350x16 : Word = $0011;
  VGA_640x200x16 : Word = $0010;
  STDMode        : Word = $0012;


procedure SetMode(ModeName : Word); {Установка гpафического pежима}
Procedure SetPalette;               {Установка палитpы}
procedure SwitchPg;
procedure ListPg;
procedure MovePg (SourPg, DestPg: Word);
procedure TGetMem (var P: Pointer; Size: LongInt);
procedure ErrMsg (Msg: String);
procedure FastGetImage (X1, Y1, X2, Y2: Integer; Buff: Pointer);
procedure FastPutImage (X1, Y1: Integer; Buff: Pointer);
function  FastImageSize (X1, Y1, X2, Y2: Integer): LongInt;
procedure Sync;      {Пpовеpка обpатного хода луча}

implementation

Procedure SetMode(ModeName : Word); assembler;
asm
  mov ax, ModeName
  int 10h
end;

Procedure SetPalette; assembler;
Label TheLoop;
asm
     cli
     mov cx,60
TheLoop:
     mov dx,3c8h
     mov al,cl
     out dx,al
     inc dx
     mov al,cl
     out dx,al
     sub al,al
     out dx,al
     out dx,al
     inc cx
     cmp cx,64h
     jne TheLoop
     sti
End;


procedure Sync; assembler;
asm
  mov  dx, 3DAh
@@Wait:
  in   al, dx
  test al, 08h
  jz @@Wait
end;

procedure SwitchPg;
begin
  if (ActPg=1) then begin
    ActPg := 0;
    VisPg := 1;
  end
  else begin
    ActPg := 1;
    VisPg := 0;
  end;
  SetVisualPage (VisPg);
  SetActivePage (ActPg);
end;

procedure ListPg;
begin
  MovePg (ActPg, VisPg);
end;

procedure MovePg (SourPg, DestPg: Word); assembler;
  asm
    push ds
    mov  ax, DestPg
    mov  bx, 800h
    mul  bx
    add  ax, 0A000h
    mov  es, ax
    mov  di, 0
    mov  ax, SourPg
    mov  bx, 800h
    mul  bx
    add  ax, 0A000h
    mov  ds, ax
    mov  si, 0

    { Открываем все карты }
    mov  al, 2
    mov  dx, 3C4h
    out  dx, al
    mov  al, 0FFh
    inc  dx
    out  dx, al

    { режим 1 }
    mov  al, 5
    mov  dx, 3CEh
    out  dx, al
    mov  al, 1
    inc  dx
    out  dx, al


    mov  cx, 28000
    rep movsb

    { режим 0 }
    mov  al, 5
    mov  dx, 3CEh
    out  dx, al
    mov  al, 0
    inc  dx
    out  dx, al
    pop  ds
  end;

procedure TGetMem (var P: Pointer; Size: LongInt);
begin
  if GetFreeSpase(0) < Size then begin
    CloseGraph;
    ErrMsg ('Not enough memory.');
    Halt (1);
  end;
  P := GlobalAllocPtr (0, Size);
end;

procedure ErrMsg (Msg: String);
begin
  CloseGraph;
  WriteLn (Msg);
  Halt (1);
end;

procedure FastGetImage (X1, Y1, X2, Y2: Integer; Buff: Pointer);
type
  AddrStr = record
    Offs: Word;
    Segm: Word;
  end;
var
  N, M: Word;
  ForDS: Word;
  Shift: Word;
  DataP: AddrStr absolute Buff;
  DataPW: ^Word absolute Buff;
begin
  N := ((X2 SHR 3)-(X1 SHR 3))+1;
  M := Y2-Y1+1;
  DataPW^ := N;
  Inc (DataP.Offs);
  Inc (DataP.Offs);
  DataPW^ := M;
  if (M=0) or (N=0) then Exit;
  Inc (DataP.Offs);
  Inc (DataP.Offs);
  Shift := Y1*80+(X1 SHR 3);
  asm
    mov  ForDS, ds
    mov  ax, ActPg
    mov  dx, 800h
    mul  dx
    add  ax, 0A000h
    mov  ds, ax
    mov  es, word ptr ss:Buff [2]
    mov  di, word ptr ss:Buff

    { открываем все биты }
    mov  al, 8
    mov  dx, 3CEh
    out  dx, al
    mov  al, 0FFh
    inc  dx
    out  dx, al
    { открывем все карты }
    mov  al, 2
    mov  dx, 3C4h
    out  dx, al
    mov  al, 0FFh
    inc  dx
    out  dx, al

    mov  bx, 0
@@NxtPln:
    mov  si, Shift
    { открывем карту }
    mov  al, 4
    mov  dx, 3CEh
    out  dx, al
    mov  al, bl
    inc  dx
    out  dx, al

    mov  dx, M
@@NxtStr:
    mov  cx, N

    rep  movsb
    add  si, 80
    sub  si, N

    dec  dx
    cmp  dx, 0
    jge  @@NxtStr

    inc  bx
    cmp  bx, 3
    jle  @@NxtPln

    { открывем все карты }
    mov  al, 2
    mov  dx, 3C4h
    out  dx, al
    mov  al, 0FFh
    inc  dx
    out  dx, al
    mov  ds, ForDS
  end;
end;

procedure FastPutImage (X1, Y1: Integer; Buff: Pointer);
type
  AddrStr = record
    Offs: Word;
    Segm: Word;
  end;
var
  N, M: Word;
  ForDS: Word;
  Shift: Word;
  DataP: AddrStr absolute Buff;
  DataPW: ^Word absolute Buff;
begin
  N := DataPW^;
  Inc (DataP.Offs);
  Inc (DataP.Offs);
  M := DataPW^;
  if (M=0) or (N=0) then Exit;
  Inc (DataP.Offs);
  Inc (DataP.Offs);
  Shift := Y1*80+(X1 SHR 3);
  asm
    mov  ForDS, ds
    mov  ax, ActPg
    mov  dx, 800h
    mul  dx
    add  ax, 0A000h
    mov  es, ax
    mov  ds, word ptr ss:Buff [2]
    mov  si, word ptr ss:Buff

    { открываем все биты }
    mov  al, 8
    mov  dx, 3CEh
    out  dx, al
    mov  al, 0FFh
    inc  dx
    out  dx, al
    { открывем все карты }
    mov  al, 2
    mov  dx, 3C4h
    out  dx, al
    mov  al, 0FFh
    inc  dx
    out  dx, al

    mov  bx, 0
@@NxtPln:
    mov  di, Shift

    { открывем карту BL }
    mov  al, 2
    mov  dx, 3C4h
    out  dx, al
    mov  cl, bl
    mov  al, 00000001b
    shl  al, cl
    inc  dx
    out  dx, al

    mov  dx, M
@@NxtStr:
    mov  cx, N

    rep  movsb
    add  di, 80
    sub  di, N

    dec  dx
    cmp  dx, 0
    jge  @@NxtStr

    inc  bx
    cmp  bx, 3
    jle  @@NxtPln

    { открывем карты }
    mov  al, 2
    mov  dx, 3C4h
    out  dx, al
    mov  al, 0FFh
    inc  dx
    out  dx,al
    mov  ds, ForDS
  end;
end;

function FastImageSize (X1, Y1, X2, Y2: Integer): LongInt;
var
  N, M: Word;
  L: LongInt;
begin
  N := ((X2 SHR 3)-(X1 SHR 3))+1;
  M := Y2-Y1+2;
  L := N*M*4+4;
  FastImageSize := L;
end;

end.