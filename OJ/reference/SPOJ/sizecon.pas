//Written on 6435 -- Dec 8, 2005
//Submit without these comments!
var
  n,i,x,s:longint;
begin
  read(n);
  for i:=1 to n do begin
    read(x);
    if x>0 then inc(s,x);
  end;
  writeln(s);
end.
