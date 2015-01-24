program ural1252;
const
  size=130000;
var
  p:array[1..size]of longint;
  n,i,x,ans1,ans2:longint;
function gcd(a,b:longint):longint;
  var
    t:longint;
  begin
    if a<b then begin t:=a;a:=b;b:=t;end;
    repeat
      t:=a mod b;a:=b;b:=t;
    until b=0;
    gcd:=a;
  end;
procedure update(var a:longint);
  begin
    if p[i]=0 then exit;
    inc(x);
    if p[i]=x then exit;
    if a=0 then
      a:=abs(p[i]-x)
    else
      a:=gcd(a,abs(p[i]-x));
  end;
begin
  read(n);
  for i:=1 to n do begin
    read(x);
    p[x]:=i;
  end;

  x:=0;
  for i:=1 to size do
    update(ans1);

  x:=0;
  for i:=size downto 1 do
    update(ans2);

  if (ans1=0) or (ans2=0) then
    writeln(n-1)
  else
    if ans1>ans2 then writeln(ans1-1) else writeln(ans2-1);
end.
