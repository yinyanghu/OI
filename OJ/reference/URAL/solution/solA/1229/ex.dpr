program Ural_1229(Input, Output);
const
    MaxM = 100;
type
    TIndex = Longint;
    TBrickwork = array[1..MaxM] of TIndex;
var
    N, M: TIndex;

    i, j, K: TIndex;
    StL, NdL: TBrickwork;
    //    FirstLine, SecondLine
    AnsStL, AnsNdL: TBrickwork;
    //    Answers FirstLine,Answers SecondLine
begin
    Readln(N, M);
    K := 0;
    for i := 1 to N div 2 do
    begin
        for j := 1 to M do
            Read(StL[j]);
        for j := 1 to M do
            Read(NdL[j]);
        for j := 0 to M div 2 - 1 do
        begin
            if (StL[j * 2 + 1] = StL[j * 2 + 2])
                or (NdL[j * 2 + 1] = NdL[j * 2 + 2]) then
            begin
                Inc(K);
                AnsStL[j * 2 + 1] := K;
                AnsNdL[j * 2 + 1] := K;
                Inc(K);
                AnsStL[j * 2 + 2] := K;
                AnsNdL[j * 2 + 2] := K;
            end
            else if (StL[j * 2 + 1] = NdL[j * 2 + 1])
                or (StL[j * 2 + 2] = NdL[j * 2 + 2]) then
            begin
                Inc(K);
                AnsStL[j * 2 + 1] := K;
                AnsStL[j * 2 + 2] := K;
                Inc(K);
                AnsNdL[j * 2 + 1] := K;
                AnsNdL[j * 2 + 2] := K;
            end
            else
            begin
                Inc(K);
                AnsStL[j * 2 + 1] := K;
                AnsNdL[j * 2 + 1] := K;
                Inc(K);
                AnsStL[j * 2 + 2] := K;
                AnsNdL[j * 2 + 2] := K;
            end;
        end;
        for j := 1 to M do
            Write(AnsStL[j], ' ');
        Writeln;
        for j := 1 to M do
            Write(AnsNdL[j], ' ');
        Writeln;
    end;
end.

