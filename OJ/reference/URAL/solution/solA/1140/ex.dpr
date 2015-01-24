program Ural_1140(Input, Output);
type
    TIndex = Longint;
    TPoint = record
        X, Y: TIndex;
    end;
var
    M: TIndex;
    xr, yr, zr: TIndex;

procedure Main;
var
    x0, y0: TIndex;
    L: TIndex;
    Ch: Char;
begin
    x0 := 0;
    y0 := 0;
    Readln(M);
    while M > 0 do
    begin
        Dec(M);
        repeat
            Read(Ch);
        until Ch in ['X', 'Y', 'Z'];
        Readln(L);
        if Ch = 'X' then
            x0 := x0 + L;
        if Ch = 'Y' then
            y0 := y0 + L;
        if Ch = 'Z' then
        begin
            x0 := x0 - L;
            y0 := y0 + L;
        end;
    end;
    if x0 * y0 >= 0 then
    begin
        xr := 0 - x0;
        yr := 0 - y0;
        zr := 0;
    end
    else
    begin
        if Abs(x0) < Abs(y0) then
        begin
            xr := 0;
            yr := -x0 - y0;
            zr := x0;
        end
        else
        begin
            xr := -x0 - y0;
            yr := 0;
            zr := -y0;
        end;
    end;
    Writeln(Ord(xr <> 0) + Ord(yr <> 0) + Ord(zr <> 0));
    if xr <> 0 then Writeln('X ', xr);
    if yr <> 0 then Writeln('Y ', yr);
    if zr <> 0 then Writeln('Z ', zr);
end;
begin
 {    Assign(Input, 'i.txt');
     Reset(Input);
     Assign(Output, 'o.txt');
     Rewrite(Output);  }
    Main;
 {    Close(Input);
      Close(Output);     }
end.

