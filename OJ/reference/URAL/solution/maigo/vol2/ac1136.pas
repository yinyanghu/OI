program ural1136;
const
  maxn=3000;
var
  a:array[1..maxn]of word;
  n,i:word;
  first:boolean;
procedure process(s,t:word);
  var
    l,r,m:word;
  begin
    if s>t then exit;
    l:=s;r:=t;
    while l<r do begin
      m:=(l+r) div 2;
      if a[m]<a[t] then l:=m+1 else r:=m;
    end;
    process(l,t-1);
    process(s,l-1);
    if first then first:=false else write(' ');
    write(a[t]);
  end;
begin
  read(n);
  for i:=1 to n do
    read(a[i]);

  first:=true;
  process(1,n);
  writeln;
end.
