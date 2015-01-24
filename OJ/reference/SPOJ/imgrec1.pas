//Written on 6455 -- Dec 28, 2005
program imgrec1;
const
  maxsize=50;
  dx:array[1..8]of shortint=(0,0,-1,1,-1,-1,1,1);
  dy:array[1..8]of shortint=(-1,1,0,0,-1,1,1,-1);
var
  map:array[-1..maxsize+2,-1..maxsize+2]of char;
  t,u,n,v,h,w,i,j,ds,x1,x2,y1,y2,size,msize,mx,my,area:longint;
  c1:set of char;
  c2:char;
  bound:boolean;
procedure floodfill(x,y:longint);
  var
    i:longint;
  begin
    map[x,y]:=c2;inc(size);
    if bound then begin
      if x<x1 then x1:=x else if x>x2 then x2:=x;
      if y<y1 then y1:=y else if y>y2 then y2:=y;
    end;
    for i:=1 to ds do
      if map[x+dx[i],y+dy[i]] in c1 then
        floodfill(x+dx[i],y+dy[i]);
  end;
begin
  read(t);
  for u:=1 to t do begin
    read(n);
    for v:=1 to n do begin
      readln(h,w);
      for i:=1 to h do begin
        for j:=1 to w do read(map[i,j]);
        readln;
      end;
      for i:=0 to h+1 do begin
        map[i,0]:='.';map[i,w+1]:='.';
      end;
      for i:=1 to w do begin
        map[0,i]:='.';map[h+1,i]:='.';
      end;

      //Find largest block
      c1:=['x'];c2:='y';ds:=8;bound:=false;
      msize:=0;
      for i:=1 to h do
        for j:=1 to w do
          if map[i,j]='x' then begin
            size:=0;floodfill(i,j);
            if size>msize then begin
              msize:=size;mx:=i;my:=j;
            end;
          end;

      //Put a frame round largest block
      c1:=['y'];c2:='z';bound:=true;
      x1:=mx;x2:=mx;y1:=my;y2:=my;
      floodfill(mx,my);
      for i:=x1-1 to x2+1 do begin
        map[i,y1-2]:='z';map[i,y2+2]:='z';
        map[i,y1-1]:='.';map[i,y2+1]:='.';
      end;
      for i:=y1-1 to y2+1 do begin
        map[x1-2,i]:='z';map[x2+2,i]:='z';
        map[x1-1,i]:='.';map[x2+1,i]:='.';
      end;

      //Analyze largest block
      c1:=['.','y'];c2:='/';ds:=4;bound:=false;
      size:=0;floodfill(x1-1,y1-1);
      dec(size,(x2-x1+y2-y1+4)*2);
      area:=(x2-x1+1)*(y2-y1+1);
      if size*3<area then write('0')
        else if size*3>area*2 then write('x')
        else if size+msize<area then write('0') else write('x');
    end;
    writeln;
  end;
end.
