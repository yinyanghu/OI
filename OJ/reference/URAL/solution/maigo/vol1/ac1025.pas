program ural1025;
const
  maxk=101;
var
  p:array[1..maxk]of integer;
  k,i,j:byte;
  t:integer;
begin
  readln(k);
  for i:=1 to k do
    read(p[i]);

  for i:=1 to k-1 do
    for j:=i+1 to k do
      if p[i]>p[j] then begin
        t:=p[i];p[i]:=p[j];p[j]:=t;
      end;

  k:=k div 2+1;t:=0;
  for i:=1 to k do
    inc(t,p[i] div 2+1);

  writeln(t);
end.
