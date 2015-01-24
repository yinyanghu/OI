program Ural_1183(Input, Output);
const
    MaxN = 100;
type
    TIndex = Longint;
    TDp = array[1..MaxN + 1, 0..MaxN] of TIndex;
    TPath = array[1..MaxN + 1, 0..MaxN] of TIndex;
    TString = array[1..MaxN + 1, 0..MaxN] of string;
var
    N: TIndex;
    D: string;
    F: TDp;
    P: TPath;

function Opp(Ch: Char): Char;
begin
    case Ch of
        '(': Opp := ')';
        '[': Opp := ']';
        ')': Opp := '(';
        ']': Opp := '[';
        else
            Opp := #0;
    end;
end;

procedure Print(i, j: TIndex);
var
    k: TIndex;
begin
    if j = 0 then Exit;
    if (D[i] = '(') or (D[i] = '[') then
    begin
        if P[i, j] > 0 then
        begin
            k := P[i, j];
            Write(D[i]);
            Print(i + 1, k - 2);
            Write(D[i + k - 1]);
            Print(i + k, j - k);
        end
        else if P[i, j] < 0 then
        begin
            k := -P[i, j];
            Write(D[i]);
            Print(i + 1, k - 1);
            Write(Opp(D[i]));
            Print(i + k, j - k);
        end;
    end
    else
    begin
        Write(Opp(D[i]) + D[i]);
        Print(i + 1, j - 1);
    end;
end;

procedure Main;
var
    i, j, k, t: TIndex;
    Min: TIndex;
begin
    FillChar(F, SizeOf(F), 0);
    FillChar(P, SizeOf(P), 0);
    Readln(D);
    N := Length(D);
    for i := N downto 1 do
        for j := 1 to N - i + 1 do
            if (D[i] = '(') or (D[i] = '[') then
            begin
                Min := MaxLongint;
                t := 0;
                for k := 2 to j do
                    if D[i + k - 1] = Opp(D[i]) then
                        if Min > F[i + 1, k - 2] + F[i + k, j - k] + 2 then
                        begin
                            Min := F[i + 1, k - 2] + F[i + k, j - k] + 2;
                            t := k;
                            // D[i] + P[i + 1, k - 2] + D[i + k - 1] + P[i + k, j - k]
                        end;
                for k := 1 to j do
                    if Min > F[i + 1, k - 1] + F[i + k, j - k] + 2 then
                    begin
                        Min := F[i + 1, k - 1] + F[i + k, j - k] + 2;
                        t := -k;
                        //D[i] + P[i + 1, k - 1] + Opp(D[i]) + P[i + k, j - k]
                    end;
                F[i, j] := Min;
                P[i, j] := t;
            end
            else
            begin
                F[i, j] := 2 + F[i + 1, j - 1];
                //Opp(D[i]) + D[i] + P[i + 1, j - 1]
            end;
    Print(1, N);
    Writeln;
end;
begin
    {   Assign(Input, 'i.txt');
       Reset(Input);
       Assign(Output, 'o.txt');
       Rewrite(Output);  }
    Main;
    { Close(Input);
     Close(Output);   }
end.

