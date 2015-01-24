program Ural_1002(Input, Output);
const
    MaxLen = 100;
    MaxN = 50000;
    WordToCode: array['a'..'z'] of Char = ('2', '2', '2', '3', '3', '3', '4'
        , '4', '1', '1', '5', '5', '6', '6', '0', '7', '0', '7', '7', '8', '8'
        , '8', '9', '9', '9', '0');
type
    TIndex = Longint;
    TDp = array[0..MaxLen] of TIndex;
    TPath = array[0..MaxLen] of TIndex;
    TLast = array[0..MaxN] of TIndex;
    TDictionary = array[1..524288] of Char; // 300*1024<524288=2^19
var
    N, M: TIndex;
    MS: string;
    F: TDp;
    P: TPath;
    L: TLast;
    D: TDictionary;

procedure Main;
var
    i, j, k, t: TIndex;
    St: string;
    Min: TIndex;
    MinInd: TIndex;
    Valid: Boolean;
begin
    while true do
    begin
        Readln(St);
        if St = '-1' then Break;
        M := Length(St);
        MS := St;
        FillChar(F, SizeOf(F), 0);
        FillChar(P, SizeOf(P), 0);
        FillChar(L, SizeOf(L), 0);
        FillChar(D, SizeOf(D), 0);
        Readln(N);
        for i := 1 to N do
        begin
            Readln(St);
            L[i] := L[i - 1] + Length(St);
            Move(St[1], D[L[i - 1] + 1], Length(St));
        end;
        for i := 1 to M do
        begin
            Min := MaxLongint;
            MinInd := 0;
            for j := 1 to N do
            begin
                t := i - (L[j] - L[j - 1]);
                if (t >= 0) then
                begin
                    if (t > 0) and (F[t] = 0) then Continue;
                    Valid := true;
                    for k := L[j - 1] + 1 to L[j] do
                        if WordToCode[D[k]] <> MS[t + k - L[j - 1]] then
                        begin
                            Valid := false;
                            Break;
                        end;
                    if (Valid) and (F[t] < Min) then
                    begin
                        Min := F[t];
                        MinInd := j;
                    end;
                end;
            end;
            //            F[i] := 0;
            //            P[i] := 0;
            if MinInd <> 0 then
            begin
                F[i] := Min + 1;
                P[i] := MinInd;
            end
        end;
        if F[M] = 0 then
            Writeln('No solution.')
        else
        begin
            i := M;
            MS := '';
            while P[i] <> 0 do
            begin
                St := '';
                for j := L[P[i] - 1] + 1 to L[P[i]] do
                    St := St + D[j];
                MS := St + MS;
                i := i - (L[P[i]] - L[P[i] - 1]);
                if P[i] > 0 then MS := ' ' + MS;
            end;
            Writeln(MS);
        end;
    end;
end;
begin
    {    Assign(Input, 'i.txt');
        Reset(Input);
        Assign(Output, 'o.txt');
        Rewrite(Output);}
    Main;
    {    Close(Input);
        Close(Output);    }
end.

