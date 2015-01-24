//Written on 6107 -- Jan 14, 2005
program pigbank;
const
  maxw=9999;
  maxn=500;
  inf=2000000000;
var
  p,w:array[1..maxn]of word;
  v:array[0..maxw]of longint;
  t,u,e,n,i,j,x:longint;
begin
  read(t);
  for u:=1 to t do begin
    read(i,e,n);dec(e,i);
    for i:=1 to n do
      read(p[i],w[i]);
    v[0]:=0;
    for i:=1 to e do begin
      v[i]:=inf;
      for j:=1 to n do
        if i>=w[j] then begin
          x:=v[i-w[j]]+p[j];
          if x<v[i] then v[i]:=x;
        end;
    end;
    if v[e]=inf then
      writeln('This is impossible.')
    else
      writeln('The minimum amount of money in the piggy-bank is ',v[e],'.');
  end;
end.
