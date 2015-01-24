var
                f       :       array[0..1000,0..1000] of longint;
                i,j,k   :       longint;
                m,e     :       longint;

procedure prepare;
begin
  for i:=1 to 1000 do
    begin
      f[i,1]:=i;
      f[1,i]:=1;
    end;
  for i:=2 to 1000 do
    for j:=2 to 1000 do
      f[i,j]:=f[i-1,j]+f[i-1,j-1]+1;
end;

procedure work;
begin
  repeat
  read(m);
  if m=0 then halt;
  readln(e);
  for i:=1 to 1000 do
    if f[i-1,m]<e then
      if f[i,m]>=e then break;
  writeln(i);
  until false;
end;

begin
  prepare;
  work;
end.