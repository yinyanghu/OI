program p0001;
var a:longint;
begin
    while not eof do begin
        readln(a);
        if a=42 then halt;
        writeln(a);
    end;
end.
