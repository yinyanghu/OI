program Ural_1100(Input, Output);
const
    MaxN = 150000;
    MaxProblem = 100;
type
    TIndex = Longint;
    TID = Longint;
    TProblem = Byte;
    TTeamInfo = record ID: TID;
        Problem: TProblem;
    end;
    TTeam = array[1..MaxN] of TTeamInfo;
var
    i, j, N: TIndex;
    M: TProblem;
    ID: TID;
    Team: TTeam;
begin
    FillChar(Team, SizeOf(Team), 0);
    Readln(N);
    for i := 1 to N do
    begin
        Readln(ID, M);
        Team[i].ID := ID;
        Team[i].Problem := M;
    end;
    for i := MaxProblem downto 0 do
        for j := 1 to N do
            if Team[j].Problem = i then
                Writeln(Team[j].ID, ' ', Team[j].Problem);
end.

