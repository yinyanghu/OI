program ural1126;
const
  maxm=14000;
  treesize=131071;
  root=65536;
  maxd=32768;
var
  tree:array[1..treesize]of longint;
  a:array[0..maxm-1]of longint;
  m,i:word;
  x:longint;
procedure modify(x:longint;y:shortint);
  var
    p,d:longint;
  begin
    p:=root;d:=maxd;
    while p<>x do begin
      inc(tree[p],y);
      if p<x then inc(p,d) else dec(p,d);
      d:=d shr 1;
    end;
    inc(tree[p],y);
  end;
function max:longint;
  var
    p,d:longint;
  begin
    p:=root;d:=maxd;
    repeat
      if tree[p+d]>0 then
        inc(p,d)
      else if tree[p]>tree[p-d] then
        break
      else
        dec(p,d);
      d:=d shr 1;
    until odd(p);
    max:=p;
  end;
begin
  read(m);
  repeat
    read(x);
    if x=-1 then halt;
    inc(x);inc(i);
    if i>m then modify(a[i mod m],-1);
    a[i mod m]:=x;modify(x,1);
    if i>=m then writeln(max-1);
  until false;
end.
