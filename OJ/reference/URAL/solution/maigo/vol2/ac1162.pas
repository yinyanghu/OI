program ural1162;
const
  maxn=100;
  maxm=100;
var
  v1,v2:array[1..maxm]of byte;
  r1,c1,r2,c2:array[1..maxm]of real;
  money:array[1..maxn]of real;
  n,m,s,i,j:byte;
procedure go(a,b:byte;r,c:real);
  var
    t:real;
  begin
    t:=(money[a]-c)*r;
    if t>money[b] then
      if i=n then begin
        writeln('YES');
        halt;
      end
      else
        money[b]:=t;
  end;
begin
  read(n,m,s,money[s]);
  for i:=1 to m do
    read(v1[i],v2[i],r1[i],c1[i],r2[i],c2[i]);
  for i:=1 to n do
    for j:=1 to m do begin
      go(v1[j],v2[j],r1[j],c1[j]);
      go(v2[j],v1[j],r2[j],c2[j]);
    end;
  writeln('NO');
end.
