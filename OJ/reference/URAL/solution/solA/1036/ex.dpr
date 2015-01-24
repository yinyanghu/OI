(*
Same to 1044 without HighP
f(i,S)=sum{f(i,S-k)|0<=k<=9}
*)
program Ural_1036(Input, Output);
const
    MaxSum = 1000;
    MaxLen = 100;
type
    TIndex = Longint;
    THP = record
        Len: TIndex;
        D: array[1..MaxLen] of Shortint;
    end;
    TDP = array[0..MaxSum div 2] of THP;
var
    N, S: TIndex;

procedure Add(A, B: THP; var C: THP);
var
    i: TIndex;
    tmp: THP;
begin
    if A.Len = 0 then A.Len := 1;
    if B.Len = 0 then B.Len := 1;
    if A.Len < B.Len then
    begin
        tmp := A;
        A := B;
        B := tmp;
    end;
    FillChar(C, SizeOf(C), 0);
    C.Len := A.Len + 1;
    for i := 1 to A.Len do
        Inc(C.D[i], A.D[i] + B.D[i]);
    for i := 1 to A.Len do
    begin
        Inc(C.D[i + 1], C.D[i] div 10);
        C.D[i] := C.D[i] mod 10;
    end;
    while (C.D[C.Len] = 0) and (C.Len > 1) do
        Dec(C.Len);
end;

procedure Multiply(A, B: THP; var C: THP);
var
    i, j: TIndex;
begin
    if A.Len = 0 then A.Len := 1;
    if B.Len = 0 then B.Len := 1;
    FillChar(C, SizeOf(C), 0);
    for i := 1 to A.Len do
        for j := 1 to B.Len do
        begin
            Inc(C.D[i + j - 1], A.D[i] * B.D[j]);
            Inc(C.D[i + j], C.D[i + j - 1] div 10);
            C.D[i + j - 1] := C.D[i + j - 1] mod 10;
        end;
    C.Len := A.Len + B.Len;
    while (C.Len > 1) and (C.D[C.Len] = 0) do
        Dec(C.Len);
end;

procedure Print(A: THP);
var
    i: TIndex;
begin
    for i := A.Len downto 1 do
        Write(A.D[i]);
    Writeln;
end;

procedure Main;
var
    F1, F2: TDP;
    Sum: THP;
    i, j, k: TIndex;
begin
    FillChar(F1, SizeOf(F1), 0);
    Readln(N, S);
    if Odd(S) then
    begin
        Writeln('0');
        Exit;
    end;
    F1[0].D[1] := 1;
    for i := 1 to N do
    begin
        FillChar(F2, SizeOf(F2), 0);
        for j := 0 to S div 2 do
            for k := 0 to 9 do
                if j - k >= 0 then
                    Add(F2[j], F1[j - k], F2[j]);
        F1 := F2;
    end;
    Multiply(F1[S div 2], F1[S div 2], Sum);
    Print(Sum);
end;
begin
   { Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);  }
    Main;
  {  Close(Input);
    Close(Output);  }
end.

