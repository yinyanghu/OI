program ural1197;
const
  dx:array[1..8]of shortint=(1,2,2,1,-1,-2,-2,-1);
  dy:array[1..8]of shortint=(2,1,-1,-2,-2,-1,1,2);
var
  c:char;
  n,x,y,i,j,a:shortint;
function onboard(x,y:shortint):boolean;
  begin
    onboard:=(x>0) and (x<9) and (y>0) and (y<9);
  end;
begin
  readln(n);
  for i:=1 to n do begin
    readln(c,y);
    x:=ord(c)-96;
    a:=0;
    for j:=1 to 8 do
      if onboard(x+dx[j],y+dy[j]) then inc(a);
    writeln(a);
  end;
end.
