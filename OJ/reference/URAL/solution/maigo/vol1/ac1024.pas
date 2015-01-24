program ural1024;
const
  maxn=1000;
var
  p:array[1..maxn]of integer;
  n,i,l:integer;
  ans:longint;
procedure chain(x:integer);
  var
    t:integer;
  begin
    l:=0;
    repeat
      inc(l);
      t:=p[x];
      p[x]:=0;
      x:=t;
    until p[x]=0;
  end;
function gcd(a,b:longint):longint;
  var
    t:longint;
  begin
    if a<b then begin t:=a;a:=b;b:=t;end;
    while b>0 do begin
      t:=a mod b;a:=b;b:=t;
    end;
    gcd:=a;
  end;
begin
  readln(n);
  for i:=1 to n do
    read(p[i]);

  ans:=1;
  for i:=1 to n do
    if p[i]>0 then begin
      chain(i);
      ans:=ans div gcd(ans,l)*l;
    end;

  writeln(ans);
end.
