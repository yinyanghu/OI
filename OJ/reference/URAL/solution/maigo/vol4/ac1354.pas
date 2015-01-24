program ural1354;
const
  maxl=10000;
var
  c:array[1..maxl]of char;
  next:array[1..maxl]of word;
  l,i,j:longint;
begin
  repeat
    inc(l);read(c[l]);write(c[l]);
  until seekeoln;

  next[l]:=l+1;
  i:=l;j:=l+1;
  while i>1 do
    if (j>l) or (c[i]=c[j]) then begin
      dec(i);dec(j);
      if c[i]=c[j] then next[i]:=next[j] else next[i]:=j;
    end
    else
      j:=next[j];

  i:=2;j:=l;
  while i<=l do
    if (j>l) or (c[i]=c[j]) then begin
      inc(i);dec(j);
    end
    else
      j:=next[j];

  for i:=j downto 1 do
    write(c[i]);
  writeln;
end.
