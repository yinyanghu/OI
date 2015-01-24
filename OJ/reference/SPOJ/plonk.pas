//Written on 6182 -- Mar 30, 2005
program plonk;
const
  maxn=10000;
type
  list=array[1..maxn]of longint;
var
  x,y,cx,cy,sx,sy:list;
  t,u,n,i,px,py,d,ans:longint;
procedure qsort(var a:list;s,t:word);
  var
    p,i,j,tmp:longint;
  begin
    if s>=t then exit;
    p:=s+random(t-s+1);
    tmp:=a[p];a[p]:=a[s];
    i:=s;j:=t;
    repeat
      while (i<j) and (a[j]>=tmp) do dec(j);
      if i=j then break;a[i]:=a[j];inc(i);
      while (i<j) and (a[i]<=tmp) do inc(i);
      if i=j then break;a[j]:=a[i];dec(j);
    until i=j;
    a[i]:=tmp;
    qsort(a,s,i-1);
    qsort(a,i+1,t);
  end;
function search(var a:list;x:longint):word;
  var
    l,r,m:word;
  begin
    l:=1;r:=n;
    repeat
      m:=(l+r) shr 1;
      if a[m]=x then break else if a[m]<x then l:=m+1 else r:=m-1;
    until false;
    search:=m;
  end;
begin
  read(t);
  for u:=1 to t do begin
    read(n);
    for i:=1 to n do begin
      read(x[i],y[i]);cx[i]:=x[i];cy[i]:=y[i];
    end;
    qsort(cx,1,n);qsort(cy,1,n);
    sx[1]:=cx[1];for i:=2 to n do sx[i]:=sx[i-1]+cx[i];
    sy[1]:=cy[1];for i:=2 to n do sy[i]:=sy[i-1]+cy[i];
    ans:=maxlongint;
    for i:=1 to n do begin
      px:=search(cx,x[i]);py:=search(cy,y[i]);
      d:=(x[i]*(2*px-n)+sx[n]-2*sx[px])+(y[i]*(2*py-n)+sy[n]-2*sy[py]);
      if d<ans then ans:=d;
    end;
    writeln(ans);
  end;
end.
