program ural1121;
const
  size=150;
  maxdist=5;
var
  map:array[1..size,1..size]of integer;
  h,w,i,j,a:integer;
  d,e:byte;
function cross(x,y:integer):integer;
  begin
    if (x>0) and (x<=h) and (y>0) and (y<=w) then cross:=map[x,y] else cross:=0;
  end;
begin
  readln(h,w);
  for i:=1 to h do
    for j:=1 to w do
      read(map[i,j]);

  for i:=1 to h do
    for j:=1 to w do begin
      if map[i,j]>0 then
        write(-1)
      else begin
        a:=0;
        for d:=1 to maxdist do begin
          for e:=1 to d do
            a:=a or cross(i-e,j+d-e) or cross(i-d+e,j-e)
                 or cross(i+e,j-d+e) or cross(i+d-e,j+e);
          if a>0 then break;
        end;
        write(a);
      end;
      if j=w then writeln else write(' ');
    end;
end.
