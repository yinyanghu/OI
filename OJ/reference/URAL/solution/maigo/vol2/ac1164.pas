program ural1164;
var
  count:array['A'..'Z']of byte;
  n,m,p,i,j:byte;
  c:char;
begin
  readln(n,m,p);
  for i:=1 to n do begin
    for j:=1 to m do begin
      read(c);
      inc(count[c]);
    end;
    readln;
  end;
  for i:=1 to p do begin
    repeat
      read(c);
      dec(count[c]);
    until eoln;
    readln;
  end;
  for c:='A' to 'Z' do
    for i:=1 to count[c] do
      write(c);
  writeln;
end.
