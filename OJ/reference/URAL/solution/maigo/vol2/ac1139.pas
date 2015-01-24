program ural1139;
var
  n,m,g:word;
function gcd(a,b:word):word;
  var
    r:word;
  begin
    repeat
      r:=a mod b;a:=b;b:=r;
    until b=0;
    gcd:=a;
  end;
begin
  readln(n,m);
  dec(n);dec(m);
  g:=gcd(n,m);
  n:=n div g;m:=m div g;
  writeln((n+m-1)*g);
end.
