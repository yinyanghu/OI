const maxn=100;
var i,n,j,total,p:longint;
    a:array[1..maxn] of integer;
begin
    readln(n);
    p:=0;
    for i:=1 to n do begin
        read(a[i]);
        inc(p,a[i]);
    end;
    p:=p div n;
    for i:=1 to n do dec(a[i],p);
    i:=1; j:=n;
    total:=0;
    while a[i]=0 do inc(i);
    while a[j]=0 do dec(j);
    while i<j do begin
        inc(a[i+1],a[i]);
        a[i]:=0;
        inc(total);
        inc(i);
        while a[i]=0 do inc(i);
    end;
    writeln(total);
end.