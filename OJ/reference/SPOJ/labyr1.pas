//Written on 6144 -- Feb 20, 2005
program labyr1;
const
  maxsize=1000;
  maxfree=500500;
  dx:array[1..4]of shortint=(0,0,1,-1);
  dy:array[1..4]of shortint=(1,-1,0,0);
var
  map:array[0..maxsize+1,0..maxsize+1]of char;
  qx,qy:array[1..maxfree]of word;
  dist:array[1..maxfree]of longint;
  t,u,w,h,i,j,f,r,ans:longint;
procedure floodfill(x,y:longint;c1,c2:char);
  var
    d,a,b:longint;
  begin
    f:=0;r:=1;qx[1]:=x;qy[1]:=y;dist[1]:=0;map[x,y]:=c2;
    repeat
      inc(f);x:=qx[f];y:=qy[f];
      for d:=1 to 4 do begin
        a:=x+dx[d];b:=y+dy[d];
        if map[a,b]=c1 then begin
          inc(r);qx[r]:=a;qy[r]:=b;dist[r]:=dist[f]+1;map[a,b]:=c2;
        end;
      end;
    until f=r;
  end;
begin
  read(t);
  for u:=1 to t do begin
    readln(w,h);
    for i:=1 to w do begin
      map[0,i]:='#';map[h+1,i]:='#';
    end;
    for i:=1 to h do begin
      map[i,0]:='#';
      for j:=1 to w do begin
        read(map[i,j]);
      end;
      map[i,w+1]:='#';
      readln;
    end;

    ans:=0;
    for i:=1 to h do
      for j:=1 to w do
        if map[i,j]='.' then begin
          floodfill(i,j,'.','1');
          floodfill(qx[r],qy[r],'1','2');
          if dist[r]>ans then ans:=dist[r];
        end;
    writeln('Maximum rope length is ',ans,'.');
  end;
end.
