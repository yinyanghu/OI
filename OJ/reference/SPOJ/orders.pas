//Written on 6124 -- Jan 31, 2005
program orders;
const
  maxn=200000;
  treesize=262143;
var
  tree:array[1..treesize]of longint;
  a:array[1..maxn]of longint;
  t,u,n,root,maxd,i:longint;
function min(a,b:longint):longint;
  begin
    if a<b then min:=a else min:=b;
  end;
function max(a,b:longint):longint;
  begin
    if a>b then max:=a else max:=b;
  end;
procedure filltree(p,s,e,d:longint);
  begin
    inc(tree[p],e-s+1);
    if d>0 then begin
      if s<p then filltree(p-d,s,min(e,p-1),d shr 1);
      if e>p then filltree(p+d,max(s,p+1),e,d shr 1);
    end;
  end;
function find(x:longint):longint;
  var
    p,d,c1{right child},c2{right child & itself}:longint;
  begin
    p:=root;d:=maxd;
    repeat
      if d=0 then begin
        c1:=0;c2:=1;
      end
      else begin
        c1:=tree[p+d];c2:=tree[p]-tree[p-d];
      end;
      if x>=c2 then begin
        dec(x,c2);
        dec(tree[p]);
        dec(p,d);
      end
      else if x=c1 then
        break
      else begin
        dec(tree[p]);
        inc(p,d);
      end;
      d:=d shr 1;
    until false;
    dec(tree[p]);
    find:=p;
  end;
begin
  read(t);
  for u:=1 to t do begin
    read(n);
    root:=1;
    while root<=n do
      root:=root*2;
    root:=root shr 1;
    maxd:=root shr 1;

    filltree(root,1,n,maxd);
    for i:=1 to n do
      read(a[i]);
    for i:=n downto 1 do
      a[i]:=find(a[i]);
    for i:=1 to n-1 do
      write(a[i],' ');
    writeln(a[n]);
  end;
end.
