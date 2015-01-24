program ural1298;
const
  dx:array[1..8]of shortint=(-2,-1,-2,1,-1,2,1,2);
  dy:array[1..8]of shortint=(-1,-2,1,-2,2,-1,2,1);
  maxn=8;
var
  v:array[1..maxn,1..maxn]of boolean;
  way:array[1..maxn,1..maxn]of shortint;
  px,py:array[1..maxn*maxn]of shortint;
  n,sqrn,i,j,k:shortint;
function inside(x,y:shortint):boolean;
  begin
    inside:=(x>=1) and (x<=n) and (y>=1) and (y<=n);
  end;
procedure out;
  var
    i:shortint;
  begin
    for i:=1 to sqrn do
      writeln(chr(96+px[i]),py[i]);
    halt;
  end;
procedure search(l,x,y:shortint);
  var
    nx,ny:array[1..8]of shortint;
    i,j,c,t:shortint;
  begin
    px[l]:=x;py[l]:=y;
    if l=sqrn then out;
    c:=0;
    for i:=1 to 8 do
      if inside(x+dx[i],y+dy[i]) and not v[x+dx[i],y+dy[i]] then begin
        inc(c);nx[c]:=x+dx[i];ny[c]:=y+dy[i];
      end;
    for i:=1 to c-1 do
      for j:=i+1 to c do
        if way[nx[i],ny[i]]>way[nx[j],ny[j]] then begin
          t:=nx[i];nx[i]:=nx[j];nx[j]:=t;
          t:=ny[i];ny[i]:=ny[j];ny[j]:=t;
        end;
    v[x,y]:=true;
    for i:=1 to 8 do
      if inside(x+dx[i],y+dy[i]) then
        dec(way[x+dx[i],y+dy[i]]);
    for i:=1 to c do
      search(l+1,nx[i],ny[i]);
    v[x,y]:=false;
    for i:=1 to 8 do
      if inside(x+dx[i],y+dy[i]) then
        inc(way[x+dx[i],y+dy[i]]);
  end;
begin
  read(n);sqrn:=sqr(n);
  for i:=1 to n do
    for j:=1 to n do
      for k:=1 to 8 do
        if inside(i+dx[k],j+dy[k]) then inc(way[i,j]);

  for i:=1 to (n+1) shr 1 do
    for j:=1 to (n+1) shr 1 do
      search(1,i,j);
  writeln('IMPOSSIBLE');
end.
