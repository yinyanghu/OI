program ural1035;
const
  maxn=200;
  maxm=200;
type
  map=array[0..maxn+1,0..maxm+1]of boolean;
var
  fp,fn,rp,rn:map;
  v:array[0..maxn,0..maxm]of boolean;
  deg:array[0..maxn,0..maxn]of byte;
  n,m,i,j,f,r:byte;
  count,ans:longint;
procedure readmap(var pie,na:map);
  var
    c:char;
  begin
    for i:=1 to n do begin
      for j:=1 to m do begin
        read(c);
        if c in ['/','X'] then pie[i,j]:=true;
        if c in ['\','X'] then na[i,j]:=true;
      end;
      readln;
    end;
  end;
procedure floodfill(x,y:byte);
  begin
    if v[x,y] then exit;
    v[x,y]:=true;
    inc(count,deg[x,y]);
    if fn[x,y] or rn[x,y] then floodfill(x-1,y-1);
    if fn[x+1,y+1] or rn[x+1,y+1] then floodfill(x+1,y+1);
    if fp[x+1,y] or rp[x+1,y] then floodfill(x+1,y-1);
    if fp[x,y+1] or rp[x,y+1] then floodfill(x-1,y+1);
  end;
begin
  readln(n,m);
  readmap(fp,fn);
  readmap(rp,rn);

  for i:=0 to n do
    for j:=0 to m do begin
      f:=0;r:=0;
      if fn[i,j] then inc(f);if rn[i,j] then inc(r);
      if fn[i+1,j+1] then inc(f);if rn[i+1,j+1] then inc(r);
      if fp[i+1,j] then inc(f);if rp[i+1,j] then inc(r);
      if fp[i,j+1] then inc(f);if rp[i,j+1] then inc(r);
      if f+r=0 then v[i,j]:=true else deg[i,j]:=abs(f-r);
    end;

  for i:=0 to n do
    for j:=0 to m do
      if not v[i,j] then begin
        count:=0;
        floodfill(i,j);
        if count=0 then inc(ans) else inc(ans,count div 2);
      end;

  writeln(ans);
end.
