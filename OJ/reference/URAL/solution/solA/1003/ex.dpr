program Ural_1003(Input, Output);
const
    Null = -1;
    MaxN = 5000;
    MaxHash = MaxN * 2 - 3;
    //if MaxHash=10000 then running time = 0.265s
    //if MaxHash=9997 then running time = 0.062s
type
    TIndex = Longint;
    THash = array[0..MaxHash - 1] of record
        Value: TIndex;
        Team: TIndex;
        Delta: TIndex;
    end;
var
    H: THash;
    N, K: TIndex;
    TeamNum: TIndex;

procedure UpdateTeam(BasedTeam, ChangedTeam: TIndex; Delta: TIndex);
var
    i: TIndex;
begin
    for i := 0 to MaxHash - 1 do
        if (H[i].Value > Null) and (H[i].Team = ChangedTeam) then
        begin
            H[i].Team := BasedTeam;
            H[i].Delta := (H[i].Delta + Delta + 2) mod 2;
        end;
end;

function FindInHash(Value: TIndex): TIndex;
var
    i: TIndex;
begin
    i := Value mod MaxHash;
    while not ((H[i].Value = Value) or (H[i].Value = Null)) do
    begin
        Inc(i);
        if i = MaxHash then i := 0;
    end;
    FindInHash := i;
end;

procedure Main;
var
    Wrong: Boolean;
    X, Y: TIndex;
    Xp, Yp: TIndex;
    St: string;
    i, Delta: TIndex;
begin
    while true do
    begin
        Readln(N);
        if N = -1 then Break;
        Readln(K);
        FillChar(H, SizeOf(H), 255); //-1
        TeamNum := 0;
        Wrong := false;
        for i := 1 to K do
        begin
            Read(X, Y);
            Readln(St);
            if Wrong then Continue;
            Delta := 0;
            if Pos('odd', St) > 0 then
                Delta := 1
            else if Pos('even', St) > 0 then
                Delta := 0;
            Xp := FindInHash(X - 1);
            Yp := FindInHash(Y);
            if (H[Xp].Value = Null) and (H[Yp].Value = Null) then
            begin
                Inc(TeamNum);
                H[Xp].Value := X - 1;
                H[Xp].Team := TeamNum;
                H[Xp].Delta := 0;
                H[Yp].Value := Y;
                H[Yp].Team := TeamNum;
                H[Yp].Delta := Delta;
            end
            else if (H[Xp].Value > Null) and (H[Yp].Value = Null) then
            begin
                H[Yp].Value := Y;
                H[Yp].Team := H[Xp].Team;
                H[Yp].Delta := (H[Xp].Delta + Delta) mod 2;
            end
            else if (H[Xp].Value = Null) and (H[Yp].Value > Null) then
            begin
                H[Xp].Value := X - 1;
                H[Xp].Team := H[Yp].Team;
                H[Xp].Delta := (H[Yp].Delta - Delta + 2) mod 2;
            end
            else if (H[Xp].Value > Null) and (H[Yp].Value > Null) then
            begin
                if H[Xp].Team = H[Yp].Team then
                    if (H[Yp].Delta - H[Xp].Delta + 2) mod 2 <> Delta then
                    begin
                        Writeln(i - 1);
                        Wrong := true;
                        Continue;
                    end
                    else
                else
                    UpdateTeam(H[Xp].Team, H[Yp].Team, H[Xp].Delta - H[Yp].Delta + Delta);
            end;
        end;
        if not Wrong then Writeln(K);
    end;
end;
begin
    { Assign(Input, 'i.txt');
     Reset(Input);
     Assign(Output, 'o.txt');
     Rewrite(Output);  }
    Main;
    { Close(Input);
     Close(Output); }
end.

