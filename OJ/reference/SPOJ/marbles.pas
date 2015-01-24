//Written on 6130 -- Feb 6, 2005
program marbles;
var
  t,u,n,k,i:longint;
  ans:extended;
begin
  read(t);
  for u:=1 to t do begin
    read(n,k);
    ans:=0;
    for i:=1 to n-k do
      ans:=ans+ln(n-i)-ln(i);
    writeln(exp(ans):0:0);
  end;
end.
