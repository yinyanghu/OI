program Ural_1083(Input, Output);
type
    TIndex = Longint;
    TData = Longint;
var
    St: string;
    i, N, K, Local: TIndex;
    R: TData;
    Code: Integer;
begin
    Readln(St);
    Local := Pos(' ', St);
    Val(Copy(St, 1, Local - 1), N, Code);
    K := Length(St) - Local;
    R := N;
    if n mod k > 0 then
        for i := 1 to N div K do
            R := R * (N - i * K)
    else
        for i := 1 to N div K - 1 do
            R := R * (N - i * K);
    Writeln(R);
end.

