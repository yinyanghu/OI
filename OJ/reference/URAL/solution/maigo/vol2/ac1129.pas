program ural1129;
const
  maxn=100;
var
  l:array[1..maxn]of byte;
  list:array[1..maxn,1..maxn]of byte;
  color:array[1..maxn,1..maxn]of char;
  o:array[1..maxn]of boolean;
  n,i,j:byte;
procedure paint(x:byte);
  var
    y:byte;
  begin
    repeat
      y:=1;
      while (y<=l[x]) and (color[x,list[x,y]]<>'W') do inc(y);
      if y>l[x] then exit;
      y:=list[x,y];
      color[x,y]:='G';
      color[y,x]:='Y';
      o[x]:=not o[x];o[y]:=not o[y];
      x:=y;
    until false;
  end;
begin
  fillchar(color,sizeof(color),'W');
  read(n);
  for i:=1 to n do begin
    read(l[i]);o[i]:=odd(l[i]);
    for j:=1 to l[i] do
      read(list[i,j]);
  end;

  for i:=1 to n do
    if o[i] then
      paint(i);
  for i:=1 to n do
    paint(i);

  for i:=1 to n do begin
    for j:=1 to l[i]-1 do
      write(color[i,list[i,j]],' ');
    writeln(color[i,list[i,l[i]]]);
  end;
end.
