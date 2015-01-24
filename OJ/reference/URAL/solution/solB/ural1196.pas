var
        h       :       array[1..15000] of longint;
        n,m,ans :       longint;
        i,j,k   :       longint;

function find(x:longint):boolean;
var
        l,r,mid     :       longint;
begin
  l:=1;
  r:=n;
  while l<=r do
    begin
      mid:=h[(l+r) shr 1];
      if x=mid then break;
      if x<mid then r:=(l+r) shr 1-1
               else l:=(l+r) shr 1+1;
    end;
  if (x=mid) then exit(true);
  exit(false);
end;

begin
  ans:=0;
  readln(n);
  for i:=1 to n do
    readln(h[i]);
  readln(m);
  for i:=1 to m do
    begin
      readln(k);
      if find(k) then inc(ans);
    end;
  writeln(ans);
end.