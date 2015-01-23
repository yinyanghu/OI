program easysele;
var a:array[1..100000] of longint;
    n,k,i,j,s:longint;
begin
    readln(k);
    for i:=1 to k do begin
        readln(n);
        readln(s);
        for j:=1 to n do read(a[i]);
        if s=0 then writeln('wind')
           else writeln('lolanv');
    end;
end.