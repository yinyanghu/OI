program ural1113;
var
  n,ans:real;
  m:longint;
  i:integer;
begin
  readln(n,m);
  ans:=0;i:=1;
  repeat
    n:=n-m/(i*2-1);
    ans:=ans+m;
    inc(i);
  until n<=m/(i*2-1);
  ans:=ans+n*(i*2-1);
  writeln(round(ans+0.4999999999));
end.
