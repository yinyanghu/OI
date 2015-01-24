program ural1273;
const
  maxk=100;
var
  a,b:array[1..maxk]of integer;
  k,i,j,l,r,m:shortint;
  t:integer;
begin
  read(k);
  for i:=1 to k do
    read(a[i],b[i]);
  for i:=1 to k-1 do
    for j:=i+1 to k do
      if b[i]>b[j] then begin
        t:=a[i];a[i]:=a[j];a[j]:=t;
        t:=b[i];b[i]:=b[j];b[j]:=t;
      end;

  j:=0;
  for i:=1 to k do
    b[i]:=maxint;
  for i:=1 to k do begin
    l:=1;r:=j+1;
    while l<>r do begin
      m:=(l+r) div 2;
      if a[i]<b[m] then r:=m else l:=m+1;
    end;
    b[l]:=a[i];
    if l>j then j:=l;
  end;
  writeln(k-j);
end.
