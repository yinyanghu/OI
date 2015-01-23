program p1083;
var n,k,total:longint;
    s:string;
begin
    read(n);
    readln(s);
    k:=length(s)-1;
    total:=1;
    while n>0 do begin
        total:=total*n;
        dec(n,k);
    end;
    writeln(total);
end.