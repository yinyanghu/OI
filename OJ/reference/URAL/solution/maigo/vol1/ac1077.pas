program ural1077;
const
  maxn=200;
  maxt=(maxn-1)*(maxn-2) shr 1;
var
  map:array[1..maxn,1..maxn]of boolean;
  lv:array[1..maxn]of byte;
  path:array[1..maxn,1..maxn]of byte;
  n,m,i,x,y,s:longint;
procedure dfs(x:byte);
  var
    i:byte;
  begin
    for i:=1 to n do
      if map[x,i] and (lv[i]=0) then begin
        map[x,i]:=false;map[i,x]:=false;dec(m);
        lv[i]:=lv[x]+1;
        path[i]:=path[x];path[i,lv[i]]:=i;
        dfs(i);
      end;
  end;
begin
  read(n,m);
  for i:=1 to m do begin
    read(x,y);
    map[x,y]:=true;map[y,x]:=true;
  end;

  for i:=1 to n do
    if lv[i]=0 then begin
      lv[i]:=1;path[i,1]:=i;
      dfs(i);
    end;

  writeln(m);
  for x:=1 to n-1 do
    for y:=x+1 to n do
      if map[x,y] then begin
        s:=2;while path[x,s]=path[y,s] do inc(s);
        write(lv[x]+lv[y]-s*2+3);
        for i:=lv[x] downto s do write(' ',path[x,i]);
        for i:=s-1 to lv[y] do write(' ',path[y,i]);
        writeln;
      end;
end.
