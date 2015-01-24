program ural1106;
const
  maxn=100;
var
  f:array[1..maxn,0..maxn]of byte;
  l:array[1..maxn]of byte;
  n,i,j:byte;
procedure floodfill(x,y:byte);
  var
    i:byte;
  begin
    if l[x]>0 then exit;
    l[x]:=y;
    if y=1 then inc(j);
    for i:=1 to f[x,0] do
      floodfill(f[x,i],3-y);
  end;
begin
  readln(n);
  for i:=1 to n do begin
    f[i,0]:=0;
    repeat
      read(j);
      if j=0 then break;
      inc(f[i,0]);
      f[i,f[i,0]]:=j;
    until false;
    if f[i,0]=0 then begin
      writeln(0);
      halt;
    end;
  end;

  j:=0;
  for i:=1 to n do
    floodfill(i,1);

  writeln(j);
  for i:=1 to n do
    if l[i]=1 then begin
      write(i);
      dec(j);
      if j=0 then writeln else write(' ');
    end;
end.
