program train;
const maxn=100;
var a,n,m,x,k,i:integer;
    p,d,u:array[1..maxn] of integer;
begin
    readln(a,n,m,x);
    fillchar(p,sizeof(p),0);
    u[1]:=a; d[1]:=0; p[1]:=a;
    k:=1; dec(n);
    repeat
       u[2]:=k; d[2]:=k; p[2]:=p[1];
       for i:=3 to n do begin
           u[i]:=u[i-1]+u[i-2];
           d[i]:=u[i-1];
           p[i]:=p[i-1]+u[i-2];
       end;
       if p[n]=m then begin
           writeln(p[x]);
           halt;
       end;
       inc(k);
    until p[n]>m;
    writeln('No Answer!');
end.