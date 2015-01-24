program Ural_1287(Input, Output);
//19:50
const
    MaxN = 1400;
type
    TIndex = Longint;
    TStatistic = record
        Row, Column, UpDiagonal, {i - j = 0} DownDiagonal {i + j = 0}: TIndex;
    end;
    TData = array[0..MaxN + 1] of record
        Value: Char;
        Coarse, Small: TStatistic;
    end;
var
    MaxCoarseLen, MaxSmallLen, N: TIndex;
    Last, Current: TData;

procedure Main;
var
    i, j: TIndex;
    Ch: Char;

begin
    MaxCoarseLen := 0;
    MaxSmallLen := 0;
    Readln(N);
    FillChar(Last, SizeOf(Last), 0);
    FillChar(Current, SizeOf(Current), 0);
    //    Last[0].Value := #0;
    //Current[0].Value := #0;
    //Current[N + 1].Value := #0;
    for i := 1 to N do
    begin
        for j := 1 to N do
        begin
            repeat
                Read(Ch);
            until Ch in ['S', 's'];
            Current[j].Value := Ch;
            if Current[j].Value = 'S' then
            begin
                Current[j].Coarse.Row := Ord(Current[j - 1].Value = Current[j].Value) * Current[j - 1].Coarse.Row + 1;
                Current[j].Coarse.Column := Ord(Last[j].Value = Current[j].Value) * Last[j].Coarse.Column + 1;
                Current[j].Coarse.UpDiagonal := Ord(Last[j + 1].Value = Current[j].Value) * Last[j + 1].Coarse.UpDiagonal + 1;
                Current[j].Coarse.DownDiagonal := Ord(Last[j - 1].Value = Current[j].Value) * Last[j - 1].Coarse.DownDiagonal + 1;
                Current[j].Small.Row := 0;
                Current[j].Small.Column := 0;
                Current[j].Small.UpDiagonal := 0;
                Current[j].Small.DownDiagonal := 0;
            end
            else
            begin
                Current[j].Coarse.Row := 0;
                Current[j].Coarse.Column := 0;
                Current[j].Coarse.UpDiagonal := 0;
                Current[j].Coarse.DownDiagonal := 0;
                Current[j].Small.Row := Ord(Current[j - 1].Value = Current[j].Value) * Current[j - 1].Small.Row + 1;
                Current[j].Small.Column := Ord(Last[j].Value = Current[j].Value) * Last[j].Small.Column + 1;
                Current[j].Small.UpDiagonal := Ord(Last[j + 1].Value = Current[j].Value) * Last[j + 1].Small.UpDiagonal + 1;
                Current[j].Small.DownDiagonal := Ord(Last[j - 1].Value = Current[j].Value) * Last[j - 1].Small.DownDiagonal + 1;
            end;
            if Current[j].Coarse.Row > MaxCoarseLen then
                MaxCoarseLen := Current[j].Coarse.Row;
            if Current[j].Coarse.Column > MaxCoarseLen then
                MaxCoarseLen := Current[j].Coarse.Column;
            if Current[j].Coarse.UpDiagonal > MaxCoarseLen then
                MaxCoarseLen := Current[j].Coarse.UpDiagonal;
            if Current[j].Coarse.DownDiagonal > MaxCoarseLen then
                MaxCoarseLen := Current[j].Coarse.DownDiagonal;
            if Current[j].Small.Row > MaxSmallLen then
                MaxSmallLen := Current[j].Small.Row;
            if Current[j].Small.Column > MaxSmallLen then
                MaxSmallLen := Current[j].Small.Column;
            if Current[j].Small.UpDiagonal > MaxSmallLen then
                MaxSmallLen := Current[j].Small.UpDiagonal;
            if Current[j].Small.DownDiagonal > MaxSmallLen then
                MaxSmallLen := Current[j].Small.DownDiagonal;
        end;
        Last := Current;
    end;
    if MaxCoarseLen > MaxSmallLen then
    begin
        Writeln('S');
        Writeln(MaxCoarseLen);
    end
    else if MaxCoarseLen < MaxSmallLen then
    begin
        Writeln('s');
        Writeln(MaxSmallLen);
    end
    else if MaxCoarseLen = MaxSmallLen then
    begin
        Writeln('?');
        Writeln(MaxCoarseLen);
    end;
end;
begin
{    Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);}
    Main;
{    Close(Input);
    Close(Output);}
end.

