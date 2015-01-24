//Written on 6117 -- Jan 24, 2005
program divsum;
const
  maxn=500000;
var
  ans:array[1..maxn]of longint;
  t,i,j:longint;
begin
  for i:=1 to maxn do begin
    j:=i*2;
    while j<=maxn do begin
      inc(ans[j],i);
      inc(j,i);
    end;
  end;

  read(t);
  for i:=1 to t do begin
    read(j);
    writeln(ans[j]);
  end;
end.
