program ural1119;
const
  maxn=1000;
  maxk=100;
  edge=100;
  diag=edge*sqrt(2);
var
  l,l1:array[0..maxn]of real;
  d:array[1..maxk+1,1..2]of integer;
  n,m,i,j,t:integer;
  k:byte;
function min(a,b:real):real;
  begin
    if a<b then min:=a else min:=b;
  end;
begin
  readln(n,m,k);
  for i:=1 to k do
    readln(d[i,1],d[i,2]);
  d[k+1,1]:=0;d[k+1,2]:=0;
  for i:=1 to k-1 do
    for j:=i+1 to k do
      if (d[i,1]>d[j,1]) or (d[i,1]=d[j,1]) and (d[i,2]>d[j,2]) then begin
        t:=d[i,1];d[i,1]:=d[j,1];d[j,1]:=t;
        t:=d[i,2];d[i,2]:=d[j,2];d[j,2]:=t;
      end;

  for i:=0 to m do
    l[i]:=i*edge;
  k:=1;
  for i:=1 to n do begin
    l1[0]:=i*edge;
    for j:=1 to m do
      if (i=d[k,1]) and (j=d[k,2]) then begin
        l1[j]:=min(min(l1[j-1]+edge,l[j]+edge),l[j-1]+diag);
        inc(k);
      end
      else
        l1[j]:=min(l1[j-1]+edge,l[j]+edge);
    l:=l1;
  end;

  writeln(l[m]:0:0);
end.
