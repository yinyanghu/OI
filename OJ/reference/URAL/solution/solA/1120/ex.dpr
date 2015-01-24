{
A + (A + 1) + ... + (A + P - 1)=AP + (1 + P - 1)(P - 1) / 2 = N
=>  2N = 2AP + P^2 - P = P(P + 2A - 1)
}
program Ural_1120(Input, Output);
var
    N, P, T: Int64;
begin
    Readln(N);
    P := Trunc(Sqrt(2 * N)) + 1;
    while P > 0 do
    begin
        if (2 * N) mod P = 0 then
        begin
            T := (2 * N) div P + 1 - P;
            if (T mod 2 = 0) and (T div 2 > 0) then
            begin
                Writeln(T div 2, ' ', P);
                Break;
            end;
        end;
        Dec(P);
    end;
end.

