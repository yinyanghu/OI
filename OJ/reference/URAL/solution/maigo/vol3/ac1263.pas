program ural1263;
const
  maxn=10000;
var
  vote:array[1..maxn]of word;
  n,m,i,x:word;
begin
  read(n,m);
  for i:=1 to m do begin
    read(x);
    inc(vote[x]);
  end;

  for i:=1 to n do
    writeln(vote[i]/m*100:0:2,'%');
end.
