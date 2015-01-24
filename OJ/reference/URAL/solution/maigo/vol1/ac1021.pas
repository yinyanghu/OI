program ural1021;
const
  maxn=50000;
  sac=10000;
var
  a,b:array[1..maxn]of integer;
  na,nb,i,j:word;
begin
  readln(na);
  for i:=1 to na do
    readln(a[i]);
  readln(nb);
  for i:=1 to nb do
    readln(b[i]);

  i:=1;j:=1;
  while (a[i]+b[j]<>sac) and (i<=na) and (j<=nb) do
    if a[i]+b[j]>sac then inc(j) else inc(i);

  if a[i]+b[j]=sac then writeln('YES') else writeln('NO');
end.
