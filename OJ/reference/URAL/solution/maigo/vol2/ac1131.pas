program ural1131;
var
  n,k,a,t:longint;
begin
  readln(n,k);
  a:=1;t:=0;
  while (a<=k) and (a<n) do begin
    a:=a*2;
    inc(t);
  end;
  if a<n then inc(t,(n-a) div k+ord((n-a) mod k>0));
  writeln(t);
end.
