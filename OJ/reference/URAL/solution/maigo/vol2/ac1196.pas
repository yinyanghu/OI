program ural1196;
const
  maxn=15000;
var
  year:array[1..maxn]of longint;
  n:integer;
  m,i,x,c:longint;
procedure search(x:longint);
  var
    l,r,p:integer;
  begin
    l:=1;r:=n;
    repeat
      m:=(l+r) div 2;
      if year[m]=x then begin
        inc(c);
        exit;
      end
      else if year[m]>x then
        r:=m-1
      else
        l:=m+1
    until l>r;
  end;
begin
  readln(n);
  for i:=1 to n do
    readln(year[i]);
  readln(m);
  c:=0;
  for i:=1 to m do begin
    readln(x);
    search(x);
  end;
  writeln(c);
end.
