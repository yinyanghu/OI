program ural1316;
const
  treesize=1048575;
  root=524288;
  maxd=262144;
var
  tree:array[1..treesize]of longint;
  x:real;
  y,k:longint;
  ans:int64;
  c:char;
  s:string;
function min(a,b:longint):longint;
  begin
    if a<b then min:=a else min:=b;
  end;
procedure modify(x,y:longint);
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
function above(x:longint):longint;
  var
    p,d,c:longint;
  begin
    p:=root;d:=maxd;c:=0;
    while p<>x do begin
      if p<x then
        inc(p,d)
      else begin
        inc(c,tree[p]-tree[p-d]);
        dec(p,d);
      end;
      d:=d shr 1;
    end;
    if odd(p) then above:=c+tree[p] else above:=c+tree[p]-tree[p-d];
  end;
begin
  repeat
    s:='';
    repeat
      read(c);
      if c=' ' then break;
      s:=s+c;
    until eoln;
    if s='BID' then begin
      readln(x);
      y:=round(x*100);
      modify(y,1);
    end
    else if s='DEL' then begin
      readln(x);
      y:=round(x*100);
      modify(y,-1);
    end
    else if s='SALE' then begin
      readln(x,k);
      y:=round(x*100);
      inc(ans,min(k,above(y)));
    end;
  until s='QUIT';
  writeln(ans/100:0:2);
end.
