program ural1032;
const
  maxn=10000;
var
  a:array[1..maxn]of word;
  p:array[1..maxn-1]of word;
    {p[i] is the position where i appears first in the remainder sequence}
  n,i,m:word;
procedure out(x,y:word);
  var
    i:integer;
  begin
    writeln(y-x+1);
    for i:=x to y do
      writeln(a[i]);
    halt;
  end;
begin
  fillchar(p,sizeof(p),0);
  read(n);m:=0;
  for i:=1 to n do begin
    read(a[i]);
    m:=(m+a[i]) mod n;
    if m=0 then out(1,i);
    if p[m]=0 then p[m]:=i else out(p[m]+1,i);
  end;
end.
