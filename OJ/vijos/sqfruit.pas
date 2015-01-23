program sqfruit;
var a:array[1..200] of longint;
    i,j,k,m,n,total,now:longint;
begin
    readln(n,m);
    for i:=1 to n do a[i]:=i;
    now:=1; total:=1;
    while total<=m do begin
        now:=now+total*total*total mod 5+1;
        if now<=n then begin
           k:=a[now];
           for i:=now to n-1 do a[i]:=a[i+1];
           dec(n); inc(total);
        end else now:=1;
    end;
    writeln(k);
end.