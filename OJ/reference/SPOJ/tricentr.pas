//Written on 6111 -- Jan 18, 2005
program tricentr;
var
  t,u:word;
  a,x,y,z,m,n,h:extended;
begin
  read(t);
  for u:=1 to t do begin
    read(a,x,y,z);
    h:=x*3;
    m:=sqrt(sqr(a*h/3/y)-h*h);
    n:=sqrt(sqr(a*h/3/z)-h*h);
    if abs(abs(n-m)-a)>1e-6 then m:=-m;
    writeln(a*h/2:0:3,' ',sqrt(sqr((m+n)/3)+sqr(h/3+m*n/h)):0:3);
  end;
end.
