program victoria1;
var n,i,k,s,p,total:longint;
begin
    readln(n,k);
    total:=0;
    for i:=1 to n do begin
        p:=0;
        read(s);
        while s<>0 do begin
            inc(p);
            read(s);
        end;
        if p>=k then inc(total);
    end;
    writeln(total);
end.