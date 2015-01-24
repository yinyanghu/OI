program ural1283;
var
  b,ans:longint;
  a,c:real;
begin
  read(a,b,c);
  c:=1-c/100;
  while a>b do begin
    inc(ans);
    a:=a*c;
  end;
  writeln(ans);
end.
