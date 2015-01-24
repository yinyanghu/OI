program Ural_1087(Input, Output);
const
    MaxN = 10000;
    MaxM = 50;
type
    TIndex = Integer;
    TData = array[1..MaxM] of TIndex;
    TDp = array[0..MaxN] of Boolean;
var
    N, M: TIndex;
    K: TData;
    F: TDp;

procedure Main;
var
    i, j: TIndex;
begin
    FillChar(F, SizeOf(F), false);
    F[0] := true; //when N=0 is win!!! 
    Readln(N, M);
    for i := 1 to M do
        Read(K[i]);
    for i := 1 to N do
        for j := 1 to M do
            if i - K[j] >= 0 then
                if not F[i - K[j]] then
                begin
                    F[i] := true;
                    Break;
                end;
    Writeln(Ord(not F[N]) + 1);
end;
begin
    {  Assign(Input, 'i.txt');
      Reset(Input);
      Assign(Output, 'o.txt');
      Rewrite(Output); }
    Main;
    { Close(Input);
      Close(Output);    }
end.

