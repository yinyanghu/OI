program square;
var m,n,m1,n1:integer;
    s1,s2:longint;
begin
    readln(m,n);
    n1:=n; m1:=m;
    s1:=m1*n1;
    while (n1<>0) and (m1<>0) do begin
        dec(n1); dec(m1);
        s1:=s1+m1*n1;
    end;
    s2:=(m+1)*(n+1)*m*n div 4-s1;
    writeln(s1,' ',s2);
end.