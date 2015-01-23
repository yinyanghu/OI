program p1218;
var total,n,i,p:longint;
begin
    readln(p);
    for i:=1 to p do begin
        readln(n);
        total:=1;
        while total*total<=n do inc(total);
        dec(total);
        writeln(total);
    end;
end.