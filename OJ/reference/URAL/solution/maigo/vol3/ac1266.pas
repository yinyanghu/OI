program ural1266;
const
  maxn=20;
  zero=1e-6;
var
  e:array[1..maxn,1..maxn]of real;
  n,m,i,x,y,r:longint;
  ans:real;
begin
  read(n,m);
  for i:=1 to m do begin
    read(x,y,r);
    e[x,x]:=e[x,x]-1/r;e[x,y]:=e[x,y]+1/r;
    e[y,y]:=e[y,y]-1/r;e[y,x]:=e[y,x]+1/r;
  end;
  for i:=2 to n-1 do e[i,1]:=-e[i,1];

  for x:=n-1 downto 3 do begin
    y:=x;while abs(e[y,x])<zero do dec(y);
    if y<x then begin e[1]:=e[x];e[x]:=e[y];e[y]:=e[1];end;
    for y:=2 to x-1 do
      for i:=1 to x-1 do
        e[y,i]:=e[y,i]-e[x,i]/e[x,x]*e[y,x];
  end;

  e[1,1]:=1;
  for x:=2 to n-1 do begin
    for i:=2 to x-1 do
      e[x,1]:=e[x,1]-e[x,i]*e[i,1];
    e[x,1]:=e[x,1]/e[x,x];
  end;

  for i:=1 to n-1 do
    ans:=ans+e[n,i]*e[i,1];
  writeln(1/ans:0:2);
end.
