program Ural_1080(Input, Output);
const
    MaxN = 99;
type
    TIndex = Byte;
    TAdjoinList = array[1..MaxN, 1..MaxN] of Boolean;
    TColoured = array[1..MaxN] of Boolean;
var
    N: TIndex;
    Adj: TAdjoinList;
    Coloured: TColoured;

procedure Search(depth: TIndex);
var
    i, j: TIndex;
    IsValid: Boolean;
begin
    if depth = N + 1 then
    begin
        for i := 1 to N do
            Write(Ord(Coloured[i]));
        Writeln;
        Halt;
    end;
    for i := 0 to 1 do
    begin
        IsValid := true;
        for j := 1 to depth - 1 do
            if Adj[depth, j] then
                if (Coloured[j] = (i = 1)) then
                begin
                    IsValid := false;
                    Break;
                end;
        if IsValid then
        begin
            Coloured[depth] := (i = 1);
            Search(depth + 1);
        end;
    end;
end;

procedure Main;
var
    i, T: TIndex;
begin
    FillChar(Adj, SizeOf(Adj), false);
    Readln(N);
    for i := 1 to N do
        while true do
        begin
            Read(T);
            if T = 0 then
                Break;
            Adj[i, T] := true;
            Adj[T, i] := true;
        end;
    Search(1);
    Writeln(-1);
end;
begin
{    assign(input, 'i.txt');
    reset(input);
    assign(output, 'o.txt');
    rewrite(output);             }
    Main;
  {  close(input);
    close(output);             }
end.

