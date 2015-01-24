program ural1167;
const
  maxn=500;
var
  color:array[1..maxn]of byte;
  c:array[1..(maxn+1)*maxn div 2]of word;
    {c[p(x,y)] is the coefficient of unhappiness from the xth horse to the
     yth horse if they're put in the same stable}
  f:array[1..maxn]of longint;
  n,k,i,j,x,y:integer;
function p(x,y:integer):longint;
  begin
    p:=(y-1)*y div 2+x;
  end;
begin
  readln(n,k);
  for i:=1 to n do
    readln(color[i]);

  for i:=1 to n do begin
    x:=0;y:=0;
    for j:=i to n do begin
      if color[j]=1 then inc(x) else inc(y);
      c[p(i,j)]:=x*y;
    end;
  end;

  for i:=1 to n do
    f[i]:=c[p(1,i)];
  for y:=2 to k do
    for x:=n downto y do begin
      f[x]:=maxlongint;
      for i:=y to x do
        if f[i-1]+c[p(i,x)]<f[x] then
          f[x]:=f[i-1]+c[p(i,x)];
    end;

  writeln(f[n]);
end.
