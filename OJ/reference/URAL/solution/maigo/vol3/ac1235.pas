program ural1235;
const
  maxn=100;
var
  x,y:array[1..maxn]of word;
  n,i,j,k:byte;
  w,h,a,b,ans:word;
function min(a,b:word):word;
  begin
    if a<b then min:=a else min:=b;
  end;
function max(a,b:word):word;
  begin
    if a>b then max:=a else max:=b;
  end;
procedure check(p,q:word);
  var
    size:word;
    i:byte;
  begin
    size:=min(w-p,h-q);
    for i:=1 to n do
      if (x[i]>p) and (y[i]>q) then
        size:=min(size,max(x[i]-p,y[i]-q));
    if size>ans then begin
      ans:=size;a:=p;b:=q;
    end;
  end;
begin
  read(n,w,h);
  for i:=1 to n do
    read(x[i],y[i]);
  check(0,0);
  for i:=1 to n do begin
    check(x[i],0);
    check(0,y[i]);
  end;
  for i:=1 to n do
    for j:=1 to n do
      if (x[i]<x[j]) and (y[i]>y[j]) then
        check(x[i],y[j]);
  writeln(a,' ',b,' ',ans);
end.
