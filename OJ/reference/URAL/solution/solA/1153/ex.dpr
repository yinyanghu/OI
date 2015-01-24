program Ural_1153(Input, Output);
const
    MaxN = 650;
type
    TIndex = Longint;

    THP = record
        Len: TIndex;
        D: array[1..MaxN] of TIndex;
    end;
    THPPtr = ^THP;

function Compare(A, B: THPPtr; Based: TIndex): TIndex;
var
    i: TIndex;
begin
    Result := A^.Len - B^.Len;
    if Result <> 0 then Exit;
    i := A^.Len;
    while (A^.D[i] = B^.D[i]) and (i > Based) do
        Dec(i);
    Result := A^.D[i] - B^.D[i];
end;

procedure Multiply2(A: THPPtr; Based: TIndex);
var
    i: TIndex;
begin
    for i := Based to A^.Len do
        A^.D[i] := A^.D[i] * 2;
    for i := Based to A^.Len do
    begin
        Inc(A^.D[i + 1], A^.D[i] div 10);
        A^.D[i] := A^.D[i] mod 10;
    end;
    Inc(A^.Len);
    while (A^.D[A^.Len] = 0) and (A^.Len > Based) do
        Dec(A^.Len);
end;

procedure Add(A: THPPtr; BasedA: TIndex; B: THPPtr; BasedB: TIndex; Affix: TIndex);
var
    i, Len: TIndex;
begin
    Inc(A^.D[BasedA], Affix);
    Len := B^.Len - BasedB + 1;
    if A^.Len - BasedA + 1 > Len then Len := A^.Len - BasedA + 1;
    for i := 1 to Len do
    begin
        Inc(A^.D[BasedA + i - 1], B^.D[BasedB + i - 1]);
        Inc(A^.D[BasedA + i], A^.D[BasedA + i - 1] div 10);
        A^.D[BasedA + i - 1] := A^.D[BasedA + i - 1] mod 10;
    end;
    A^.Len := BasedA + Len;
    while (A^.D[A^.Len] = 0) and (A^.Len > BasedA) do
        Dec(A^.Len);
end;

procedure Main;
var
    T, X, S, Q: THP;
    R: THP;
    i, j, k: TIndex;
    Ch: Char;
begin
    FillChar(X, SizeOf(X), 0);
    FillChar(R, SizeOf(R), 0);
    FillChar(S, SizeOf(S), 0);
    T.Len := 0;
    while not Eoln do
    begin
        Inc(T.Len);
        Read(Ch);
        T.D[T.Len] := Ord(Ch) - Ord('0');
    end;
    Readln;
    for i := 1 to T.Len do
        S.D[T.Len - i + 1] := T.D[i];
    S.Len := T.Len;
    Multiply2(@S, 1);
    R.Len := S.Len div 2 + Ord(S.Len mod 2 > 0);
    X.Len := R.Len * 2 - 1;
    for i := R.Len downto 1 do
    begin
        T := X;
        R.D[i] := 0;
        Q := R;
        Multiply2(@Q, i);
        k := 0;
        for j := 0 to 9 do
        begin
            if Compare(@T, @S, i * 2 - 1) > 0 then Break;
            X := T;
            k := j;
            Add(@T, i * 2 - 1, @Q, i, 1 + j * 2);
        end;
        R.D[i] := k;
        Write(k);
    end;
    Writeln;
end;
begin
    {
    Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);
    }
    Main;
    {
    Close(Input);
    Close(Output);
    }
end.

