program Ural_1121(Input, Output);
const
    MaxH = 150;
    MaxW = 150;
    MaxBranch = 11;
    PowerOfTwo: array[0..MaxBranch - 1] of Longint = (1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024);
type
    TIndex = Longint;
    TGraph = array[1 - 5..MaxH + 5, 1 - 5..MaxW + 5] of record
        Status: Longint;
        //Status<0 -Status is the step; Status=0; be not reached; Status>0,brance mark
        TypeSet: set of 1..MaxBranch;
    end;
var
    H, W: TIndex;
    G: TGraph;

procedure Main;
var
    i, j, k, x, y, S: TIndex;
begin
    FillChar(G, SizeOf(G), 0);
    Readln(H, W); //!!!
    for i := 1 to H do
        for j := 1 to W do
        begin
            Read(G[i, j].Status);
            if G[i, j].Status > 0 then
            begin
                S := G[i, j].Status;
                for k := 1 to MaxBranch do
                begin
                    if S mod 2 = 1 then G[i, j].TypeSet := G[i, j].TypeSet + [k];
                    S := S div 2;
                end;
            end;
        end;
    for k := 1 to 5 do
    begin
        for x := 1 to H do
            for y := 1 to W do
                if G[x, y].Status > 0 then
                    for i := 0 to k do
                    begin
                        j := k - i;
                        if (G[x + i, y + j].Status = 0) or (G[x + i, y + j].Status = -k) then
                        begin
                            G[x + i, y + j].Status := -k;
                            G[x + i, y + j].TypeSet := G[x + i, y + j].TypeSet + G[x, y].TypeSet;
                        end;
                        if (G[x + i, y - j].Status = 0) or (G[x + i, y - j].Status = -k) then
                        begin
                            G[x + i, y - j].Status := -k;
                            G[x + i, y - j].TypeSet := G[x + i, y - j].TypeSet + G[x, y].TypeSet;
                        end;
                        if (G[x - i, y + j].Status = 0) or (G[x - i, y + j].Status = -k) then
                        begin
                            G[x - i, y + j].Status := -k;
                            G[x - i, y + j].TypeSet := G[x - i, y + j].TypeSet + G[x, y].TypeSet;
                        end;
                        if (G[x - i, y - j].Status = 0) or (G[x - i, y - j].Status = -k) then
                        begin
                            G[x - i, y - j].Status := -k;
                            G[x - i, y - j].TypeSet := G[x - i, y - j].TypeSet + G[x, y].TypeSet;
                        end;
                    end;
    end;
    for x := 1 to H do
    begin
        for y := 1 to W do
            if G[x, y].Status = 0 then
                Write(0, ' ')
            else if G[x, y].Status > 0 then
                Write(-1, ' ')
            else if G[x, y].Status < 0 then
            begin
                S := 0;
                for i := 1 to MaxBranch do
                    if i in G[x, y].TypeSet then
                        Inc(S, PowerOfTwo[i - 1]);
                Write(S, ' ');
            end;
        Writeln;
    end;
end;
begin
  {  Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output); }
    Main;
    {Close(Input);
    Close(Output);    }
end.

