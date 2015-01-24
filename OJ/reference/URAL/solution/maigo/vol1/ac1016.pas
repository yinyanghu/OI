program ural1016;
const
  left:array[1..6{front},1..6{bottom}]of byte=((0,3,5,2,4,0),(4,0,1,6,0,3),
       (2,6,0,0,1,5),(5,1,0,0,6,2),(3,0,6,1,0,4),(0,4,2,5,3,0));
var
  num:array[1..6]of byte;{1-top;2-front;3-left;4-right;5-back;6-bottom}
  dist:array[1..8,1..8,1..6{front},1..6{bottom}]of longint;
  dir:array[1..8,1..8,1..6,1..6]of shortint;{1-up;2-right;3-down;4-left;minus-visited}
  rx,ry:array[1..1536]of byte;
  x1,y1,x2,y2,i,j,k,l,x,y,f,b:byte;
  m:longint;
  c:char;
procedure update(x0,y0,f0,b0,d:byte);
  var
    t:longint;
  begin
    t:=dist[x,y,f,b]+num[b0];
    if t<dist[x0,y0,f0,b0] then begin
      dist[x0,y0,f0,b0]:=t;
      dir[x0,y0,f0,b0]:=d;
    end;
  end;
begin
  read(c);x1:=ord(c)-96;read(y1);
  read(c,c);x2:=ord(c)-96;read(y2,num[2],num[5],num[1],num[4],num[6],num[3]);

  for i:=1 to 8 do
    for j:=1 to 8 do
      for k:=1 to 6 do
        for l:=1 to 6 do
          dist[i,j,k,l]:=maxlongint;
  dist[x1,y1,2,6]:=num[6];dir[x1,y1,2,6]:=-5;
  x:=x1;y:=y1;f:=2;b:=6;
  repeat
    if y<8 then update(x,y+1,b,7-f,1);
    if x<8 then update(x+1,y,f,7-left[f,b],2);
    if y>1 then update(x,y-1,7-b,f,3);
    if x>1 then update(x-1,y,f,left[f,b],4);
    m:=maxlongint;
    for i:=1 to 8 do
      for j:=1 to 8 do
        for k:=1 to 6 do
          for l:=1 to 6 do
            if (dir[i,j,k,l]>0) and (dist[i,j,k,l]<m) then begin
              m:=dist[i,j,k,l];
              x:=i;y:=j;f:=k;b:=l;
            end;
    dir[x,y,f,b]:=-dir[x,y,f,b];
  until (x=x2) and (y=y2);

  write(dist[x,y,f,b]);
  l:=1;rx[1]:=x;ry[1]:=y;
  repeat
    case dir[x,y,f,b] of
      -1:begin dec(y);k:=7-b;b:=f;f:=k;end;
      -2:begin dec(x);b:=left[f,b];end;
      -3:begin inc(y);k:=b;b:=7-f;f:=k;end;
      -4:begin inc(x);b:=7-left[f,b];end;
    end;
    inc(l);rx[l]:=x;ry[l]:=y;
  until dir[x,y,f,b]=-5;

  for i:=l downto 1 do
    write(' ',chr(96+rx[i]),ry[i]);
  writeln;
end.
