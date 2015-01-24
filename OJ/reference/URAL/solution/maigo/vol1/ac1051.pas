program ural1051;
var
  m,n,t:integer;
begin
  readln(m,n);
  if m>n then begin t:=m;m:=n;n:=t;end;
  if m=1 then
    if odd(n) then writeln(n div 2+1) else writeln(n div 2)
  else
    if (m mod 3=0) or (n mod 3=0) then writeln(2) else writeln(1);
end.
