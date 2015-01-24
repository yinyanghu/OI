//Written on 6428 -- Dec 1, 2005
program billiard;
var
  a,b,s,m,n:longint;
begin
  repeat
    read(a,b,s,m,n);
    if s=0 then halt;
    a:=a*m;b:=b*n;
    if a=0 then write('90.00') else write(arctan(b/a)*180/pi:0:2);
    writeln(' ',sqrt(1.0*a*a+1.0*b*b)/s:0:2);
  until false;
end.
