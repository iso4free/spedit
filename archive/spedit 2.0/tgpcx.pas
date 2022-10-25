unit TGPCX;

interface

uses Dos, Graph, CS_Graph;

procedure DisplayPCX (FileName: PathStr; Page: Byte);
procedure GetPCX (FileName: PathStr; Page: Byte);
procedure SetPalette16;

type
  { PCX Header structure }
  PCXHeader        = record
    Manuf          : byte;                  { Always =10 for Paintbrush   }
    Hard           : byte;                  { Version information         }
    Cod            : byte;                  { Run-length encoding (=1)    }
    BitPrePix      : byte;                  { Bits per pixel              }
    X1             : word;                  { Picture dimensions (incl)   }
    Y1             : word;                  {                             }
    X2             : word;                  {                             }
    Y2             : word;                  {                             }
    HorizRes       : word;                  { Display horiz resolution    }
    VertRes        : word;                  { Display vert  resolution    }
    Pal            : array[0..47] of byte;  { Pallete                     }
    VMode          : byte;                  { (ignored)                   }
    NUmbOFPlan     : byte;                  { Number of planes (ver 2.5=0)}
    BytePerLine    : word;                  { Bytes per line              }
    Col            : word;                  { Palette Info (1=col, 2=gray)}
    ScanHor        : word;                  { Scanner resolution          }
    ScanVer        : word;                  {                             }
    Extra          : array[0..54] of byte;  { Extra space (filler)        }
  end;
  AddrStr = record
    Offs: Word;
    Segm: Word;
  end;
  MB = array [1..128] of Byte;

var
  ReadHeader: PCXHeader;

const
  WriteHeader: PCXHeader =
  (
    Manuf          : 10;                    { Always =10 for Paintbrush   }
    Hard           : 5;                     { Version information         }
    Cod            : 1;                     { Run-length encoding (=1)    }
    BitPrePix      : 1;                     { Bits per pixel              }
    X1             : 0;                     { Picture dimensions (incl)   }
    Y1             : 0;                     {                             }
    X2             : 639;                   {                             }
    Y2             : 349;                   {                             }
    HorizRes       : 640;                   { Display horiz resolution    }
    VertRes        : 350;                   { Display vert  resolution    }
    Pal            :                        { Pallete                     }
    ( 0, 0, 0,
      0, 0, 170,
      0, 170, 0,
      0, 170, 170,
      170, 0, 0,
      170, 0, 170,
      170, 85, 0,
      170, 170, 170,
      85, 85, 85,
      85, 85, 255,
      85, 255, 85,
      85, 255, 255,
      255, 85, 85,
      255, 85, 255,
      255, 255, 85,
      255, 255, 255
    );
    VMode          : 0;                     { (ignored)                   }
    NUmbOFPlan     : 4;                     { Number of planes (ver 2.5=0)}
    BytePerLine    : 80;                    { Bytes per line              }
    Col            : 1;                     { Palette Info (1=col, 2=gray)}
    ScanHor        : 0;                     { Scanner resolution          }
    ScanVer        : 0                      {                             }
  );

  WriteHeader_1: PCXHeader =
  (
    Manuf          : 10;                    { Always =10 for Paintbrush   }
    Hard           : 5;                     { Version information         }
    Cod            : 1;                     { Run-length encoding (=1)    }
    BitPrePix      : 1;                     { Bits per pixel              }
    X1             : 0;                     { Picture dimensions (incl)   }
    Y1             : 0;                     {                             }
    X2             : 639;                   {                             }
    Y2             : 349;                   {                             }
    HorizRes       : 640;                   { Display horiz resolution    }
    VertRes        : 350;                   { Display vert  resolution    }
    Pal            :                        { Pallete                     }
    ( 0, 0, 0,
      0, 0, 170,
      0, 170, 0,
      0, 170, 170,
      170, 0, 0,
      170, 0, 170,
      170, 85, 0,
      170, 170, 170,
      85, 85, 85,
      85, 85, 255,
      85, 255, 85,
      85, 255, 255,
      255, 85, 85,
      255, 85, 255,
      255, 255, 85,
      255, 255, 255
    );
    VMode          : 0;                     { (ignored)                   }
    NUmbOFPlan     : 4;                     { Number of planes (ver 2.5=0)}
    BytePerLine    : 80;                    { Bytes per line              }
    Col            : 1;                     { Palette Info (1=col, 2=gray)}
    ScanHor        : 0;                     { Scanner resolution          }
    ScanVer        : 0                      {                             }
  );

implementation

procedure GetPCX (FileName: PathStr; Page: Byte);
var
  PCXFile: file;
  Body: ^MB;
  BuffSize, ByteCnt: Word;
  GetStr, GetByte: Word;
  Plan, Numb, RealCount: Byte;
  Value, OldVal: Byte;
  DataPS: AddrStr;
  DataP: ^Byte absolute DataPS;
  CarPtrS: AddrStr;
  CarPtr: ^Byte absolute CarPtrS;
  Change: Boolean;
  PgOffs: Word;
  Quit: Boolean;

procedure Wrt;
{ Записывает данные в буфер, а при переполнении его - на диск }
begin
  if (ByteCnt+2 > BuffSize) then
    begin
    BlockWrite (PCXFile, Body^, ByteCnt);
    DataP := Addr (Body^);
    ByteCnt := 0;
    end;
  if (Numb > 1) then
    begin
    DataP^ := $C0+Numb;
    Inc (DataPS.Offs);
    Inc (ByteCnt);
    DataP^ := OldVal;
    Inc (DataPS.Offs);
    Inc (ByteCnt);
    end
  else
    if (OldVal >= $C0) then
      begin
      DataP^ := $C0+Numb;
      Inc (DataPS.Offs);
      Inc (ByteCnt);
      DataP^ := OldVal;
      Inc (DataPS.Offs);
      Inc (ByteCnt);
      end
    else
      begin
      DataP^ := OldVal;
      Inc (DataPS.Offs);
      Inc (ByteCnt);
      end;
  Numb := 0;
end;

procedure Increm;
{ Вычисляет следующий байт в видеоадаптере }
var
  LocPl: Byte;
begin
  Inc (GetByte);
  if (GetByte = WriteHeader.BytePerLine) then
    begin
    GetByte := 0;
    Inc (Plan);
    if (Plan = WriteHeader.NumbOfPlan) then
      begin
      Plan := 0;
      Inc (GetStr);
      CarPtrS.Offs := CarPtrS.Offs + 80;
      if (GetStr = WriteHeader.VertRes) then
        begin
	Wrt;
        BlockWrite (PCXFile, Body^, ByteCnt);
        Close (PCXFile);
        FreeMem (Body, BuffSize);
        Quit := True;
        end;
      end;
    { Процедура, описанная в процедуре конфликтует на ассемблере }
    { c внешней процедурой. Она не видит переменных. Поэтому =>  }
    LocPl := Plan;
    { Устанавливаем плоскость для чтения }
    asm
    mov  al, 4
    mov  dx, 3CEh
    out  dx, al
    mov  al, LocPl
    inc  dx
    out  dx, al
    end;
    end;
end;

begin
  if MaxAvail > $FFFF then BuffSize := $FFFF
  else BuffSize := MaxAvail;
  Assign (PCXFile, FileName);
  ReWrite (PCXFile, 1);
  if IOResult <> 0 then ErrMsg ('Can''t create file :' + FileName);
  BlockWrite (PCXFile, WriteHeader, 128);
  TGetMem (Pointer (Body), BuffSize);
  DataP := Addr (Body^);
  PgOffs := $800*Page;
  CarPtr := Ptr ($A000+PgOffs, 0);
  ByteCnt := 0;
  GetByte := 0;
  Plan := 0;
  GetStr := 0;
  { Открываем 0-плоскость}
  asm
  mov  al, 4
  mov  dx, 3CEh
  out  dx, al
  mov  al, Plan
  inc  dx
  out  dx, al
  end;
  Quit := False;
  Numb := 0;
  while not Quit do
    begin
    { Чтение с экрана }
    asm
    les di, CarPtr
    add di, GetByte
    mov al, byte ptr es:[di]
    mov Value, al
    end;
    { Проверяем - байт встречается впервые? }
    if (Numb=0) then
      begin
      Numb := 1;
      OldVal := Value;
      Increm;
      end
    else
      if (Value=OldVal) then
        if (Numb<63) then
          begin
          Inc (Numb);
          Increm;
          end
	else Wrt
      else Wrt;
    end;
end;

procedure DisplayPCX (FileName: PathStr; Page: Byte);
var
  PCXFile: file;
  Body: ^MB;
  BuffSize, NumRead: Word;
  ByteCnt: Word;
  DispStr, DispByte: Word;
  Plan, Numb, RealCount: Byte;
  Value: Byte;
  DataPS: AddrStr;
  DataP: ^Byte absolute DataPS;
  CarPtrS: AddrStr;
  CarPtr: ^Byte absolute CarPtrS;
  Change: Boolean;
  PgOffs: Word;
begin
  if MaxAvail > $FFFF then BuffSize := $FFFF
  else BuffSize := MaxAvail;
  Assign (PCXFile, FileName);
  Reset (PCXFile, 1);
  if IOResult <> 0 then ErrMsg ('File not found :' + FileName);
  BlockRead (PCXFile, ReadHeader, 128, NumRead);
  SetPalette16;
  TGetMem (Pointer (Body), BuffSize);
  PgOffs := $800*Page;
  CarPtr := Ptr ($A000+PgOffs, 0);

  DispByte := 0;
  Plan := 0;
  DispStr := 0;

  { Открываем 0-плоскость}
  asm
   mov  al, 2
   mov  dx, 3C4h
   out  dx, al
   mov  al, 00000001b
   inc  dx
   out  dx, al
  end;

  while (NumRead<>0) do
    begin
    BlockRead (PCXFile, Body^, BuffSize, NumRead);
    DataP := Addr (Body^);
    ByteCnt := 0;
    while (ByteCnt < NumRead) do
      begin
      if (DataP^ >= $C0) then
        begin
        Numb := DataP^-$C0;
        Inc (DataPS.Offs);
	Inc (ByteCnt);
        if (ByteCnt >= NumRead) then
          begin
          Seek (PCXFile, FilePos (PCXFile)-1);
          Numb := 0;
          end;
        Value := DataP^;
	Inc (DataPS.Offs);
	Inc (ByteCnt);
        end
      else
        begin
        Numb := 1;
        Value := DataP^;
        Inc (DataPS.Offs);
        Inc (ByteCnt);
	end;
      while (Numb>0) do
        begin
        if (DispByte + Numb < ReadHeader.BytePerLine) then
          begin
          RealCount := Numb;
          Numb := 0;
	  Change := False;
	  end
        else
          begin
          RealCount := ReadHeader.BytePerLine - DispByte;
          Numb := Numb - RealCount;
          Change := True;
          end;
        asm
	  les di, CarPtr
          add di, DispByte
          mov cx, 0
          mov cl, RealCount
          mov al, Value
          rep stosb
        end;
	DispByte := DispByte + RealCount;
	if Change then
          begin
          DispByte := 0;
          Inc (Plan);
          if (Plan = ReadHeader.NumbOfPlan) then
            begin
            Plan := 0;
            Inc (DispStr);
	    if (DispStr = ReadHeader.VertRes) then
              begin
              Close (PCXFile);
              FreeMem (Body, BuffSize);
              asm
              mov  al, 2
              mov  dx, 3C4h
	      out  dx, al
	      mov  al, 00001111b
              inc  dx
              out  dx, al
              end;
              Exit;
              end;
            CarPtrS.Offs := CarPtrS.Offs + 80;
            end;
	    { Открываем нужную плоскость }
            asm
            mov  al, 2
            mov  dx, 3C4h
	    out  dx, al
	    mov  cl, Plan
            mov  al, 00000001b
	    shl  al, cl
	    inc  dx
 	    out  dx, al
            end;
            end;
          end;
        end;
    end;
    asm
    mov  al, 2
    mov  dx, 3C4h
    out  dx, al
    mov  al, 00001111b
    inc  dx
    out  dx, al
    end;
Close (PCXFile);
{R:-->моя вставка}
FreeMem (Body, BuffSize);
end;

const
  EGAReg: array [0..15] of Byte =
  (0, 1, 2, 3, 4, 5, 20, 7, 56, 57, 58, 59, 60, 61, 62, 63);

procedure SetPalette16;
var
  i: Byte;
begin
  with ReadHeader do
  for i:=0 to 15 do SetRGBPalette (EGAReg[i],
				   Pal[i*3] shr 2,
				   Pal[i*3+1] shr 2,
				   Pal[i*3+2] shr 2
				   );
end;

end.


