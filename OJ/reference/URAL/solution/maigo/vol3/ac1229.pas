program ural1229;
const
  max=100;
var
  a,b,c,d:array[1..max]of word;
  n,m,i,j:byte;
begin
  read(n,m);
  for i:=1 to n shr 1 do begin
    for j:=1 to m do read(a[j]);
    for j:=1 to m do read(b[j]);
    for j:=1 to m do begin
      c[j]:=(i-1)*m+j;d[j]:=c[j];
    end;
    for j:=1 to m shr 1 do
      if (a[j shl 1-1]=b[j shl 1-1]) or (a[j shl 1]=b[j shl 1]) then begin
        dec(c[j shl 1]);inc(d[j shl 1-1]);
      end;
    for j:=1 to m-1 do write(c[j],' ');writeln(c[m]);
    for j:=1 to m-1 do write(d[j],' ');writeln(d[m]);
  end;
end.
