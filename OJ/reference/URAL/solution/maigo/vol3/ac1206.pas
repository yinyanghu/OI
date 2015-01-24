program ural1206;
const
  maxdigit=87;
var
  a:array[0..maxdigit]of word;
  k,i:byte;
  j:word;
begin
  read(k);
  a[1]:=3;a[0]:=6;
  for i:=2 to k do begin
    for j:=0 to maxdigit do
      a[j]:=a[j]*55;
    for j:=0 to maxdigit do
      if a[j]>9 then begin
        inc(a[j+1],a[j] div 10);
        a[j]:=a[j] mod 10;
      end;
  end;

  j:=maxdigit;
  while a[j]=0 do dec(j);
  while j>0 do begin
    write(a[j]);dec(j);
  end;
  writeln(a[0]);
end.
