program Ural_1208(Input, Output);
const
    MaxN = 18;
type
    TIndex = Longint;
    TChosePersons = set of 1..MaxN * 3;
    TTeamPersonID = array[1..3] of Byte;
    TTeamPersonIDs = array[1..MaxN] of TTeamPersonID;
    TOpenListPersonName = array[1..MaxN * 3] of string;
var
    TeamPersonIDs: TTeamPersonIDs;
    ChosePersons: TChosePersons;
    OpenPersonName: TOpenListPersonName;
    N, Max, OpenPtr: TIndex;

procedure Search(Depth, Num: TIndex);
var
    i: TIndex;
    Existed: Boolean;
begin
    if Num + N - Depth < Max then
        Exit;
    if Depth = N + 1 then
    begin
        if Num > Max then
            Max := Num;
        Exit;
    end;
    Search(Depth + 1, Num);
    Existed := false;
    for i := 1 to 3 do
        if TeamPersonIDs[Depth][i] in ChosePersons then
            Existed := true;
    if not Existed then
    begin
        for i := 1 to 3 do
            ChosePersons := ChosePersons + [TeamPersonIDs[Depth][i]];
        Search(Depth + 1, Num + 1);
        for i := 1 to 3 do
            ChosePersons := ChosePersons - [TeamPersonIDs[Depth][i]];
    end;
end;

procedure Init;
var
    i, j, k, p: TIndex;
    PSt, St: string;
    Existed: Boolean;
begin
    Readln(N);
    for i := 1 to N do
    begin
        Readln(PSt);
        PSt := PSt + ' ';
        St := '';
        j := 0;
        for p := 1 to Length(PSt) do
        begin
            if PSt[p] in ['A'..'Z', 'a'..'z'] then
                St := St + PSt[p]
            else if St <> '' then
            begin
                Inc(j);
                Existed := false;
                for k := 1 to OpenPtr do
                    if St = OpenPersonName[k] then
                    begin
                        TeamPersonIDs[i][j] := k;
                        Existed := true;
                        Break;
                    end;
                if not Existed then
                begin
                    Inc(OpenPtr);
                    OpenPersonName[OpenPtr] := St;
                    TeamPersonIDs[i][j] := OpenPtr;
                end;
                St := '';
            end;
        end;
    end;
    ChosePersons := [];
    Max := 0;
end;
begin
    {Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output); }
    Init;
    Search(1, 0);
    Writeln(Max);
    {Close(Input);
    Close(Output); }
end.

