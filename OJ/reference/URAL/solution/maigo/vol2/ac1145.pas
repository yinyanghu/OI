program ural1145;
const
  size=1000;
  qsize=50000;{I'm not sure how large the queue can be at most.
               With this number I got AC with 989KB memory, while the limit
               is 1000KB!}
  e:array[0..7]of byte=(1,2,4,8,16,32,64,128);
var
  map,v:array[1..size,0..size shr 3-1]of byte;
  qx,qy:array[1..qsize]of integer;
  m,n,i,j,a,b:integer;
  f,r,level:longint;
  c:char;
procedure setfree(x,y:integer);
  var
    r:byte;
  begin
    a:=x;b:=y;
    r:=y mod 8;y:=y shr 3;
    map[x,y]:=map[x,y] or e[r];
  end;
procedure setv(x,y:integer);
  var
    r:byte;
  begin
    r:=y mod 8;y:=y shr 3;
    v[x,y]:=v[x,y] or e[r];
  end;
function free(x,y:integer):boolean;
  var
    r:byte;
  begin
    if (x<1) or (x>m) or (y<0) or (y>n) then begin
      free:=false;exit;
    end;
    r:=y mod 8;y:=y shr 3;
    free:=(map[x,y] and e[r]>0) and (v[x,y] and e[r]=0);
  end;
procedure go(x,y:integer);
  begin
    if free(x,y) then begin
      if r<qsize then inc(r) else r:=1;
      qx[r]:=x;qy[r]:=y;setv(x,y);
    end;
  end;
procedure bfs(a,b:integer);
  var
    p:longint;
  begin
    fillchar(v,sizeof(v),0);
    f:=0;r:=0;go(a,b);level:=0;p:=1;
    repeat
      if f<qsize then inc(f) else f:=1;
      go(qx[f]-1,qy[f]);
      go(qx[f]+1,qy[f]);
      go(qx[f],qy[f]-1);
      go(qx[f],qy[f]+1);
      if f=p then begin inc(level);p:=r;end;
    until f=r;
  end;
begin
  read(n,m);dec(n);
  for i:=1 to m do begin
    readln;
    for j:=0 to n do begin
      read(c);
      if c='.' then setfree(i,j);
    end;
  end;

  bfs(a,b);
  bfs(qx[r],qy[r]);
  writeln(level-1);
end.
