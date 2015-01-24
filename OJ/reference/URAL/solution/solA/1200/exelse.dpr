{
AC
}
program Ural_1200(Input, Output);
type
    TIndex = Longint;
    TData = Real;
var
    K, MaxHorn, MaxHoof: TIndex;
    PriceHorn, PriceHoof: TData;

procedure Main;
begin
    Readln(PriceHorn, PriceHoof);
    Readln(K);
    MaxHorn := 0;
    MaxHoof := 0;
    while K > 0 do
    begin
        Dec(K);
        if (PriceHorn - Sqr(MaxHorn + 1) + Sqr(MaxHorn) <= 0) and (PriceHoof - Sqr(MaxHoof + 1) + Sqr(MaxHoof) <= 0) then Break;
        if PriceHorn - Sqr(MaxHorn + 1) + Sqr(MaxHorn) > PriceHoof - Sqr(MaxHoof + 1) + Sqr(MaxHoof) then
            Inc(MaxHorn)
        else
            Inc(MaxHoof);
    end;
    Writeln(Abs(PriceHorn * MaxHorn - Sqr(MaxHorn) + PriceHoof * MaxHoof - Sqr(MaxHoof)): 0: 2);
    Writeln(MaxHorn, ' ', MaxHoof);
end;
begin
     {Assign(Input, 'i.txt');
     Reset(Input);
     Assign(Output, 'o.txt');
     Rewrite(Output);}
    Main;
    {Close(Input);
    Close(Output);}
end.

