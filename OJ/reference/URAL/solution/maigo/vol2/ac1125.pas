program ural1125;
const
  size=50;
  ggs=26;
  gg:array[1..ggs,1..2]of byte=(
     (3,4),(5,12),(6,8),(7,24),(8,15),(9,12),(9,40),(10,24),
     (12,16),(12,35),(14,48),(15,20),(15,36),(16,30),(18,24),(20,21),
     (20,48),(21,28),(24,32),(24,45),(27,36),(28,45),(30,40),(33,44),
     (36,48),(40,42));
var
  map:array[1..size,1..size]of char;
  m,n,i,j,k:shortint;
  c:longint;
procedure change(x,y:shortint);
  begin
    if (x>0) and (x<=m) and (y>0) and (y<=n) then
      if map[x,y]='B' then map[x,y]:='W' else map[x,y]:='B';
  end;
begin
  readln(m,n);
  for i:=1 to m do begin
    for j:=1 to n do
      read(map[i,j]);
    readln;
  end;

  for i:=1 to m do
    for j:=1 to n do begin
      read(c);
      if odd(c) then begin
        change(i,j);
        for k:=1 to m do
          change(k,j);
        for k:=1 to n do
          change(i,k);
        for k:=1 to ggs do begin
          change(i+gg[k,1],j+gg[k,2]);
          change(i+gg[k,1],j-gg[k,2]);
          change(i-gg[k,1],j+gg[k,2]);
          change(i-gg[k,1],j-gg[k,2]);
          change(i+gg[k,2],j+gg[k,1]);
          change(i+gg[k,2],j-gg[k,1]);
          change(i-gg[k,2],j+gg[k,1]);
          change(i-gg[k,2],j-gg[k,1]);
        end;
      end;
    end;

  for i:=1 to m do begin
    for j:=1 to n do
      write(map[i,j]);
    writeln;
  end;
end.
