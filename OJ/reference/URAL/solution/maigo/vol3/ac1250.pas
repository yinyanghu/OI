program ural1250;
const
  maxsize=500;
  queuesize=50000;
  dx:array[1..8]of shortint=(-1,1,0,0,-1,-1,1,1);
  dy:array[1..8]of shortint=(0,0,-1,1,-1,1,1,-1);
  sea='.';land='#';sea1=' ';land1='&';
var
  map:array[-1..maxsize+2,-1..maxsize+2]of char;
  qx,qy:array[1..queuesize]of word;
  m,n,x,y,i,j,f,r:word;
  ans:longint;
procedure floodfill(x,y:word;c1,c2,c3:char;dir:byte);
  var
    i:byte;
  begin
    f:=0;r:=1;qx[1]:=x;qy[1]:=y;map[x,y]:=c3;
    repeat
      inc(f);if f>queuesize then f:=1;
      for i:=1 to dir do
        if map[qx[f]+dx[i],qy[f]+dy[i]] in [c1,c2] then begin
          inc(r);if r>queuesize then r:=1;
          qx[r]:=qx[f]+dx[i];qy[r]:=qy[f]+dy[i];
          map[qx[r],qy[r]]:=c3;
        end;
    until f=r;
  end;
begin
  read(n,m,y,x);
  for i:=0 to n+1 do begin
    map[0,i]:=land;map[m+1,i]:=land;
  end;
  for i:=1 to m do begin
    map[i,0]:=land;map[i,n+1]:=land;
  end;
  for i:=1 to m do begin
    readln;
    for j:=1 to n do
      read(map[i,j]);
  end;

  floodfill(x,y,sea,sea,sea1,8);
  floodfill(0,0,sea,land,land1,4);
  for i:=1 to m do
    for j:=1 to n do begin
      if map[i,j]=land then begin
        inc(ans);
        floodfill(i,j,land,land,land1,4);
      end;
    end;

  writeln(ans);
end.
