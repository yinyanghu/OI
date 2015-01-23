program loj_0003;
var a:array[1..10000] of longint;
    i,j,k,x,y,m,n,total,l,r:longint;
begin
    readln(n,m);
    fillchar(a,sizeof(a),0);
    for i:=1 to n do read(a[i]);
    for i:=1 to m do begin
        l:=1; r:=n;
        readln(x,y);
        while a[l]<x do inc(l);
        while a[r]>y do dec(r);
        if (l<=r) then total:=r-l+1
          else total:=0;
        writeln(total);
    end;
end.
