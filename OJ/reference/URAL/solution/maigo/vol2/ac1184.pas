program ural1184;
const
  maxn=10000;
var
  l:array[1..maxn]of longint;
  n,k,i:integer;
  a,b,m:longint;
  t:int64;
  x:real;
begin
  readln(n,k);
  t:=0;a:=1;b:=0;
  for i:=1 to n do begin
    readln(x);
    l[i]:=round(x*100);
    inc(t,l[i]);
    if l[i]>b then b:=l[i];
  end;
  if t<k then begin
    writeln('0.00');
    halt;
  end;

  inc(b);
  while b-a>1 do begin
    m:=(a+b) div 2;
    t:=0;
    for i:=1 to n do
      inc(t,l[i] div m);
    if t<k then b:=m else a:=m;
  end;
  writeln(a/100:0:2);
end.
