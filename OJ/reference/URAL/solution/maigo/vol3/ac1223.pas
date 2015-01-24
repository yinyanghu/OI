program ural1223;
const
  maxeggs=1000;
  maxfloors=1000;
  maxthrows=45;
var
  a:array[2..maxeggs,1..maxthrows]of word;
    {a[x,y]:the max number of floors solvable with x eggs & y throws}
  i,j:word;
  x:byte;
begin
  a[2,1]:=1;for i:=2 to maxthrows do a[2,i]:=a[2,i-1]+i;
  for i:=3 to maxeggs do begin
    a[i,1]:=1;j:=1;
    repeat
      inc(j);
      a[i,j]:=a[i,j-1]+a[i-1,j-1]+1;
    until a[i,j]>=maxfloors;
  end;

  repeat
    read(i);if i=0 then halt;read(j);
    if i=1 then
      writeln(j)
    else begin
      x:=1;
      while a[i,x]<j do inc(x);
      writeln(x);
    end;
  until false;
end.
