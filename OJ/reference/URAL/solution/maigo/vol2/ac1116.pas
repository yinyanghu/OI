program ural1116;
const
  range=32000;
var
  v:array[-range..range]of shortint;
  n,i,j,a,b,y:integer;
begin
  fillchar(v,sizeof(v),127);
  read(n);
  for i:=1 to n do begin
    read(a,b,y);
    for j:=a to b-1 do
      v[j]:=y;
  end;
  read(n);
  for i:=1 to n do begin
    read(a,b,y);
    for j:=a to b-1 do
      v[j]:=127;
  end;

  n:=0;
  for i:=1-range to range do
    if (v[i]<127) and (v[i]<>v[i-1]) then inc(n);
  write(n);
  for i:=1-range to range do begin
    if (v[i-1]<127) and (v[i]<>v[i-1]) then write(' ',i,' ',v[i-1]);
    if (v[i]<127) and (v[i]<>v[i-1]) then write(' ',i);
  end;
  writeln;
end.
