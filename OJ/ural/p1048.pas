program p1048;
var a,b,c:array[1..1000000] of byte;
    i,j,k,m,n,p,s:longint;
begin
    readln(n);
    for i:=n downto 1 do readln(a[i],b[i]);
    k:=0;
    for i:=1 to n+10 do begin
        c[i]:=a[i]+b[i]+k;
        k:=c[i] div 10;
        c[i]:=c[i] mod 10;
    end;
    k:=n; if c[k+1]>0 then inc(k);
    for i:=k downto 1 do write(c[i]);
end.
