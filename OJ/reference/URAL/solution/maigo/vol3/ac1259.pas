program ural1259;
var
  n,i,m:longint;
function gcd(a,b:longint):longint;
  var
    t:longint;
  begin
    repeat
      t:=a mod b;a:=b;b:=t;
    until b=0;
    gcd:=a;
  end;
begin
  read(n);
  for i:=1 to n div 2 do
    if gcd(n,i)=1 then inc(m);
  writeln(m);
end.
