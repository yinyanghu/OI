(*
A is for n-digit number a1a2a3..an
S(A+B)=S(A)+S(B) 即保证无进位(carry)
则 B 有 (8-a1)(9-a2)(9-a3)..(9-an) 种  // 8-a1 第1位保证不为0
所以 for n-digit
sum{a1=1->9}(sum{a2=0->9}(sum{a3=0->9}(....sum{an=0->9}((8-a1)(9-a2)(9-a3)..(9-an))....)))
=sum{a1=1->9}((8-a1)*sum{a2=0->9}((9-a2)*sum{a3=0->9}(.....)))//提取公因式
=36*55^(n-1)
*)
program Ural_1206(Input, Output);
const
    MaxLen = 100;
type
    TIndex = Longint;
    TData = record
        Len: TIndex;
        D: array[1..MaxLen] of Integer;
    end;
var
    N: TIndex;
    F: TData;

procedure Multiply(var A: TData; B: TIndex);
var
    i: TIndex;
begin
    for i := 1 to A.Len do
        A.D[i] := A.D[i] * B;
    for i := 1 to A.Len + 2 do
    begin
        Inc(A.D[i + 1], A.D[i] div 10);
        A.D[i] := A.D[i] mod 10;
    end;
    Inc(A.Len, 2);
    while (A.D[A.Len] = 0) and (A.Len > 1) do
        Dec(A.Len);
end;

procedure Main;
var
    i: TIndex;
begin
    FillChar(F, SizeOf(F), 0);
    F.Len := 2;
    F.D[2] := 3;
    F.D[1] := 6;
    Readln(N);
    for i := 2 to N do
        Multiply(F, 55);
    for i := F.Len downto 1 do
        Write(F.D[i]);
    Writeln;
end;
begin
{    Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);        }
    Main;
{    Close(Input);
    Close(Output);   }
end.

