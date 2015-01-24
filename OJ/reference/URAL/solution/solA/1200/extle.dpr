{$N+}
program Ural_1200(Input, Output);
type
    TIndex = Integer;
    TData = Extended;
var
    tot, K, j, MaxHorn, MaxHoof: TIndex;
    tmp, Max, PriceHorn, PriceHoof: TData;
begin
    Readln(PriceHorn, PriceHoof);
    Readln(K);
    for tot := 1 to K do
        for j := 0 to tot do
        begin
            tmp := j * PriceHorn + (tot - j) * PriceHoof - Sqr(j)
                - Sqr(tot - j);
            if tmp > Max then
            begin
                Max := tmp;
                MaxHorn := j;
                MaxHoof := tot - j;
            end;
        end;
    Writeln(Max: 0: 2);
    Writeln(MaxHorn, ' ', MaxHoof);
end.

