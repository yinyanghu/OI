program Ural_1095(Input, Output);
const
    //P[i]=10^i mod 7, and i=0..5 is repetend
    P: array[0..5] of Byte = (1, 3, 2, 6, 4, 5);
    C: array[0..6] of string[4] = ('3241', '3214', '3124', '2341', '2314',
        '2413', '3142');
    //Num  Mod
    //1234 2, 1243 4, 1324 1, 1342 5, 1423 2, 1432 4, 2134 6, 2143 1, 2314 4,
    //2341 3, 2413 5, 2431 2, 3124 2, 3142 6, 3214 1, 3241 0, 3412 3, 3421 5,
    //4123 0, 4132 2, 4213 6, 4231 3, 4312 0, 4321 2
type
    TIndex = Integer;
    TSet = set of 1..4;
var
    N: TIndex;

procedure Main;
var
    i, M: TIndex;
    St, Stf: string;
    S: TSet;
begin
    Readln(St);
    Stf := '';
    S := [];
    for i := 1 to Length(St) do
        if St[i] in ['0'..'9'] then
            if (St[i] in ['1'..'4']) and not ((Ord(St[i]) - Ord('0')) in S) then
                S := S + [Ord(St[i]) - Ord('0')]
            else if St[i] = '0' then
                Stf := Stf + St[i]
            else
                Stf := St[i] + Stf;
    if S <> [1..4] then
        Writeln('0')
    else
    begin
        if Length(Stf) = 0 then
            Writeln(C[0])
        else
        begin
            M := 0;
            for i := 1 to Length(Stf) do
                M := (M + P[(Length(Stf) - i + 1 + 4 - 1) mod 6]
                    * (Ord(Stf[i]) - Ord('0'))) mod 7;
            M := (7 - M) mod 7;
            if Stf[1] = '0' then
                Writeln(C[0] + Stf)
            else
                Writeln(Stf + C[M]);
        end;
    end;
end;
begin
   { Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output); }
    Readln(N);
    while N > 0 do
    begin
        Dec(N);
        Main;
    end;
   { Close(Input);
    Close(Output); }
end.

