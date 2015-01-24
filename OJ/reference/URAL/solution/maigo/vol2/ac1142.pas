program ural1142;
const
  maxn=10;
var
  f:array[0..maxn]of longint;
  n,i:shortint;
function c(a,b:byte):longint;
  var
    x:longint;
    i:byte;
  begin
    x:=1;
    for i:=1 to b do
      x:=x*(a+1-i) div i;
    c:=x;
  end;
begin
  f[0]:=1;f[1]:=1;
  for n:=2 to maxn do begin
    f[n]:=0;
    for i:=1 to n do
      inc(f[n],c(n,i)*f[n-i]);
  end;

  readln(n);
  repeat
    writeln(f[n]);
    readln(n);
  until n=-1;
end.
