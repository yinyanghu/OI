//Written on 6454 -- Dec 27, 2005
program tsort;
const
  max=1000000;
var
  count:array[0..max]of longint;
  n,i,x:longint;
begin
  assign(output,'');rewrite(output);
    //With this trick runtime is reduced to just 10%!
  read(n);
  for i:=1 to n do begin
    read(x);inc(count[x]);
  end;
  for x:=0 to max do
    for i:=1 to count[x] do
      writeln(x);
  close(output);
end.
