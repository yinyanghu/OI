program ural1109;
const
  maxn=1000;
var
  g:array[1..maxn,1..maxn div 8]of byte;
  link,y:array[1..maxn]of integer;
  vx,vy:array[1..maxn]of boolean;
  m,n,i,s,t,ny:integer;
  k:longint;
procedure setedge(x,y:integer);
  var
    a,b:byte;
  begin
    a:=(y-1) shr 3+1;
    b:=(y-1) mod 8;
    g[x,a]:=g[x,a] or (1 shl b);
  end;
function adj(x,y:integer):boolean;
  var
    a,b:byte;
  begin
    a:=(y-1) shr 3+1;
    b:=(y-1) mod 8;
    adj:=odd(g[x,a] shr b);
  end;
function find(v:integer):boolean;
  var
    i:integer;
  begin
    vx[v]:=true;
    for i:=1 to n do
      if adj(v,y[i]) and not vy[y[i]] then begin
        vy[y[i]]:=true;
        if (link[y[i]]=0) or find(link[y[i]]) then begin
          if link[y[i]]=0 then ny:=i;
          find:=true;link[y[i]]:=v;exit;
        end;
      end;
    find:=false;
  end;
begin
  readln(m,n,k);
  for i:=1 to k do begin
    readln(s,t);
    setedge(s,t);
  end;

  fillchar(link,sizeof(link),0);
  for i:=1 to n do
    y[i]:=i;
  s:=0;
  for i:=1 to m do begin
    fillchar(vx,sizeof(vx),0);
    fillchar(vy,sizeof(vy),0);
    if find(i) then begin
      t:=y[ny];y[ny]:=y[n-s];y[n-s]:=t;
      inc(s);
    end;
  end;
  writeln(m+n-s);
end.
