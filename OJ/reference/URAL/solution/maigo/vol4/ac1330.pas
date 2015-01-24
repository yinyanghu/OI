program ural1330;
const
  maxn=10000;
var
  sum:array[0..maxn]of longint;
  n,q,i,x,y:longint;
begin
  read(n);
  for i:=1 to n do begin
    read(x);
    sum[i]:=sum[i-1]+x;
  end;
  read(q);
  for i:=1 to q do begin
    read(x,y);
    writeln(sum[y]-sum[x-1]);
  end;
end.
