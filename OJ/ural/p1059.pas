program p1059;
var n,i:longint;
begin
    readln(n);
    writeln(0);
    for i:=1 to n do begin
        writeln('X');
        writeln('*');
        writeln(i);
        writeln('+');
    end;
end.