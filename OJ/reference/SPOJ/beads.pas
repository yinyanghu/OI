//Written on 6434 -- Dec 7, 2005
program beads;
const
  maxn=20000;
var
  c:array[1..maxn]of char;
  t,u,n,i,j,k:longint;
begin
  readln(t);
  for u:=1 to t do begin
    n:=0;repeat inc(n);read(c[n]);until eoln;readln;
    for i:=1 to n do c[n+i]:=c[i];
    i:=1;j:=2;
    while j<=n do begin
      k:=0;while (k<n) and (c[i+k]=c[j+k]) do inc(k);
      if k=n then break;
      if c[i+k]<c[j+k] then
        inc(j,k+1)
      else begin
        i:=j;inc(j);
      end;
    end;
    writeln(i);
  end;
end.
