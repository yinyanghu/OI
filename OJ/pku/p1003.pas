program p1003;
var n:longint;
    a,total:extended;
begin
    while not eof do begin
        readln(a);
        if a=0.00 then halt;
        n:=1; total:=0;
        while total<=a do begin
            inc(n);
            total:=total+1/n;
        end;
        writeln(n-1,' card(s)');
    end;
end.
