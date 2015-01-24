program ural1303;
const
  maxm=5000;
var
  l,a:array[0..maxm]of longint;
  m,i,j,x,r,now,s:longint;
begin
  read(m);
  for i:=1 to m do
    l[i]:=m;
  repeat
    read(i,j);
    if j<=0 then continue;
    if j>m then x:=m else x:=j;
    if i<l[x] then begin
      l[x]:=i;
      if x=m then r:=j;
    end;
  until (i=0) and (j=0);

  repeat
    x:=m;
    while l[x]>now do dec(x);
    if x=now then begin
      writeln('No solution');
      halt;
    end;
    inc(s);
    a[s]:=x;
    now:=x;
  until now=m;

  writeln(s);
  for i:=1 to s do begin
    write(l[a[i]],' ');
    if a[i]=m then writeln(r) else writeln(a[i]);
  end;
end.
