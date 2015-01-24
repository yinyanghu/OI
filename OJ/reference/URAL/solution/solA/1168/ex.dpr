{$N+}
program Ural_1168(Input, Output);
const
    MaxM = 50;
    MaxN = 50;
    MaxK = 1000;
    MaxHigh = 32000;
type
    TIndex = Longint;
    TData = Real;
    THigh = array[1..MaxM, 1..MaxN] of TIndex;
    TRadios = array[1..MaxK] of record
        X, Y: TIndex;
        R: TData;
    end;
var
    H: THigh;
    D: TRadios;
    N, M, K: TIndex;
    Count: TIndex;

procedure Main;
var
    i, j, l: TIndex;
    Low, High: TIndex;
    Can: Boolean;
    T: TData;
begin
    Readln(M, N, K);
    for i := 1 to M do
    begin
        for j := 1 to N do
            Read(H[i, j]);
        Readln;
    end;
    for i := 1 to K do
    begin
        Readln(D[i].X, D[i].Y, D[i].R);
        H[D[i].X, D[i].Y] := -H[D[i].X, D[i].Y] - 1;
    end;
    Count := 0;
    for i := 1 to M do
        for j := 1 to N do
            if H[i, j] >= 0 then
            begin
                Can := true;
                Low := H[i, j];
                High := MaxHigh;
                for l := 1 to K do
                begin
                    T := Sqr(D[l].R) - Sqr(D[l].X - i) - Sqr(D[l].Y - j);
                    if T < 0 then
                    begin
                        Can := false;
                        Break;
                    end;
                    if - H[D[l].X, D[l].Y] - 1 + Trunc(-Sqrt(T)) > Low then
                        Low := -H[D[l].X, D[l].Y] - 1 + Trunc(-Sqrt(T));
                    if - H[D[l].X, D[l].Y] - 1 + Trunc(Sqrt(T)) < High then
                        High := -H[D[l].X, D[l].Y] - 1 + Trunc(Sqrt(T));
                end;
                if Low > High then Can := false;
                if Can then
                Inc(Count, High - Low + 1);
            end;
    Writeln(Count);
end;
begin
 {   Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);  }
    Main;
  {  Close(Input);
    Close(Output);    }
end.

