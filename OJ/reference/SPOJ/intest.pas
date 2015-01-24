//Written on 6123 -- Jan 30, 2005
program intest;
var
  n,k,i,t,c:longint;
begin
  read(n,k);
  for i:=1 to n do begin
    read(t);
    if t mod k=0 then inc(c);
  end;
  writeln(c);
end.
