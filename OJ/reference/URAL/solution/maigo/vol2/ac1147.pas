{$Q-,R-}
program ural1147;
const
  maxn=1000;
  maxcolor=2500;
var
  x1,y1,x2,y2,color:array[0..maxn]of word;
  area:array[1..maxcolor]of longint;
  n,i,now:longint;
procedure cal(l,r,b,t,z:longint);
  begin
    while (z<=n) and ((r<=x1[z]) or (l>=x2[z]) or (t<=y1[z]) or (b>=y2[z])) do inc(z);
    if z>n then begin inc(area[now],(r-l)*(t-b));exit;end;
    if l<x1[z] then begin cal(l,x1[z],b,t,z+1);l:=x1[z];end;
    if r>x2[z] then begin cal(x2[z],r,b,t,z+1);r:=x2[z];end;
    if b<y1[z] then cal(l,r,b,y1[z],z+1);
    if t>y2[z] then cal(l,r,y2[z],t,z+1);
  end;
begin
  read(x2[0],y2[0],n);
  x1[0]:=0;y1[0]:=0;color[0]:=1;
  for i:=1 to n do
    read(x1[i],y1[i],x2[i],y2[i],color[i]);

  for i:=n downto 0 do begin
    now:=color[i];
    cal(x1[i],x2[i],y1[i],y2[i],i+1);
  end;

  for i:=1 to maxcolor do
    if area[i]>0 then writeln(i,' ',area[i]);
end.
