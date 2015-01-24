//Written on 6152 -- Feb 28, 2005
program canton;
var
  t,u,s,n:longint;
begin
  read(t);
  for u:=1 to t do begin
    read(s);
    write('TERM ',s,' IS ');
    n:=trunc(sqrt(s*2-1.75)-0.5);
    dec(s,n*(n+1) shr 1);
    if odd(n) then writeln(s,'/',n+2-s) else writeln(n+2-s,'/',s);
  end;
end.
