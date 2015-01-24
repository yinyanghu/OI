var
        n,m     :       longint;
        i,j     :       longint;
        ans     :       array[1..10000] of longint;
begin
  readln(n,m);
  fillchar(ans,sizeof(ans),0);
  for i:=1 to m do
    begin
      readln(j);
      inc(ans[j]);
    end;
  for i:=1 to n do
      writeln(ans[i]/m*100:0:2,'%');
end.